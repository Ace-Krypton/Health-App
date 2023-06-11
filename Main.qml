import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15

Window {
  id: window
  width: 642
  height: 480
  visible: true
  color: "#231F20"
  title: qsTr("Health App")

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

  Row {
    id: topSide
    x: 30
    anchors.top: parent.top
    anchors.topMargin: 20
    spacing: 10

    Rectangle {
      width: window.width / 3
      height: 100
      color: window.color

      ColumnLayout {
        spacing: 5

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
      width: window.width / 3
      height: 100
      color: window.color

      ColumnLayout {
        spacing: 5

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
          text: " <font color='#575556'>Admission</font>: Feb 22, 2019 / 12:34 PM"
          font.pixelSize: 17
        }

        Text {
          id: pRoom
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: " <font color='#575556'>Room</font>: 201-B2"
          font.pixelSize: 17
        }
      }
    }

    Rectangle {
      width: window.width / 3
      height: 100
      color: window.color

      ColumnLayout {
        spacing: 5
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
            window.updateTime()
            window.updateDay()
          }
        }

        Text {
          id: pTimeInfo
          color: "#A49B93"
          font.pixelSize: 17
          text: window.timeString
        }

        Text {
          id: pDayInfo
          color: "#A49B93"
          font.pixelSize: 17
          text: window.dateString
        }
      }

      Button {
        width: 60
        height: 60
        x: 250
        y: 7

        Material.background: window.color

        Image {
          anchors.fill: parent
          x: 250
          y: 7
          width: 60
          height: 60
          source: "file:///home/draco/Downloads/notification.png"
        }

        onClicked: {
          console.log("Notification Icon Clicked")
        }
      }
    }
  }
}
