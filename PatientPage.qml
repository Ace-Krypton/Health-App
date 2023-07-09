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

    property var locale: Qt.locale()
    property date currentTime: new Date()
    property string timeString
    property string dateString

    function updateTime() {
      timeString = new Date().toLocaleTimeString(locale, Locale.ShortFormat)
    }

    function updateDay() {
      dateString = new Date().toLocaleDateString(Qt.locale())
    }

    function prefWidth(item) {
      return colMulti * item.Layout.columnSpan
    }

    function prefHeight(item) {
      return rowMulti * item.Layout.rowSpan
    }

    Rectangle {
      color: "#231F20"
      Layout.rowSpan: 2
      Layout.columnSpan: 3
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      ColumnLayout {
        spacing: 5
        anchors.centerIn: parent

        Text {
          id: pName
          color: "#A49B93"
          text: qsTr("Patients")
          font.pixelSize: 20
        }

        Text {
          id: pData
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: "Emergency and Cardio Dep."
          font.pixelSize: 17
        }

        Text {
          id: pCount
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: qsTr("<font color='#8F8A8D'>Total Admitted:</font> 208")
          font.pixelSize: 17
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.rowSpan: 2
      Layout.column: 9
      Layout.columnSpan: 3
      Layout.alignment: Qt.AlignRight
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      ColumnLayout {
        spacing: 5
        anchors.centerIn: parent
        LayoutMirroring.enabled: true

        Text {
          id: pHospitalInfo
          color: "#A49B93"
          text: "Marin General Hospital"
          font.pixelSize: 20
        }

        Timer {
          id: timer
          interval: 1000
          running: true
          repeat: true
          onTriggered: {
            grid.updateTime()
            grid.updateDay()
          }
        }

        Text {
          id: pTimeInfo
          color: "#A49B93"
          font.pixelSize: 17
          text: grid.timeString
        }

        Text {
          id: pDayInfo
          color: "#A49B93"
          font.pixelSize: 17
          text: grid.dateString
        }
      }
    }

    Rectangle {
      color: "#231F20"
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
              text: "Patient 1"
            }

            ListElement {
              text: "Patient 2"
            }

            ListElement {
              text: "Patient 3"
            }

            ListElement {
              text: "Patient 4"
            }

            ListElement {
              text: "Patient 5"
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
