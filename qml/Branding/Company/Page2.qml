/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import Qt.labs.components 1.1
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
            iconSource: "../Images/Icons/toolbar_prev_company.svg"
            onClicked: pageStack.pop();
        }

        ToolButton {
            flat: true
            iconSource: enabled ? "../Images/Icons/toolbar_next_company.svg" : "../Images/Icons/toolbar_next_disabled_company.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"));
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

            subItemIndicator: true

            ListItemText {
                anchors.left: parent.left
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.verticalCenter: parent.verticalCenter
                text: title
                role: "Title"
            }
        }
    }

    Item{
        id: heading
        anchors.top: parent.top
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

        anchors.top: heading.bottom

        CustomTextField{
            id: textField
            anchors.centerIn: parent
            width: parent.width - 2 * platformStyle.paddingLarge
            placeholderText: "Text hint"
        }
    }

    CustomSelectionListItem{
        id: selection1

        anchors.top: searchTextItem.bottom
        title: "List title #1"
    }

    CustomSelectionListItem{
        id: selection2
        anchors.top: selection1.bottom

        title: "List title #2"
    }


    ListHeading{
        id: listHeading
        anchors.top: selection2.bottom

        Label{
            anchors.right: parent.right
            anchors.rightMargin: platformStyle.paddingLarge
            anchors.verticalCenter: parent.verticalCenter
            text: "List header"
        }
    }

    ListView {
        id: listView
        anchors.top: listHeading.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        model: dataModel
        delegate: delegate
        clip: true
    }

    CheckableGroup{
        id: checkableGroup
    }

    Component {
        id: selectionDialogdelegate

        MenuItem {
            platformInverted: root.platformInverted
            text: modelData
            onClicked: {
                selectedIndex = index
                radioButton.checked = true;

                if(selectedIndex == 0 && pageStack != null)
                    pageStack.pop();
                else
                    pageStack.push(Qt.resolvedUrl("Page3.qml"));
            }
            CustomRadioButton{
                id: radioButton
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                platformExclusiveGroup: checkableGroup

                onCheckedChanged: {
                    if(checked == true)
                        selectedIndex = index;
                }

                onClicked: {
                    if(selectedIndex == 0 && pageStack != null)
                        pageStack.pop();
                    else
                       pageStack.push(Qt.resolvedUrl("Page3.qml"));
                }
            }
        }
    }

    CustomSelectionDialog {
        id: dialog
        titleText: "Title"
        delegate: selectionDialogdelegate
        model: ListModel {
            ListElement { name: "Go to previous" }
            ListElement { name: "Go to next #1" }
            ListElement { name: "Go to next #2" }
        }
    }

    onStatusChanged: {
        if(status == PageStatus.Activating)
            dialog.open();
        else if(status == PageStatus.Deactivating)
            dialog.close();
    }
}
