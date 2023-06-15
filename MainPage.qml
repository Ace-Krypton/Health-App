import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15

Item {
  id: window

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
          text: qsTr("Hengutson, Jan-Franc")
          font.pixelSize: 20
        }

        Text {
          id: pData
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: "Male / <font color='#575556'>Age</font> 52&nbsp;&nbsp;&nbsp;03/18/1967"
          font.pixelSize: 17
        }

        RowLayout {
          spacing: 10

          Item {
            width: 15
            height: 15

            Rectangle {
              width: parent.width
              height: parent.height
              color: "#39B34B"
              radius: width * 0.5
            }
          }

          Text {
            color: "#575556"
            textFormat: Text.RichText
            text: qsTr("Condition: <font color='#8F8A8D'>&nbsp;Stable</font>")
            font.pixelSize: 17
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      ColumnLayout {
        spacing: 5
        anchors.centerIn: parent

        Text {
          id: pID
          color: "#A49B93"
          text: qsTr("148326")
          font.pixelSize: 20
        }

        Text {
          id: pAdmissionDate
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: "<font color='#575556'>Admission</font>: Feb 22, 2019 / 12:34 PM"
          font.pixelSize: 17
        }

        Text {
          id: pRoom
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: "<font color='#575556'>Room</font>: 201-B2"
          font.pixelSize: 17
        }
      }
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
      Layout.rowSpan: 2
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      Button {
        Material.background: "#231F20"
        anchors.centerIn: parent

        Image {
          width: 60
          height: 60
          anchors.fill: parent
          source: "file:///home/draco/Downloads/Untitled.png"
        }

        onClicked: {
          console.log("Notification Icon Clicked")
        }
      }
    }

    Rectangle {
      color: 'yellow'
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: 'blue'
      Layout.row: 4
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: 'orange'
      Layout.row: 6
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: 'orange'
      Layout.row: 8
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: 'magenta'
      Layout.column: 4
      Layout.row: 6
      Layout.rowSpan: 4
      Layout.columnSpan: 6
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)
    }

    Rectangle {
      color: 'purple'
      Layout.column: 6
      Layout.row: 2
      Layout.rowSpan: 4
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30
    }

    Rectangle {
      color: 'purple'
      Layout.column: 8
      Layout.row: 2
      Layout.rowSpan: 4
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30
    }

    Rectangle {
      color: 'lime'
      Layout.column: 4
      Layout.row: 2
      Layout.rowSpan: 4
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30
    }

    Rectangle {
      color: 'red'
      Layout.column: 10
      Layout.row: 2
      Layout.rowSpan: 8
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 66
    }
  }
}
