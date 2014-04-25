/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
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
            onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.AIRPORT_INFO_TEXT})
        }
    }

    Component{
        id: delegate

        ListItem {
            height: 100

            enabled: false

            Item{
                anchors.top: parent.top
                anchors.topMargin: platformStyle.paddingMedium
                anchors.left: parent.left
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.right: parent.right
                anchors.rightMargin: platformStyle.paddingLarge


                ListItemText{
                    id: cityLabel
                    anchors.top: parent.top
                    role: "Title"
                    text: city
                    color: "#F2F2F2"
                }

                ListItemText{
                    id: flightLabel
                    anchors.top: cityLabel.bottom
                    role: "SubTitle"
                    text: flight
                    color: "#999999"
                }

                ListItemText{
                    anchors.top: flightLabel.bottom
                    role: "SelectionSubTitle"
                    text: flightStatus
                    color: "#7F7F7F"
                }

                Image{
                    anchors.verticalCenter: cityLabel.verticalCenter
                    anchors.right: parent.right
                    source: {
                        if(flightStatus === "Cancelled")
                            return "Graphics/icon_tiny_cancelled.svg"
                        else if(flightStatus === "Boarding")
                            return "Graphics/icon_tiny_boarding.svg"
                        else if(flightStatus === "Departing")
                            return "Graphics/icon_tiny_departing.svg"
                        else if(flightStatus === "Arriving")
                            return "Graphics/icon_tiny_arriving.svg"
                        else
                            return ""
                    }
                }

                Label{
                    anchors.right: parent.right
                    anchors.verticalCenter: flightLabel.verticalCenter
                    id: timeLabel
                    color: "#999999"
                    text: time
                }
            }

            Rectangle{
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                color: "#6059EA"
            }
        }
    }

    TabBarLayout {
        id: tabBarLayout
        z: 1
        anchors { left: parent.left; right: parent.right; top: parent.top }
        CustomTabButton { tab: listView1; text: "Departures"; iconSource: "Graphics/icon_tab_departing.svg"; }
        CustomTabButton { tab: listView2; text: "Arrivals"; iconSource: "Graphics/icon_tab_arriving.svg"; }
    }

    Rectangle {
        anchors.top: tabBarLayout.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#6063CE" }
            GradientStop { position: 1.0; color: "#1B1464" }
        }
    }

    TabGroup {
        id: tabGroup
        anchors { left: parent.left; right: parent.right; top: tabBarLayout.bottom; bottom: parent.bottom }

        // define the content for tab 1
        ListView {
            id: listView1
            anchors.fill: parent
            model: DeparturesModel{}
            delegate: delegate
        }

        // define the content for tab 2
        ListView {
            id: listView2
            anchors.fill: parent
            model: ArrivalsModel{}
            delegate: delegate
        }
    }
}
