import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15

Item {
  id: window
  width: applicationLayout.implicitWidth
  height: applicationLayout.implicitHeight

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

  GridLayout {
    id: applicationLayout
    columns: 4
    anchors.fill: parent
    anchors.topMargin: 20
    anchors.leftMargin: 30

    Rectangle {
      width: window.width / 3
      height: 100
      color: "#231F20"

      Layout.fillHeight: true
      Layout.fillWidth: true

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

      color: "#231F20"

      Layout.fillHeight: true
      Layout.fillWidth: true

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

      color: "#231F20"

      Layout.fillHeight: true
      Layout.fillWidth: true

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
    }

    Rectangle {
      width: window.width / 3
      height: 100

      color: "#231F20"

      Layout.fillHeight: true
      Layout.fillWidth: true

      ColumnLayout {
        spacing: 5

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignTop | Qt.AlignVCenter

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
    }
  }
}
