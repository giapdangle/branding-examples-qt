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
            onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"));
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
        }
    }

    Item{
        id: heading
        anchors.top: parent.top
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

    Image{
        anchors.top: heading.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        source: "Graphics/graf_mykahvi_splash_bg.svg"
    }

    Item{
        id: searchTextItem

        height: 80
        width: parent.width

        anchors.top: heading.bottom

        TextField{
            id: textField
            anchors.centerIn: parent
            width: parent.width - 2 * platformStyle.paddingLarge
            placeholderText: "Search for your coffee"
        }
    }

    ListView {
        id: listView
        anchors.top: searchTextItem.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        model: dataModel
        delegate: delegate
        clip: true
    }

    CustomMenu {
        id: menu

        MenuLayout {
            MenuItem {
                text: "Go to My Kahvi web site"
                onClicked: {
                    pageStack.pop()
                    showBanner("Web site opens", "")
                }
            }

            MenuItem {
                text: "Next"
                onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"));
            }

            MenuItem {
                text: "Previous"
                onClicked: pageStack.pop()
            }
        }
    }

    onStatusChanged: {
        if (status == PageStatus.Activating)
            menu.open();
    }
}
