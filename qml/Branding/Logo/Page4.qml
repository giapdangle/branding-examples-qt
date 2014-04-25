/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
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
            iconSource: enabled ? "../Images/Icons/toolbar_next.svg" : "../Images/Icons/toolbar_next_disabled.svg"
            enabled: false
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.LOGO_INFO_TEXT})
        }
    }

    ListModel {
        id: dataModel

        ListElement {
            title: "List title #1"
            imageSource: "Graphics/icon_list_1.svg"
        }

        ListElement {
            title: "List title #2"
            imageSource: "Graphics/icon_list_2.svg"
        }

        ListElement {
            title: "List title #3"
            imageSource: "Graphics/icon_list_3.svg"
        }
    }

    Component {
        id: delegate

        CustomListItem {
            id: listItem

            subItemIndicator: true
            platformInverted: true

            Image{
                id: itemImage
                anchors.left: parent.left
                anchors.top: parent.top
                height: parent.height + 1
                width: height
                source: imageSource
            }

            Column{
                anchors.left: itemImage.right
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.verticalCenter: parent.verticalCenter

                ListItemText {
                    text: title
                    role: "Title"
                    platformInverted: true
                }
            }
        }
    }

    Image{
        anchors.fill: parent
        width: parent.width
        source: "Graphics/graf_bg.svg"
    }

    Image{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        source: "Graphics/graf_logo.svg"
    }

    ListHeading{
        id: heading
        anchors.top: parent.top

        Image{
            anchors.fill: parent
            source: "Graphics/qtg_rf_list_heading_normal.svg"
        }

        Label{
            anchors.right: parent.right
            anchors.rightMargin: platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter
            text: "Main menu"
        }
    }

    ListView {
        id: listView
        anchors.top: heading.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        model: dataModel
        delegate: delegate
        clip: true
    }

    CustomQueryDialog{
        id: dialog
        titleText: "Title"
        message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum\n"
        icon: "Graphics/icon_infobanner_info.svg"
        acceptButtonText: "Previous"

        onAccepted: pageStack.pop()
    }

    onStatusChanged: {
        if(status == PageStatus.Activating)
            dialog.open();
        else if(status == PageStatus.Deactivating)
            dialog.close();
    }
}
