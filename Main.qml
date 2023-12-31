import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.15

ApplicationWindow {
  id: window
  width: 1221
  height: 674
  visible: true
  color: "#231F20"

  flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint
         | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

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

      MainPage {
        onPatientsPage: {
          stackView.replace(mainPageComponent, patientPageComponent)
        }
      }
    }

    Component {
      id: patientPageComponent

      PatientPage {}
    }
  }
}
