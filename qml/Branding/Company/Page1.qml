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
            iconSource: enabled ? "../Images/Icons/toolbar_prev_company.svg" : "../Images/Icons/toolbar_prev_disabled_company.svg"
            enabled: false
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/toolbar_next_company.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide_company.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.COMPANY_INFO_TEXT})
        }
    }

    ListModel {
        id: dataModel

        ListElement {
            title: "List title #1"
        }

        ListElement {
            title: "List title #2"
        }

        ListElement {
            title: "List title #3"
        }

        ListElement {
            title: "List title #4"
        }

        ListElement {
            title: "List title #5"
        }

        ListElement {
            title: "List title #6"
        }
    }

    Component {
        id: delegate

        ListItem {
            id: listItem
            height: 60

            subItemIndicator: true

            ListItemText {
                anchors.left: parent.left
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.verticalCenter: parent.verticalCenter
                text: title
                role: "Title"
            }

            onClicked: {
                showBanner(title + " view opens", "")
            }
        }
    }

    Flickable{
        anchors.fill: parent
        width: parent.width
        clip: true

        contentHeight: col.implicitHeight
        Column{
            id: col
            width: parent.width

            Item{
                id: heading
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
                id: searchTextItem

                height: 80
                width: parent.width

                CustomTextField{
                    id: textField
                    anchors.centerIn: parent
                    width: parent.width - 2 * platformStyle.paddingLarge
                    placeholderText: "Text hint"
                }
            }

            CustomSelectionListItem{
                title: "List title #1"

                onClicked: showBanner(title + " selection dialog opens", "")
            }

            CustomSelectionListItem{
                title: "List title #2"

                onClicked: showBanner(title + " selection dialog opens", "")
            }

            ListHeading{
                Label{
                    anchors.right: parent.right
                    anchors.rightMargin: platformStyle.paddingLarge
                    anchors.verticalCenter: parent.verticalCenter
                    text: "List header"
                }
            }

            ListView {
                id: listView
                height: count * 60
                width: parent.width
                model: dataModel
                delegate: delegate
                clip: true
                interactive: false
            }
        }
    }
}
