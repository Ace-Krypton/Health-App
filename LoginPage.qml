import QtQuick
import QtQuick.Shapes 1.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

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
    txtfield.clear()
    passfield.clear()
  }

  function validateFields() {
    return txtfield.text.trim().length > 0 && passfield.text.trim().length > 0
  }

  Image {
    anchors.fill: parent
    source: "file:///home/draco/Downloads/background.png"
  }

  ColumnLayout {
    x: 175
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
    width: 350
    spacing: 10

    Rectangle {
      id: usernameFieldContainer
      Layout.fillWidth: true
      height: 50
      radius: 15
      color: "transparent"
      border.width: 0

      TextField {
        id: txtfield
        anchors.fill: parent
        selectByMouse: true

        QtObject {
          id: internal
        }

        color: '#ffffff'
        placeholderTextColor: "#7fffffff"
        selectedTextColor: '#000000'
        selectionColor: '#ffffff'
        font.family: "Verdana"
        font.pointSize: 10
        placeholderText: qsTr("Email or username")

        cursorDelegate: Rectangle {
          id: cursor
          visible: false
          color: "#7fffffff"
          width: 2

          SequentialAnimation {
            loops: Animation.Infinite
            running: txtfield.cursorVisible

            PropertyAction {
              target: cursor
              property: 'visible'
              value: true
            }

            PauseAnimation {
              duration: 600
            }

            PropertyAction {
              target: cursor
              property: 'visible'
              value: false
            }

            PauseAnimation {
              duration: 600
            }

            onStopped: {
              cursor.visible = false
            }
          }
        }

        background: Rectangle {
          id: bg
          color: "#2c313c"
          radius: 10
        }
      }
    }

    Rectangle {
      id: passwordFieldContainer
      Layout.fillWidth: true
      height: 50
      radius: 15
      color: "transparent"
      border.width: 0

      TextField {
        id: passfield
        anchors.fill: parent
        selectByMouse: true
        echoMode: TextInput.Password

        QtObject {
          id: passternal
        }

        color: '#ffffff'
        placeholderTextColor: "#7fffffff"
        selectedTextColor: '#000000'
        selectionColor: '#ffffff'
        font.family: "Verdana"
        font.pointSize: 10
        placeholderText: qsTr("Password")

        cursorDelegate: Rectangle {
          id: passCursor
          visible: false
          color: "#7fffffff"
          width: 2

          SequentialAnimation {
            loops: Animation.Infinite
            running: passfield.cursorVisible

            PropertyAction {
              target: passCursor
              property: 'visible'
              value: true
            }

            PauseAnimation {
              duration: 600
            }

            PropertyAction {
              target: passCursor
              property: 'visible'
              value: false
            }

            PauseAnimation {
              duration: 600
            }

            onStopped: {
              passCursor.visible = false
            }
          }
        }

        background: Rectangle {
          id: background
          color: "#2c313c"
          radius: 10
        }
      }
    }

    RowLayout {
      Layout.alignment: Qt.AlignHCenter

      Button {
        id: loginButton
        Layout.fillWidth: true
        Layout.margins: 10

        Rectangle {
          color: "green"
          radius: 15
          border.color: "transparent"
          anchors.centerIn: parent

          Text {
            id: loginText
            anchors.centerIn: parent
            text: qsTr("Login")
          }
        }

        onClicked: {
          if (validateFields()) {
            var username = txtfield.text
            var password = passfield.text
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

        Rectangle {
          color: "white"
          radius: 15
          border.color: "transparent"
          anchors.centerIn: parent

          Text {
            id: registerText
            anchors.centerIn: parent
            text: qsTr("Register")
          }
        }

        onClicked: {
          if (validateFields()) {
            var username = txtfield.text
            var password = passfield.text
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
      Layout.alignment: Qt.AlignHCenter

      Text {
        id: labelText
        text: qsTr("")
        anchors.centerIn: parent
        font.family: "Montserrat"
        font.pixelSize: 16
      }
    }
  }
}
