import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15

Window {
  id: window
  width: 644
  height: 480
  visible: true
  color: "#231F20"

  property bool isFirstPagePushed: false

  StackView {
    id: stackView
    anchors.fill: parent
    initialItem: loginPageComponent

    Component {
      id: loginPageComponent

      LoginPage {
        onLoginSuccess: {
          stackView.replace(loginPageComponent, mainPageComponent)
        }
      }
    }

    Component {
      id: mainPageComponent
      MainPage {}
    }
  }
}
