/**
 * Copyright (c) 2012 Nokia Corporation.
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

    Flickable{
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        contentHeight: flickItem.height + logo.anchors.topMargin

        Item{
            id: flickItem
            width: parent.width
            height: childrenRect.height

            ListHeading{
                id: heading

                Image{
                    anchors.fill: parent
                    source: "Graphics/graf_view_heading_small.svg"
                }

                Label{
                    anchors.left: parent.left
                    anchors.leftMargin: platformStyle.paddingLarge
                    anchors.verticalCenter: parent.verticalCenter
                    text: "About"
                }
            }

            Image{
                id: logo
                anchors.top: parent.top
                anchors.topMargin: 4 * platformStyle.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit

                source: "Graphics/graf_mykahvi_logo_large.svg"
            }

            Label{
                id: text

                anchors.top: logo.bottom
                anchors.topMargin: 2 * platformStyle.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                width: parent.width - 2 * platformStyle.paddingLarge

                text: "My Kahvi is lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id sollicitudin arcu. In condimentum gravida massa, quis ultricies mauris consectetur eget."
            }

            ListItem {
                id: listItem1
                anchors.top: text.bottom
                anchors.topMargin: 2 * platformStyle.paddingLarge
                subItemIndicator: true

                Rectangle {
                    id: line
                    height: 1
                    width: parent.width
                    anchors.top: parent.top

                    color: platformStyle.colorDisabledMid
                }

                ListItemText {
                    id: listText
                    anchors.left: parent.left
                    anchors.leftMargin: platformStyle.paddingLarge
                    anchors.verticalCenter: parent.verticalCenter
                    role: "Title"
                    text: "Visit web site"
                }

                onClicked: {
                    showBanner("Web site opens", "")
                }
            }

            ListItem {
                id: listItem2
                anchors.top: listItem1.bottom

                subItemIndicator: true

                ListItemText {
                    anchors.left: parent.left
                    anchors.leftMargin: platformStyle.paddingLarge
                    anchors.verticalCenter: parent.verticalCenter
                    role: "Title"
                    text: "Visit My Kahvi Youtube channel"
                }

                onClicked: {
                    showBanner("MyKahvi youtube channel opens", "")
                }
            }
        }
    }
}
