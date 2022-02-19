import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("My Todo List")

    ListModel {
        id: todoModel
    }

    Item {
        anchors.fill: parent

        Rectangle {
            id: topRect
            height: 100
            width: parent.width
            color: "#721F1F"
            anchors.top: parent.top

            Text {
                text: "My Todo List"
                font.bold: true
                font.pixelSize: 32
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 35
                color: "white"
            }
        }

        Item {
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: topRect.bottom

            Rectangle {
                id: leftRect
                width: 0.5 * parent.width
                height: parent.height
                anchors.left: parent.left
                color: "#C4C4C4"

                ListView {
                    id: lv
                    model: todoModel
                    spacing: 5
                    anchors.centerIn: parent
                    width: parent.width * 0.7
                    height: parent.height * 0.8
                    delegate: Rectangle {
                        id: dlg

                        width: lv.width
                        height: 100
                        color: "white"
                        radius: 10

                        property string title
                        property string description

                        title: _title
                        description: _des

                        Rectangle {
                            color: "red"
                            width: 100
                            radius: 10
                            height: parent.height
                            anchors.right: parent.right

                            Text {
                                color: "white"
                                font.bold: true
                                font.pixelSize: 18
                                text: "DELETE"
                                anchors.centerIn: parent
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    todoModel.remove(index)
                                }
                            }
                        }

                        Column {
                            anchors.fill: parent
                            anchors.leftMargin: 20
                            anchors.rightMargin: 100
                            anchors.topMargin: 5
                            anchors.bottomMargin: 5

                            Text {
                                color: "black"
                                font.bold: true
                                font.pixelSize: 18
                                text: dlg.title
                            }

                            Text {
                                color: "black"
                                font.pixelSize: 16
                                text: dlg.description
                            }
                        }
                    }
                }
            }

            Item {
                id: rightItem
                width: 0.5 * parent.width
                height: parent.height
                anchors.right: parent.right

                Column {
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    TextField {
                        id: t1
                        placeholderText: "Enter the title"
                        height: 50
                        width: rightItem.width * 0.7
                        color: "black"
                    }

                    TextArea {
                        id: t2
                        placeholderText: "Enter the TODO item description"
                        width: rightItem.width * 0.7
                        height: 400
                    }

                    Button {
                        text: "ADD"
                        height: 50
                        width: rightItem.width * 0.7

                        onClicked: {
                            todoModel.append({ "_title":  t1.text, "_des": t2.text})
                            t1.text=""
                            t2.text=""
                        }
                    }
                }
            }
        }
    }
}
