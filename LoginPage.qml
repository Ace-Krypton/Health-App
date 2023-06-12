import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Item {
  width: columnID.implicitWidth
  height: columnID.implicitHeight

  signal loginSuccess

  function clearFields() {
    usernameField.clear()
    passwordField.clear()
  }

  function validateFields() {
    return usernameField.text.trim().length > 0 && passwordField.text.trim(
          ).length > 0
  }

  ColumnLayout {
    id: columnID
    anchors.centerIn: parent
    spacing: 10

    TextField {
      id: usernameField
      Layout.fillWidth: true
      selectByMouse: true
      placeholderText: qsTr("Your username or email")
      verticalAlignment: Text.AlignVCenter
    }

    TextField {
      id: passwordField
      Layout.fillWidth: true
      selectByMouse: true
      placeholderText: qsTr("Your password")
      verticalAlignment: Text.AlignVCenter
      echoMode: TextInput.Password
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
            messageLabel.color = success ? "green" : "red"
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
            messageLabel.color = success ? "green" : "red"
            labelText.text = success ? "Successful Register" : "Failed Register"
            clearFields()
          }
        }
      }
    }

    Rectangle {
      id: messageBox
      width: parent.width
      height: 30
      color: messageLabel.color
      border.color: "black"
      Layout.alignment: Qt.AlignHCenter

      Label {
        id: messageLabel
        anchors.centerIn: parent
        color: "white"

        Text {
          anchors.centerIn: parent
          id: labelText
          text: qsTr("")
        }
      }
    }
  }
}
