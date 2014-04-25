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
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.MYKAHVI_INFO_TEXT})
        }
    }

    ListModel {
        id: dataModel

        ListElement {
            title: "All"
            subtitle: "123"
            imageSource: "Graphics/large_all_coffees.svg"
        }

        ListElement {
            title: "Ground coffees"
            subtitle: "Lorem"
            imageSource: "Graphics/large_ground_coffees.svg"
        }

        ListElement {
            title: "Instant coffees"
            subtitle: "Ipsum"
            imageSource: "Graphics/large_instant_coffee.svg"
        }
    }

    Component {
        id: delegate

        ListItem {
            id: listItem
            height: 70

            subItemIndicator: true

            Image{
                id: itemImage
                anchors.left: parent.left
                anchors.top: parent.top
                height: parent.height + 1
                width: height
                source: imageSource
            }

            Rectangle {
                height: 1
                width: parent.width
                anchors.top: parent.top

                color: platformStyle.colorDisabledMid

                visible: index == 0
            }

            Rectangle {
                height: 1
                width: parent.width
                anchors.bottom: parent.bottom

                color: platformStyle.colorDisabledMid

                visible: index == dataModel.count - 1
            }

            Column{
                anchors.left: itemImage.right
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.verticalCenter: parent.verticalCenter

                ListItemText {
                    text: title
                    role: "Title"
                }

                ListItemText {
                    text: subtitle
                    role: "SubTitle"
                    color: "#92624C"
                }
            }

            onHeightChanged: {
                console.log("height: " + height);
            }

            onClicked: {
                showBanner(title + " view opens", "")
            }
        }
    }

    Image{
        anchors.fill: parent
        source: "Graphics/graf_mykahvi_splash_bg.svg"
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
                height: 64
                width: parent.width

                Image {
                    id: name
                    anchors.fill: parent
                    source: "Graphics/graf_view_heading.svg"
                }

                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: platformStyle.paddingLarge
                    source: "Graphics/graf_mykahvi_logo.svg"
                }
            }

            Item{
                id: searchTextItem

                height: 80
                width: parent.width

                TextField{
                    id: textField
                    anchors.centerIn: parent
                    width: parent.width - 2 * platformStyle.paddingLarge
                    placeholderText: "Search for your coffee"
                }
            }

            ListView {
                id: listView
                width: parent.width
                height: count * 70
                interactive: false
                model: dataModel
                delegate: delegate
                clip: true
            }
        }
    }
}
