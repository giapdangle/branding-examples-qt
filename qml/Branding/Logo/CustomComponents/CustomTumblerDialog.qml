/****************************************************************************
**
** Copyright (c) 2011-2014 Microsoft Mobile and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Components project.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import "Constants.js" as C
import "TumblerIndexHelper.js" as IH

CustomCommonDialog {
    id: root

    property alias columns: tumbler.columns
    property string acceptButtonText
    property string rejectButtonText

    content: Item {
        id: content
        height: tumbler.height + platformStyle.paddingLarge * 2
        width: parent.width

        CustomTumbler {
            id: tumbler
            anchors.centerIn: parent
            height: privateStyle.menuItemHeight * 4
            width: parent.width - platformStyle.paddingMedium * 4
            privateDelayInit: true
            platformInverted: root.platformInverted
            states: State {
                when: screen.currentOrientation == Screen.Landscape || screen.currentOrientation == Screen.LandscapeInverted
                PropertyChanges {
                    target: tumbler; height: privateStyle.menuItemHeight * 3
                }
            }
        }
    }

    QtObject {
        id: internal
        property bool init: true

        function updateButtonTexts() {
            var newButtonTexts = []
            if (acceptButtonText)
                newButtonTexts.push(acceptButtonText)
            if (rejectButtonText)
                newButtonTexts.push(rejectButtonText)
            root.buttonTexts = newButtonTexts
        }
    }

    onStatusChanged: {
        if (status == DialogStatus.Opening) {
            tumbler.privateInitialize();

            if (internal.init) {
                IH.saveIndex(tumbler);
                internal.init = false;
            }
            else {
                // restore index when dialog was canceled.
                // another case is when dialog was closed while tumbler was
                // still rotating (Qt sets the index to the last rotated
                // number, need to retore to a previously saved index in
                // this case)
                IH.restoreIndex(tumbler);
            }
        }
    }

    onButtonClicked: (acceptButtonText && index == 0) ? accept() : reject()

    onAccepted: {
        tumbler.privateForceUpdate();
        IH.saveIndex(tumbler);
    }
    onAcceptButtonTextChanged: internal.updateButtonTexts()
    onRejectButtonTextChanged: internal.updateButtonTexts()
}
