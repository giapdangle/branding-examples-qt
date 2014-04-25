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
            onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"));
        }

        ToolButton {
            flat: true
            iconSource: "../Images/Icons/information_userguide.svg"
            onClicked: pageStack.push(Qt.resolvedUrl("../InfoPage.qml"), {text: InfoTexts.LOGO_INFO_TEXT})
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

    Flickable{
        anchors.fill: parent
        clip: true

        contentHeight: flickItem.height

        Item{
            id: flickItem
            width: parent.width
            height: childrenRect.height


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
                    text: "Location"
                }
            }

            Item{
                id: locationItem
                anchors.top: heading.bottom
                width: parent.width
                height: childrenRect.height
                anchors.left: parent.left
                anchors.margins: platformStyle.paddingLarge

                Image{
                    id: image

                    anchors.left: parent.left
                    width: 150

                    source: "Graphics/map.png"
                }

                Label{
                    id: title
                    anchors.left: image.right
                    anchors.leftMargin: platformStyle.paddingLarge
                    anchors.bottom: address.top
                    font.pixelSize: platformStyle.fontSizeLarge
                    color: "#EF5A24"
                    text: "Showroom"
                }

                Label{
                    id: address
                    anchors.left: image.right
                    anchors.leftMargin: platformStyle.paddingLarge
                    anchors.bottom: image.bottom
                    anchors.bottomMargin: platformStyle.paddingMedium
                    font.pixelSize: platformStyle.fontSizeMedium
                    platformInverted: true

                    text: "102 Street Address\nSE1 7 London"
                }
            }

            Label{
                id: descriptionLabel
                anchors.left: parent.left
                anchors.leftMargin: platformStyle.paddingLarge
                anchors.top: locationItem.bottom
                anchors.topMargin: platformStyle.paddingLarge
                wrapMode: Text.WordWrap
                width: parent.width - 2 * platformStyle.paddingLarge

                platformInverted: true

                text: "<font color=\"#EF5A24\">Lorem ipsum </font>dolor sit amet, consectetur adipiscing elit. Cras id sollicitudin arcu. In condimentum gravida massa, quis ultricies mauris consectetur eget"
            }

            Row{
                anchors.top: descriptionLabel.bottom
                anchors.topMargin: platformStyle.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: platformStyle.paddingLarge

                Button{
                    platformInverted: true
                    iconSource: "Graphics/icon_button_1.svg"
                    width: page.width / 3 - 2 * platformStyle.paddingMedium

                    onClicked: {
                        showBanner(" button clicked", iconSource)
                    }
                }

                Button{
                    platformInverted: true
                    iconSource: "Graphics/icon_button_2.svg"
                    width: page.width / 3 - 2 * platformStyle.paddingMedium

                    onClicked: {
                        showBanner(" button clicked", iconSource)
                    }
                }

                Button{
                    platformInverted: true
                    iconSource: "Graphics/icon_button_3.svg"
                    width: page.width / 3 - 2 * platformStyle.paddingMedium

                    onClicked: {
                        showBanner(" button clicked", iconSource)
                    }
                }
            }
        }
    }
}
