/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "CustomComponents"
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
            text: "Location"
            color: "#1B1464"
        }
    }

    Image{
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        source: "Graphics/graf_bg.png"
    }

    ListItem{
        id: listItem
        anchors.top: header.bottom
        platformInverted: true

        CustomSwitch{
            id: itemImage
            anchors.right: parent.right
            anchors.rightMargin: platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter
            checked: true
        }

        Column{
            anchors.left: parent.left
            anchors.leftMargin: platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter

            ListItemText {
                text: "Use own location"
                role: "Title"
                color: "#282828"
            }

            ListItemText {
                text: "Helskinki, Finland"
                role: "SubTitle"
                color: "#666666"
            }
        }
    }
    CustomSelectionListItem{
        id: selection1
        platformInverted: true

        anchors.top: listItem.bottom
        title: "Country"
        subTitle: "Finland"

        onClicked: showBanner(title + " selection dialog opens", "")
    }


    CustomSelectionListItem{
        anchors.top: selection1.bottom
        platformInverted: true

        title: "City"
        subTitle: "Helsinki"

        onClicked: showBanner(title + " selection dialog opens", "")
    }
}
