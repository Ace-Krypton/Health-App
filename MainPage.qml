import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15
import QtCharts 2.3

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

      ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Item {
          Layout.preferredHeight: 20
        }

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignCenter
          Layout.leftMargin: 30

          Image {
            width: 40
            height: 40
            anchors.fill: parent
            source: "file:///home/draco/Downloads/iconizer-envelope-solid.svg"
          }

          onClicked: {
            console.log("Notification Icon Clicked")
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) - 30

      RowLayout {
        anchors.fill: parent
        spacing: 10

        Item {
          Layout.leftMargin: 40
          width: 100
          height: 100

          Rectangle {
            width: parent.width
            height: parent.height
            color: "#231F20"

            ColumnLayout {
              spacing: 3
              Layout.fillWidth: true
              Layout.fillHeight: true

              Text {
                textFormat: Text.RichText
                text: qsTr(
                        "<font style='font-size: 20px; color: #8F8A8D;'>Temperature </font>")
                      + "<font style='font-size: 15px; color: #575556;'>Celsius</font>"
              }

              RowLayout {
                spacing: 20
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                  color: "#A49B93"
                  text: qsTr("36.7°")
                  font.pointSize: 30
                }

                Text {
                  color: "#A49B93"
                  text: qsTr("37.4°")
                  font.pointSize: 30
                }

                Text {
                  textFormat: Text.RichText
                  color: "#A49B93"
                  text: qsTr(
                          "<font style='font-size: 17px; color: #575556;'>Highest </font>
<font style='font-size: 25px; color: #8B8D90;'>&nbsp;39.2</font>
<font style='font-size: 25px; color: #8B8D90;'>°</font>")
                }
              }
            }
          }
        }
      }
    }

    Rectangle {
      id: pressureID
      color: "#231F20"
      Layout.row: 4
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30

      RowLayout {
        anchors.fill: parent
        spacing: 10

        Item {
          Layout.leftMargin: 40
          width: 200
          height: 200

          Rectangle {
            width: parent.width
            height: parent.height
            color: "#231F20"

            ColumnLayout {
              spacing: 3
              Layout.fillWidth: true
              Layout.fillHeight: true

              Text {
                textFormat: Text.RichText
                text: qsTr(
                        "<font style='font-size: 18px; color: #8F8A8D;'>Blood Pressure </font>")
                      + "<font style='font-size: 15px; color: #575556;'>mmHg</font>"
              }

              RowLayout {
                spacing: 20
                Layout.fillWidth: true
                Layout.fillHeight: true

                ColumnLayout {
                  spacing: 0
                  Layout.fillWidth: true
                  Layout.fillHeight: true

                  Text {
                    color: "#575556"
                    text: qsTr("SYS")
                    font.pointSize: 10
                    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                  }

                  Text {
                    color: "#A49B93"
                    text: qsTr("120")
                    font.pointSize: 80
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                  }
                }

                ColumnLayout {
                  spacing: 0
                  Layout.fillWidth: true
                  Layout.fillHeight: true

                  Text {
                    color: "#575556"
                    text: qsTr("")
                    font.pointSize: 10
                  }

                  Text {
                    color: "#575556"
                    text: qsTr("/")
                    font.pointSize: 80
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                  }
                }

                ColumnLayout {
                  spacing: 0
                  Layout.fillWidth: true
                  Layout.fillHeight: true

                  Text {
                    color: "#575556"
                    text: qsTr("DIA")
                    font.pointSize: 10
                    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                  }

                  Text {
                    color: "#A49B93"
                    text: qsTr("78")
                    font.pointSize: 80
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                  }
                }
              }
            }
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.row: 6
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      RowLayout {
        anchors.fill: parent
        spacing: 5

        Item {
          Layout.leftMargin: 40
          width: 100
          height: 100

          Rectangle {
            width: parent.width
            height: parent.height
            color: "#39B34B"
            radius: width * 0.5

            ColumnLayout {
              anchors.fill: parent
              spacing: 0

              Text {
                text: qsTr("EKG")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 12
              }

              Text {
                text: qsTr("92")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 32
              }

              Text {
                text: qsTr("BMP")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 12
              }
            }
          }
        }

        Canvas {
          Layout.fillWidth: true
          Layout.fillHeight: true
          antialiasing: true

          onPaint: {
            var ctx = getContext("2d")

            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "lime"
            ctx.lineWidth = 2
            ctx.lineCap = "square"

            var centerX = width / 2
            var centerY = height / 2
            var amplitude = 30
            var frequency = 28
            var time = new Date().getTime() / 1000
            var pointCount = 100
            var points = []

            for (var i = 0; i < pointCount; i++) {
              var x = i / pointCount * width
              var y = centerY + Math.sin(
                    (x / width * frequency + time) * Math.PI * 2) * amplitude
              points.push({
                            "x": x,
                            "y": y
                          })
            }

            ctx.beginPath()
            ctx.moveTo(points[0].x, points[0].y)
            for (var j = 1; j < pointCount; j++) {
              ctx.lineTo(points[j].x, points[j].y)
            }
            ctx.stroke()
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.row: 8
      Layout.rowSpan: 2
      Layout.columnSpan: 4
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      RowLayout {
        anchors.fill: parent
        spacing: 10

        Item {
          Layout.leftMargin: 40
          width: 100
          height: 100

          Rectangle {
            width: parent.width
            height: parent.height
            color: "#235F7A"
            radius: width * 0.5

            ColumnLayout {
              anchors.fill: parent
              spacing: 0

              Text {
                text: qsTr("Pulse")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 12
              }

              Text {
                text: qsTr("95")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 32
              }

              Text {
                text: qsTr("SpO2")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 12
              }
            }
          }
        }

        Canvas {
          Layout.fillWidth: true
          Layout.fillHeight: true
          antialiasing: true

          onPaint: {
            var ctx = getContext("2d")

            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "#235F7A"
            ctx.lineWidth = 2
            ctx.lineCap = "square"

            var centerX = width / 2
            var centerY = height / 2
            var amplitude = 30
            var frequency = 28
            var time = new Date().getTime() / 1000
            var pointCount = 100
            var points = []

            for (var i = 0; i < pointCount; i++) {
              var x = i / pointCount * width
              var y = centerY + Math.sin(
                    (x / width * frequency + time) * Math.PI * 2) * amplitude
              points.push({
                            "x": x,
                            "y": y
                          })
            }

            ctx.beginPath()
            ctx.moveTo(points[0].x, points[0].y)
            for (var j = 1; j < pointCount; j++) {
              ctx.lineTo(points[j].x, points[j].y)
            }
            ctx.stroke()
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.column: 4
      Layout.row: 6
      Layout.rowSpan: 4
      Layout.columnSpan: 6
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this)

      RowLayout {
        anchors.fill: parent
        spacing: 10

        Item {
          Layout.leftMargin: 20
          width: 160
          height: 160

          Rectangle {
            width: parent.width
            height: parent.height
            color: "#652D90"
            radius: width * 0.5

            ColumnLayout {
              anchors.fill: parent
              spacing: 0

              Text {
                text: qsTr("Insulin Pump")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 12
              }

              Text {
                text: qsTr("0.65")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 32
              }

              Text {
                text: qsTr("U/Hr")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 12
              }
            }
          }
        }

        Rectangle {
          width: 100
          height: 100
          color: "#231F20"

          ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Text {
              color: "#A49B93"
              text: qsTr("Last Bolus")
              font.pointSize: 12
              Layout.alignment: Qt.AlignLeft
            }

            Text {
              color: "#A49B93"
              text: qsTr("3.0")
              font.pointSize: 40
              Layout.alignment: Qt.AlignLeft
            }

            Text {
              color: "#575556"
              text: qsTr("U")
              font.pointSize: 12
              Layout.alignment: Qt.AlignLeft
            }
          }
        }

        Rectangle {
          width: 100
          height: 100
          color: "#231F20"

          ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Text {
              color: "#A49B93"
              text: qsTr("IOB")
              font.pointSize: 12
              Layout.alignment: Qt.AlignLeft
            }

            Text {
              color: "#A49B93"
              text: qsTr("2.3")
              font.pointSize: 40
              Layout.alignment: Qt.AlignLeft
            }

            Text {
              color: "#575556"
              text: qsTr("U")
              font.pointSize: 12
              Layout.alignment: Qt.AlignLeft
            }
          }
        }

        Rectangle {
          width: 100
          height: 100
          color: "#231F20"

          ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Text {
              color: "#A49B93"
              text: qsTr("Glucose")
              font.pointSize: 12
              Layout.alignment: Qt.AlignLeft
            }

            Text {
              color: "#A49B93"
              text: qsTr("130")
              font.pointSize: 40
              Layout.alignment: Qt.AlignLeft
            }

            Text {
              color: "#575556"
              text: qsTr("Mg/DL")
              font.pointSize: 12
              Layout.alignment: Qt.AlignLeft
            }
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.column: 6
      Layout.row: 2
      Layout.rowSpan: 4
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30

      Item {
        id: hicor
        width: 40
        height: parent.height
        x: 55

        property int totalParts: 26
        property int filledParts: 8
        property int spacing: 5

        Repeater {
          model: hicor.totalParts

          Rectangle {
            width: parent.width
            height: (parent.height - (hicor.totalParts - 1) * hicor.spacing) / hicor.totalParts
            color: index < hicor.filledParts ? "#A49B93" : "#575556"
            border.color: "#231F20"
            y: parent.height - height * (index + 1) - index * hicor.spacing
          }
        }
      }

      Item {
        width: 40
        height: parent.height
        anchors.left: hicor.right
        anchors.leftMargin: 10

        ColumnLayout {
          Text {
            color: "#8F8A8D"
            text: qsTr("Hi-Cor")
            font.pointSize: 18
          }

          Text {
            color: "#8F8A8D"
            text: qsTr("25 %")
            font.pointSize: 30
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.column: 8
      Layout.row: 2
      Layout.rowSpan: 4
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30

      Item {
        id: glucagon
        width: 40
        height: parent.height
        x: 20

        property int totalParts: 26
        property int filledParts: 11
        property int spacing: 5

        Repeater {
          model: glucagon.totalParts

          Rectangle {
            width: parent.width
            height: (parent.height - (glucagon.totalParts - 1)
                     * glucagon.spacing) / glucagon.totalParts
            color: index < glucagon.filledParts ? "#A49B93" : "#575556"
            border.color: "#231F20"
            y: parent.height - height * (index + 1) - index * glucagon.spacing
          }
        }
      }

      Item {
        width: 40
        height: parent.height
        anchors.left: glucagon.right
        anchors.leftMargin: 10

        ColumnLayout {
          Text {
            color: "#8F8A8D"
            text: qsTr("Glucagon")
            font.pointSize: 18
          }

          Text {
            color: "#8F8A8D"
            text: qsTr("45 %")
            font.pointSize: 30
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.column: 4
      Layout.row: 2
      Layout.rowSpan: 4
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 30

      Item {
        id: saline
        width: 40
        height: parent.height
        anchors.centerIn: parent

        property int totalParts: 26
        property int filledParts: 14
        property int spacing: 5

        Repeater {
          model: saline.totalParts

          Rectangle {
            width: parent.width
            height: (parent.height - (saline.totalParts - 1) * saline.spacing) / saline.totalParts
            color: index < saline.filledParts ? "#A49B93" : "#575556"
            border.color: "#231F20"
            y: parent.height - height * (index + 1) - index * saline.spacing
          }
        }
      }

      Item {
        width: 40
        height: parent.height
        anchors.left: saline.right
        anchors.leftMargin: 10

        ColumnLayout {
          Text {
            color: "#8F8A8D"
            text: qsTr("Saline")
            font.pointSize: 18
          }

          Text {
            color: "#8F8A8D"
            text: qsTr("55 %")
            font.pointSize: 30
          }
        }
      }
    }

    Rectangle {
      color: "#231F20"
      Layout.column: 10
      Layout.row: 2
      Layout.rowSpan: 8
      Layout.columnSpan: 2
      Layout.preferredWidth: grid.prefWidth(this)
      Layout.preferredHeight: grid.prefHeight(this) + 66

      ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 45

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignCenter
          Layout.leftMargin: 30

          Image {
            width: 40
            height: 40
            anchors.fill: parent
            source: "file:///home/draco/Downloads/iconizer-heart-pulse-solid.svg"
          }

          onClicked: {
            console.log("Vitals Icon Clicked")
          }
        }

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignCenter
          Layout.leftMargin: 30

          Image {
            width: 40
            height: 40
            anchors.fill: parent
            source: "file:///home/draco/Downloads/iconizer-calendar-days-regular"
          }

          onClicked: {
            console.log("Calendar Icon Clicked")
          }
        }

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignCenter
          Layout.leftMargin: 30

          Image {
            width: 40
            height: 40
            anchors.fill: parent
            source: "file:///home/draco/Downloads/iconizer-clock-rotate-left-solid.svg"
          }

          onClicked: {
            console.log("History Icon Clicked")
          }
        }

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignCenter
          Layout.leftMargin: 30

          Image {
            width: 40
            height: 40
            anchors.fill: parent
            source: "file:///home/draco/Downloads/iconizer-headset-solid.svg"
          }

          onClicked: {
            console.log("Support Icon Clicked")
          }
        }

        Button {
          Material.background: "#231F20"
          Layout.alignment: Qt.AlignCenter
          Layout.leftMargin: 30

          Image {
            width: 40
            height: 40
            anchors.fill: parent
            source: "file:///home/draco/Downloads/iconizer-address-card-solid.svg"
          }

          onClicked: {
            console.log("Hospital Patients Icon Clicked")
          }
        }
      }
    }
  }
}
