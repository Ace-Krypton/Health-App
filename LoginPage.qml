import QtQuick
import QtQuick.Controls

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

  Column {
    id: columnID
    anchors.centerIn: parent
    spacing: 10

    TextField {
      id: usernameField
      placeholderText: "Username"
    }

    TextField {
      id: passwordField
      placeholderText: "Password"
      echoMode: TextInput.Password
    }

    Column {
      spacing: 10

      Button {
        width: passwordField.width

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
        width: passwordField.width

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
