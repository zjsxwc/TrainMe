import QtQuick 2.7
import QtQuick.Controls 2.0

Page {
	property var control

    property Menu moreMenu: Menu {}

    Component {
        id: menuComponent
        MenuItem {
            property int index: -1

            onClicked: control.triggerAction(index)
        }
    }

    QtObject {
        id: p

        function reloadMenu() {
            moreMenu.contentModel.clear();
            var menuItems = control.menuActions;
            for(var i = 0; i < menuItems.length; i++) {
                var obj = menuComponent.createObject(moreMenu, {"text": menuItems[i], "index": i});
                moreMenu.addItem(obj);
            }
        }
    }

    Component.onCompleted: {
        root.header.moreMenu = moreMenu;
        control.initialize();

        control.menuActionsChanged.connect(p.reloadMenu);
        p.reloadMenu();
    }

	Component.onDestruction: control.finalize()
}
