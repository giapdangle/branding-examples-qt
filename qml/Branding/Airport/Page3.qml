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
            onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.AIRPORT_INFO_TEXT})
        }
    }

    ListModel {
        id: dataModel

        ListElement {
            title: "Location"
            subtitle: "Helsinki, Finland"
            type: "location"
        }

        ListElement {
            title: "Departing flights"
            type: "departing"
        }

        ListElement {
            title: "Arriving flights"
            type: "arriving"
        }

        ListElement {
            title: "Flight details"
            type: "flight"
        }
    }

    Component {
        id: delegate

        ListItem {
            id: listItem

            subItemIndicator: true
            platformInverted: true

            Image{
                id: itemImage
                anchors.left: parent.left
                anchors.top: parent.top
                height: parent.height + 1
                width: height
                source: "Graphics/icon_list_" + type + ".svg"
            }

            Column{
                anchors.left: itemImage.right
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.verticalCenter: parent.verticalCenter

                ListItemText {
                    text: title
                    role: "Title"
                    color: "#1B1464"
                }

                ListItemText {
                    text: {
                        if(subtitle == undefined)
                            return ""
                        return subtitle
                    }
                    role: "SubTitle"
                    color: "#666666"
                }
            }

            onClicked: {
                showBanner(title + " view opens", "Airport/Graphics/icon_list_bg_" + type + ".svg")
            }
        }
    }

    Image {
        id: heading
        anchors.top: parent.top
        width: parent.width

        source: "Graphics/qtg_rf_list_heading_large.svg"

        Image{
            anchors.centerIn: parent
            source: "Graphics/graf_logo.svg"
        }
    }

    Image{
        anchors.top: heading.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        source: "Graphics/graf_bg.png"
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
}
