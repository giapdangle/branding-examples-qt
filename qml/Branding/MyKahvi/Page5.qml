/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "../"
import "../InfoTexts.js" as InfoTexts

Page {
    id: page
    tools:  toolBar

    ToolBarLayout {
        id: toolBar

        ToolButton {
            flat: true
            iconSource: "toolbar-back"
            onClicked: pageStack.pop(null)
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/toolbar_prev.svg"
            onClicked: pageStack.pop();
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/toolbar_next.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.MYKAHVI_INFO_TEXT})
        }
    }

    QueryDialog{
        id: dialog
        titleText: "Title"
        message: "Lorem ipsum dolor sit amet, cnsectetur adipisicing elit, eiusmod.\n"
        icon: "Graphics/small_info.svg"
        acceptButtonText: "Previous"

        onAccepted: pageStack.pop();
    }

    onStatusChanged: {
        if(status == PageStatus.Activating)
            dialog.open()
        if(status == PageStatus.Deactivating)
            dialog.close()
    }
}
