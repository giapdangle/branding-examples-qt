/**
 * Copyright (c) 2012 Nokia Corporation.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
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
            iconSource: "../Images/Icons/toolbar_next.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"));
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

    TumblerColumn {
        id: firstColumn
        items: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                "U", "V", "W", "X", "Y", "Z"]
    }

    TumblerColumn {
        id: secondColumn
        items: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    }

    CustomTumblerDialog {
        id: dialog
        titleText: "Title"
        acceptButtonText: "Previous"
        rejectButtonText: "Next"
        columns: [ firstColumn, secondColumn]

        onAccepted: pageStack.pop()
        onRejected: pageStack.push(Qt.resolvedUrl("Page4.qml"));
    }

    onStatusChanged: {
        if(status == PageStatus.Activating)
            dialog.open();
        else if(status == PageStatus.Deactivating)
            dialog.close();
    }
}
