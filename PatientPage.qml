import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15
import QtCharts 2.3

Item {
  id: window

  signal patientsPage

  GridLayout {
    id: grid
    anchors.fill: parent
    rows: 12
    columns: 12
    rowSpacing: 4
    columnSpacing: 10

    property double colMulti: grid.width / grid.columns
    property double rowMulti: grid.height / grid.rows

    function prefWidth(item) {
      return colMulti * item.Layout.columnSpan
    }

    function prefHeight(item) {
      return rowMulti * item.Layout.rowSpan
    }

    Rectangle {
      color: "blue"
      Layout.rowSpan: 2
      Layout.columnSpan: 3
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: "blue"
      Layout.rowSpan: 2
      Layout.column: 9
      Layout.columnSpan: 3
      Layout.alignment: Qt.AlignRight
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: "black"
      Layout.row: 2
      Layout.rowSpan: 10
      Layout.columnSpan: 12
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) - 11

      Item {
        width: parent.width
        height: parent.height

        ListView {
          id: listView
          anchors.fill: parent
          clip: true

          model: ListModel {
            ListElement {
              text: "Item 1"
            }

            ListElement {
              text: "Item 2"
            }

            ListElement {
              text: "Item 3"
            }

            ListElement {
              text: "Item 4"
            }

            ListElement {
              text: "Item 5"
            }
          }

          delegate: Item {
            width: listView.width
            height: listView.height / listView.model.count

            Rectangle {
              width: parent.width
              height: parent.height
              color: "transparent"
              border.color: "white"
              border.width: 1

              Text {
                text: model.text
                color: "white"
                anchors.centerIn: parent
              }
            }
          }
        }
      }
    }
  }
}
