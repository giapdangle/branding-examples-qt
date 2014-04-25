/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "../"
import "../InfoTexts.js" as InfoTexts

Page {
    id: page

    Image{
        anchors.fill: parent
        source: "Graphics/graf_mykahvi_splash_bg.svg"
        fillMode: Image.TileVertically
    }

    Item {
        id: name
        anchors.left: parent.left
        anchors.leftMargin: 2 * platformStyle.paddingLarge
        anchors.top: parent.top
        anchors.topMargin: parent.width < parent.height ? (window.height - height) / 2 : platformStyle.paddingLarge
        height: childrenRect.height

        Label{
            id: text

            anchors.left: parent.left
            text: "Welcome to"
            color: "#9E705C"
            font.pixelSize: 46
        }

        Image{
            anchors.top: text.bottom
            anchors.left: parent.left
            source: "Graphics/graf_mykahvi_logo.svg"
        }
    }

    KahviProgressBar{
        id: progressBar
        anchors.top: parent.top
        anchors.topMargin: window.height - 170

        anchors.left: parent.left
        anchors.right: parent.right

        Timer{
            id: progessTimer
            interval: 500
            repeat: true

            onTriggered: {
                progressBar.currentStep++

                if(progressBar.currentStep > progressBar.maxValue){
                    progessTimer.stop()
                    pageStack.push(Qt.resolvedUrl("Page2.qml"))
                }
            }
        }
    }

    Item{
        anchors.left: parent.left
        anchors.top: progressBar.bottom
        width: 60
        height: 60

        Image{
            anchors.centerIn: parent
            source: "Graphics/mykahvi_back.svg"
        }

        MouseArea{
            anchors.fill: parent

            onClicked: pageStack.pop()
        }
    }

    onStatusChanged: {
        if(status == PageStatus.Deactivating)
            window.showToolBar = true;
        else if(status == PageStatus.Activating)
            window.showToolBar = false;
    }

    Component.onCompleted: {
        progessTimer.start();
    }
}
