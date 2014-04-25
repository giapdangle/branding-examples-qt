/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import "InfoTexts.js" as InfoTexts

Page {
    id: mainPage

    tools:

        ToolBarLayout{
        id: toolBarLayout
        ToolButton {
            flat: true
            iconSource: "toolbar-back"
            onClicked: pageStack.depth <= 1 ? Qt.quit() : window.pageStack.pop()
        }

        ToolButton {
            flat: true
            iconSource: "Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("InfoPage.qml"), {text: InfoTexts.MAIN_VIEW_INFO_TEXT})
        }
    }

    ListModel {
        id: mainGridModel

        ListElement {
            title: "My Kahvi"
            picture: "Images/menu_mykahvi.svg"
            page: "MyKahvi/Page1.qml"
        }

        ListElement {
            title: "Airport"
            picture: "Images/menu_airport.svg"
            page: "Airport/Page1.qml"
        }

        ListElement {
            title: "Company"
            picture: "Images/menu_company.svg"
            page: "Company/Page1.qml"
        }

        ListElement {
            title: "Logo"
            picture: "Images/menu_logo.svg"
            page: "Logo/Page1.qml"
        }
    }


    Component {
        id: mainGridDelegate

        Rectangle {
            color: mousearea.pressed ? platformStyle.colorDisabledLight
                                     : (window.platformInverted ? platformStyle.colorBackgroundInverted: platformStyle.colorBackground)
            width: mainGrid.cellWidth
            height: mainGrid.cellHeight

            Column {
                id: column
                anchors.centerIn: parent
                spacing: 10
                Image { source: picture; anchors.horizontalCenter: parent.horizontalCenter }
                Label {
                    text: title;
                    platformInverted: window.platformInverted;
                    font.pixelSize: 16
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            MouseArea {
                id: mousearea
                anchors.fill: parent
                onClicked: {
                    mainPage.pageStack.push(Qt.resolvedUrl(page), true);
                }
            }
        }
    }

    GridView {
        id: mainGrid
        anchors.fill: parent
        model: mainGridModel
        cellWidth: height > width ? width / 3 : width / 4
        cellHeight: height > width ? (window.height - toolBarLayout.height) / 4 : (window.height - toolBarLayout.height) / 2

        delegate: mainGridDelegate
    }
}
