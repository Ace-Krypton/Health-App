import QtQuick
import QtQuick.Shapes 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Item {
  id: window
  width: columnID.implicitWidth
  height: columnID.implicitHeight

  signal loginSuccess

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

  function clearFields() {
    usernameField.clear()
    passwordField.clear()
  }

  function validateFields() {
    return usernameField.text.trim().length > 0 && passwordField.text.trim(
          ).length > 0
  }

  Image {
    anchors.fill: parent
    source: "file:///home/draco/Downloads/background.png"
  }

  //  Shape {
  //    width: parent.width / 2
  //    height: parent.height

  //    ShapePath {
  //      strokeWidth: 4
  //      strokeColor: "#231F20"
  //      fillGradient: LinearGradient {

  //        GradientStop {
  //          position: 0
  //          color: "#231F20"
  //        }

  //        GradientStop {
  //          position: 0.2
  //          color: "#231F20"
  //        }

  //        GradientStop {
  //          position: 0.4
  //          color: "#231F20"
  //        }

  //        GradientStop {
  //          position: 0.6
  //          color: "#231F20"
  //        }

  //        GradientStop {
  //          position: 1
  //          color: "#231F20"
  //        }
  //      }

  //      PathLine {
  //        x: window.width - 100
  //        y: window.height
  //      }

  //      PathLine {
  //        x: 0
  //        y: window.height
  //      }

  //      PathLine {
  //        x: 0
  //        y: 0
  //      }
  //    }
  //  }
  ColumnLayout {
    x: 110
    anchors.top: parent.top
    spacing: 10

    Item {
      Layout.preferredHeight: 220
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
      color: "white"
      font.pixelSize: 40
      text: window.timeString
      Layout.alignment: Qt.AlignHCenter
    }

    Text {
      id: pDayInfo
      color: "beige"
      font.pixelSize: 20
      text: window.dateString
      Layout.alignment: Qt.AlignHCenter
    }
  }

  ColumnLayout {
    id: columnID
    x: 100
    y: window.height / 2 + 40
    spacing: 10

    TextField {
      id: usernameField
      Layout.fillWidth: true
      selectByMouse: true
      placeholderText: qsTr("Your username or email")
      verticalAlignment: Text.AlignVCenter

      background: Rectangle {
        radius: 15
        color: "white"
      }
    }

    TextField {
      id: passwordField
      Layout.fillWidth: true
      selectByMouse: true
      placeholderText: qsTr("Your password")
      verticalAlignment: Text.AlignVCenter
      echoMode: TextInput.Password

      background: Rectangle {
        radius: 15
        color: "white"
      }
    }

    RowLayout {
      Layout.alignment: Qt.AlignHCenter

      Button {
        id: loginButton
        Layout.fillWidth: true
        Layout.margins: 10

        Text {
          anchors.centerIn: parent
          id: loginText
          text: qsTr("Login")
        }

        onClicked: {
          if (validateFields()) {
            var username = usernameField.text
            var password = passwordField.text
            var success = userManager.loginUser(username, password)
            labelText.color = success ? "green" : "red"
            labelText.text = success ? "Successful Login" : "Failed Login"
            success ? loginSuccess() : clearFields()
          }
        }
      }

      Button {
        id: registerButton
        Layout.fillWidth: true
        Layout.margins: 10

        Text {
          anchors.centerIn: parent
          id: registerText
          text: qsTr("Register")
        }

        onClicked: {
          if (validateFields()) {
            var username = usernameField.text
            var password = passwordField.text
            var success = userManager.registerUser(username, password)
            labelText.color = success ? "green" : "red"
            labelText.text = success ? "Successful Register" : "Failed Register"
            clearFields()
          }
        }
      }
    }

    Rectangle {
      id: messageBox
      height: 30
      radius: 15
      Layout.alignment: Qt.AlignHCenter

      Label {
        id: messageLabel
        anchors.centerIn: parent

        Text {
          id: labelText
          text: qsTr("")
          color: "yellow"
          anchors.centerIn: parent
          font.family: "Montserrat"
          font.pixelSize: 16
        }
      }
    }
  }
}
