// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: root
    property int currentStep: 0
    property int maxValue: 5

    height: col.implicitHeight

    Column{
        id: col

        anchors.horizontalCenter: parent.horizontalCenter
        spacing: platformStyle.paddingLarge

        Row{
            id: row

            Image{
                source: currentStep >= 1 ? "Graphics/graf_mykahvi_step_1.svg" : "Graphics/graf_mykahvi_step_1_dark.svg"
            }

            Image{
                source: currentStep >= 2 ? "Graphics/graf_mykahvi_step_2.svg" : "Graphics/graf_mykahvi_step_2_dark.svg"
            }

            Image{
                source: currentStep >= 3 ? "Graphics/graf_mykahvi_step_3.svg" : "Graphics/graf_mykahvi_step_3_dark.svg"
            }

            Image{
                source: currentStep >= 4 ? "Graphics/graf_mykahvi_step_4.svg" : "Graphics/graf_mykahvi_step_4_dark.svg"
            }

            Image{
                source: currentStep >= 5 ? "Graphics/graf_mykahvi_step_5.svg" : "Graphics/graf_mykahvi_step_5_dark.svg"
            }
        }

        // The background rectangle of the progress bar
        Rectangle {
            id: a
            height: 8
            width: 312

            anchors.horizontalCenter: parent.horizontalCenter

            color: "#603E38"

            Rectangle{
                height: parent.height
                width: {
                    if(currentStep == 0)
                        return 0

                    var index = currentStep > maxValue ? maxValue - 1 : currentStep - 1
                    var ret = row.children[index].x + row.children[index].width - parent.x

                    if(ret > parent.width)
                        return parent.width

                    return ret
                }
                color: "#9E705C"
            }
        }
    }
}
