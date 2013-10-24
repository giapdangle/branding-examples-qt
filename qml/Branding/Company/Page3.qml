/**
 * Copyright (c) 2012 Nokia Corporation.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "../"
import "CustomComponents"
import "../InfoTexts.js" as InfoTexts

Page {
    id: page
    tools:  toolBar

    ToolBarLayout {
        id: toolBar

        ToolButton {
            flat: true
            iconSource: "Graphics/toolbar_back.svg"
            onClicked: pageStack.pop(null)
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/toolbar_prev_company.svg"
            onClicked: pageStack.pop();
        }

        ToolButton {
            flat: true
            iconSource: enabled ? "../Images/Icons/toolbar_next_company.svg" : "../Images/Icons/toolbar_next_disabled_company.svg"
            enabled: false
        }


        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide_company.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.COMPANY_INFO_TEXT})
        }
    }

    Item{
        id: heading
        anchors.top: parent.top
        height: 30
        width: parent.width
        clip: true

        Image {
            id: name
            anchors.fill: parent
            source: "Graphics/list_heading_normal.svg"
        }

        Image {
            anchors.right: parent.right
            anchors.rightMargin: platformStyle.paddingMedium
            anchors.verticalCenter: parent.verticalCenter
            height: 40
            fillMode: Image.PreserveAspectFit
            source: "Graphics/graf_logo_company.svg"
        }
    }

    Item{
        anchors.top: heading.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: platformStyle.paddingLarge
        height: childrenRect.height

        Label{
            id: headerLabel

            anchors.top: parent.top
            anchors.topMargin: 2 * platformStyle.paddingLarge

            font.pixelSize: 24
            color: "#FAEC21"
            text: "Header"
        }

        Label{
            id: textField

            anchors.top: headerLabel.bottom
            anchors.topMargin: platformStyle.paddingLarge

            font.pixelSize: 18
            wrapMode: Text.WordWrap
            width: parent.width - 2 * platformStyle.paddingLarge
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id sollicitudin arcu. In condimentum gravida massa, quis ultricies mauris consectetur eget."
        }

        ButtonRow{
            anchors.top: textField.bottom
            anchors.topMargin: 4 * platformStyle.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width

            CustomButton{
                text: "Label#1"

                onClicked: {
                    showBanner(text + " button clicked", "")
                }
            }

            CustomButton{
                text: "Label#2"

                onClicked: {
                    showBanner(text + " button clicked", "")
                }
            }

            CustomButton{
                text: "Label#3"

                onClicked: {
                    showBanner(text + " button clicked", "")
                }
            }
        }
    }
}
