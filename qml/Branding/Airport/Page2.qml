/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "../"
import "CustomComponents"
import "../InfoTexts.js" as InfoTexts

Page {
    id: page2
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
            iconSource: enabled ? "../Images/Icons/toolbar_prev.svg" : "../Images/Icons/toolbar_prev_disabled.svg"
            onClicked: pageStack.pop(null);
            enabled: false
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/toolbar_next.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.AIRPORT_INFO_TEXT})
        }
    }

    Image{
        id: header
        anchors.top: parent.top
        width: parent.width
        source: "Graphics/qtg_rf_list_heading_normal.svg"

        Label{
            anchors.right: parent.right
            anchors.rightMargin: platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter
            text: "Internet Check-In"
            color: "#1B1464"
        }
    }

    Image{
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        source: "Graphics/graf_bg.png"
    }

    Item{
        anchors.left: parent.left
        anchors.leftMargin: platformStyle.paddingLarge
        anchors.right: parent.right
        anchors.rightMargin: platformStyle.paddingLarge
        anchors.top: header.bottom
        anchors.topMargin: platformStyle.paddingMedium
        anchors.bottom: parent.bottom
        width: parent.width

        Label{
            id: userNameLabel
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: platformStyle.paddingMedium
            color: "#282828"
            text: "Username"
        }

        TextField{
            id: userNameInput
            anchors.top: userNameLabel.bottom
            anchors.topMargin: platformStyle.paddingMedium
            width: parent.width
            placeholderText: "Enter username"
        }

        Label{
            id: passwordLabel
            anchors.top: userNameInput.bottom
            anchors.topMargin: platformStyle.paddingLarge
            anchors.left: parent.left
            anchors.leftMargin: platformStyle.paddingMedium
            color: "#282828"
            text: "Password"
        }

        TextField{
            id: passwordInput
            anchors.top: passwordLabel.bottom
            anchors.topMargin: platformStyle.paddingMedium
            width: parent.width
            echoMode: TextInput.Password
            placeholderText: "Enter password"
        }

        CustomCheckBox{
            id: checkBox
            anchors.top: passwordInput.bottom
            anchors.topMargin: 2 * platformStyle.paddingLarge
            anchors.left: parent.left
            anchors.leftMargin: platformStyle.paddingMedium

            checked: true
        }

        Label{
            anchors.left: checkBox.right
            anchors.leftMargin: platformStyle.paddingMedium
            anchors.verticalCenter: checkBox.verticalCenter

            color: "#282828"
            text: "Remember password"
        }
    }
}
