import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.3

Window {
  id: window
  width: 642
  height: 480
  visible: true
  color: "#231F20"
  title: qsTr("Health App")

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
          font.pixelSize: 15
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
            font.pixelSize: 15
          }
        }
      }
    }

    Rectangle {
      width: window.width / 3
      height: 100
      color: window.color

      ColumnLayout {
        //This is merging test
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
          font.pixelSize: 15
        }

        Text {
          id: pRoom
          color: "#8F8A8D"
          textFormat: Text.RichText
          text: " <font color='#575556'>Room</font>: 201-B2"
          font.pixelSize: 15
        }
      }
    }

    Rectangle {
      width: window.width / 3
      height: 100
      color: window.color
    }
  }
}
