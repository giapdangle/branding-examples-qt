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
            onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.AIRPORT_INFO_TEXT})
        }
    }

    Component {
        id: delegate

        ListItem {
            id: listItem

            ListItemText {
                anchors.left: parent.left
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.verticalCenter: parent.verticalCenter

                text: title
                role: "Title"
            }

            Rectangle{
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                color: "#4A44B5"
            }

            onClicked: {
                showBanner(title + " view opens", "")
            }
        }
    }


    Timer {
        id: timer
        interval: 500;

        onTriggered: sectionIndicator.opacity = 0;
    }

    Image{
        id: sectionIndicator

        property string section;

        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 80
        source: "Graphics/graf_scroll_list_indicator.svg"
        z: 1
        opacity: 0.0


        Label{
            font.pixelSize: 45
            anchors.left: parent.left
            anchors.leftMargin: 3 * platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter
            text: sectionIndicator.section
        }

        Behavior on opacity { PropertyAnimation { duration: 300 } }
    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#2E3192" }
            GradientStop { position: 1.0; color: "#1B1464" }
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        width: parent.width
        model: CitiesModel{}

        section.property: "title"
        section.criteria: ViewSection.FirstCharacter

        delegate: delegate
        clip: true

        onCurrentSectionChanged: {
            if (page.status == PageStatus.Active){
                if(!listView.moving)
                    sectionIndicator.opacity = 1;
                timer.restart();
                sectionIndicator.section = currentSection;
            }
        }
    }

    ScrollBar{
        id: scrollBar
        flickableItem: listView
        anchors.right: parent.right
        interactive: true
        visible: true
        opacity: 1
        policy: Symbian.ScrollBarWhenNeeded

        width: 25
    }
}
