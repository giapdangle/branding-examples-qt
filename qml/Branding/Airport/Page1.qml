/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "../"

Page {
    id: page

    anchors.bottom: parent.bottom

    Image{
        anchors.fill: parent
        source: "Graphics/graf_blue_bg.png"
        fillMode: Image.TileVertically

        Image{
            id: bg1
            anchors.top: parent.top
            x: 50

            source: "Graphics/graf_clouds_bg_1.png"
            Behavior on x { NumberAnimation { duration: 3000 } }
        }

        Image{
            id: bg2
            anchors.top: bg1.top
            anchors.left: bg1.left

            source: "Graphics/graf_clouds_bg_2.png"
        }

        Image{
            anchors.top: parent.top
            anchors.topMargin: 8 * platformStyle.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter

            source: "Graphics/graf_logo_splashscreen.png"
        }

        Image{
            id: cloud2
            anchors.top: parent.top
            x: 50

            source: "Graphics/graf_cloud_2.png"

            Behavior on x { NumberAnimation { duration: 3000 } }
        }

        Image{
            id: cloud1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            x: 300

            source: "Graphics/graf_cloud_1.png"

            Behavior on x { NumberAnimation { duration: 3000 } }
        }

        Label{
            id: label
            anchors.top: parent.top
            anchors.topMargin: window.height - 10 * platformStyle.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter

            font.italic: true
            text: "\"Lorem ipsum dolor sit amet\""
        }

        Item{
            anchors.left: parent.left
            anchors.top: label.bottom
            anchors.topMargin: platformStyle.paddingLarge
            width: 50
            height: 60

            Image{
                anchors.centerIn: parent
                source: "Graphics/graf_back.svg"
            }

            MouseArea{
                anchors.fill: parent

                onClicked: pageStack.pop()
            }
        }
    }

    Timer{
        id: timer
        interval: 3000

        onTriggered: {
            pageStack.push(Qt.resolvedUrl("Page2.qml"));
        }
    }

    onStatusChanged: {
        if(status == PageStatus.Deactivating)
            window.showToolBar = true;
        else if(status == PageStatus.Activating)
            window.showToolBar = false;
    }

    Component.onCompleted: {
        timer.start()
        cloud1.x = -150
        cloud2.x = -200
        bg1.x = -80
    }
}
