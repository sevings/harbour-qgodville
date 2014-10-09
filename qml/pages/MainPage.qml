import QtQuick.LocalStorage 2.0
import QtQuick 2.0
import Sailfish.Silica 1.0
import '../settings.js' as Settings
import "../HeroData.js" as Data

Page {
    id: page
    BusyIndicator {
        id: indicator
        size: BusyIndicatorSize.Large
        x: (isPortrait ? Screen.width : Screen.height)/2 - width/2
        y: (isPortrait ? Screen.height : Screen.width)/2 - height/2
        z: 5
    }
    SilicaFlickable {
        contentHeight: column.height + Theme.paddingLarge
        anchors.fill: parent

        //anchors.left: parent.left
        //anchors.right: parent.right

        ViewPlaceholder {
            enabled: !name.visible
            text: qsTr('Нет данных') + translator.emptyString
        }


        PullDownMenu {
            MenuItem {
                text: qsTr('Помощь') + translator.emptyString
                onClicked: pageStack.push('HelpPage.qml', {}, PageStackAction.Animated)
            }
            MenuItem {
                text: qsTr('Настройки') + translator.emptyString
                onClicked: {
                    var dialog = pageStack.push('SettingsPage.qml', {}, PageStackAction.Animated);
                    dialog.accepted.connect(ini);
                }
            }
        }

        VerticalScrollDecorator {
        }

        Column {
            id: column
            width: parent.width - 2*Theme.paddingLarge
            x: Theme.paddingLarge
            spacing: Theme.paddingSmall
            PageHeader {
                id: header
                //title: Data.data.godname
            }

            SectionHeader {
                id: hHero
                //text: qsTr('Герой')
                visible: name.visible
            }

            DataRow {
                id: name
                lText: qsTr('Имя') + translator.emptyString
                //param: 'name'
            }
            DataRow {
                id: gender
                lText: qsTr('Пол') + translator.emptyString
                //param: 'gender'
                //rText: Data.data.gender === 'male' ? qsTr('мужской') : qsTr('женский')
            }
            DataRow {
                id: motto
                lText: qsTr('Девиз') + translator.emptyString
                //param: 'motto'
            }
            DataRow {
                id: alignment
                lText: qsTr('Характер') + translator.emptyString
                //param: 'alignment'
            }
            DataRow {
                id: clan
                lText: qsTr('Гильдия') + translator.emptyString
                //param: 'clan'
                //rText: Data.data.clan + ' (' + Data.data.clan_position + ')'
            }

            SectionHeader {
                id: hData
                //text: qsTr('Данные героя')
                visible: level.visible
            }
            DataRow {
                id: level
                lText: qsTr('Уровень')  + translator.emptyString//exp_progress
                //param: 'level'
            }
            DataBar {
                id: expBar
                barColor: '#f9b436'
                //param: 'exp_progress'
            }
            DataRow {
                id: inventory
                lText: qsTr('Инвентарь') + translator.emptyString
                //param: 'inventory_num'
                //rText: Data.data.inventory_num + '/' + Data.data.inventory_max_num
            }
            DataBar {
                id: invBar
                barColor: '#882d17'
                //param: 'inventory_num'
                //maxValue: Data.data.inventory_max_num
            }
            DataRow {
                id: health
                lText: qsTr('Здоровье') + translator.emptyString
                //param: 'health'
                //rText: Data.data.health + '/' + Data.data.max_health
            }
            DataBar {
                id: healthBar
                barColor: value < maxValue * 0.3 ? '#eb0000' : (value < maxValue * 0.7 ? '#f6f600' : '#008000')
                //param: 'health'
                //maxValue: Data.data.max_health
            }
            DataRow {
                id: quest
                lText: qsTr('Задание') + translator.emptyString //quest_progress
                //param: 'quest'
            }
            DataBar {
                id: questBar
                barColor: '#ffc0cb'
                //param: 'quest_progress'
            }
            DataRow {
                id: gold
                lText: qsTr('Золота') + translator.emptyString
                //param: 'gold_approx'
            }
            DataRow {
                id: bricks
                //lText: Data.data.brick_cnt < 1000 ? qsTr('Кирпичей для храма') : qsTr('Дерева для ковчега')
                //param: Data.data.brick_cnt < 1000 ? 'bricks_cnt' : 'wood_cnt'
                //rText: Data.data.brick_cnt < 1000 ? Data.data.bricks_cnt/10 + '%' : Data.data.wood_cnt/10 + '%'
            }
            DataRow {
                id: distance
                //lText: Data.data.town_name.length > 0 ? qsTr('Город') : qsTr('Столбов от столицы')
                //param: Data.data.town_name.length > 0 ? 'town_name' : 'distance'
                //rText: Data.data.town_name.length > 0 ? 'town_name' : qsTr('%1 шт'.arg(Data.data.distance))
            }

            SectionHeader {
                id: hPet
                text: qsTr('Питомец') + translator.emptyString
                visible: petName.visible
            }
            DataRow {
                id: petName
                lText: qsTr('Имя') + translator.emptyString
                //param: 'pet'
                //rText: Data.data.pet.pet_name
            }
            DataRow {
                id: petClass
                lText: qsTr('Вид') + translator.emptyString
                //param: 'pet'
                //rText: Data.data.pet.pet_class
            }
            DataRow {
                id: petLevel
                lText: qsTr('Уровень') + translator.emptyString
                //param: 'pet'
                //rText: Data.data.pet.pet_level
            }

            SectionHeader {
                id: hDiary
                //text: qsTr('Дневник героя')
                visible: diary.visible
            }
            Label {
                id: diary
                //text: Data.data.diary_last
                width: parent.width
                wrapMode: Text.Wrap
            }

            SectionHeader {
                id: hInventory
                //text: Data.data.inventory_num > 0 ? qsTr('В карманах у героя можно найти:') : qsTr('В карманах пусто.')
                wrapMode: Text.Wrap
            }
            Column {
                id: invColumn
                width: parent.width
                visible: hInventory.visible
                //x: Theme.paddingLarge
                spacing: Theme.paddingSmall
            }

            SectionHeader {
                id: hPower
                text: qsTr('Вмешательство') + translator.emptyString
                visible: power.visible
            }
            DataRow {
                id: power
                lText: qsTr('Прана') + translator.emptyString
                //param: 'godpower'
                //rText: Data.data.godpower + '%'
            }
            DataBar {
                id: powerBar
                barColor: '#199bdc'
                //param: 'godpower'
            }
        }
    }

    Component.onCompleted: ini()
    Component.onDestruction: saveJson() // not calls?

    Timer {
        id: timer
        interval: 60000
        repeat: true
        triggeredOnStart: true
        onTriggered: reloadData()
    }

    function ini() {
        console.debug('initialization');
        Settings.initialize();
        Data.godname = Settings.getSetting('godname');
        if (Data.godname.length === 0)
            Data.godname = 'Godville';
        Data.server = Settings.getSetting('server');
        if (Data.server.length === 0)
            Data.server = 'godvillegame.com';
        Data.url = 'http://' + Data.server + '/gods/api/' + Data.godname + '.json';

        if (Data.server !== 'godville.net')
            translator.selectLanguage("en");
        else
            translator.selectLanguage("ru");

        Data.json = Settings.getSetting('json');
        if (Data.json.length > 0) {
            //console.debug(Data.json);
            Data.data = JSON.parse(Data.json);
            //console.debug(Data.data);
            updateData();
        }
        timer.restart();
    }

    function reloadData() {
        indicator.running = true;
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            // Need to wait for the DONE state or you'll get errors
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status === 200) {
                    Data.json = request.responseText;
                    Data.data = JSON.parse(Data.json);
                    var now = new Date();
                    console.debug(now.toTimeString() + ' json downloaded');
                    updateData();
                    saveJson();
                    indicator.running = false;
                }
                else {
                    // This is very handy for finding out why your web service won't talk to you
                    console.debug("Status: " + request.status + ", Status Text: " + request.statusText);
                }
            }
        }
        request.open("GET", Data.url, true); // only async supported
        request.send()
    }

    function updateRow(id, param, text) {
        //id.visible = Data.data.hasOwnProperty(param);
        //console.debug(param + ': ' + Data.data.hasOwnProperty(param));
        //console.debug(param + ': ' + Data.data[param])
        if (Data.data.hasOwnProperty(param)) {
            id.visible = true;
            if (text.length > 0)
                id.rText = text;
            else
                id.rText = Data.data[param];
        }
        else
            id.visible = false;
    }

    function updatePetRow(id, param) {
        //id.visible = Data.data.hasOwnProperty('pet') && Data.data.pet.hasOwnProperty(param);
        if (Data.data.hasOwnProperty('pet') && Data.data.pet.hasOwnProperty(param)) {
            id.visible = true;
            id.rText = Data.data.pet[param];
        }
        else
            id.visible = false;
    }

    function updateBar(id, param, maxValue) {
        //id.visible = Data.data.hasOwnProperty(param);
        //console.debug('bar ' + param + ': ' + Data.data.hasOwnProperty(param));
        //console.debug('bar ' + param + ': ' + Data.data[param])
        if (Data.data.hasOwnProperty(param)) {
            id.visible = true;
            id.value = Data.data[param];
            id.maxValue = maxValue;
        }
        else
            id.visible = false;
    }

    function updateData() {
        header.title = Data.data.godname;

        updateRow(name, 'name', '');
        var text = Data.data.gender === 'male' ? qsTr('мужской') + translator.emptyString : qsTr('женский') + translator.emptyString;
        updateRow(gender, 'gender', text);
        if (Data.data.motto.length > 0)
            updateRow(motto, 'motto', '');
        else
            motto.visible = false;
        updateRow(alignment, 'alignment', '');
        if (Data.data.clan.length > 0)
            text = Data.data.clan + ' (' + Data.data.clan_position + ')';
        else
            text = qsTr('(не состоит)') + translator.emptyString;
        updateRow(clan, 'clan', text);

        updateRow(level, 'level', '');
        if (Data.data.hasOwnProperty('inventory_num')) {
            text = Data.data.inventory_num + '/' + Data.data.inventory_max_num;
            mainWindow.inv = Data.data.inventory_num / Data.data.inventory_max_num;
            mainWindow.showBars = true;
        }
        else {
            text = Data.data.inventory_max_num;
            mainWindow.showBars = false;
        }
        updateRow(inventory, 'inventory_max_num', text);
        if (Data.data.hasOwnProperty('health')) {
            text = Data.data.health + '/' + Data.data.max_health;
            mainWindow.hp = Data.data.health / Data.data.max_health;
            mainWindow.showBars = true;
        }
        else {
            text = Data.data.max_health;
            mainWindow.showBars = false;
        }
        updateRow(health, 'max_health', text);
        updateRow(quest, 'quest', '');
        updateRow(gold, 'gold_approx', '');
        text = Data.data.bricks_cnt < 1000 ? Data.data.bricks_cnt/10 + '%' : Data.data.wood_cnt/10 + '%';
        updateRow(bricks, 'bricks_cnt', text);
        bricks.lText = Data.data.bricks_cnt < 1000 ? qsTr('Кирпичей для храма') : qsTr('Дерева для ковчега') + translator.emptyString;
        if (Data.data.hasOwnProperty('distance')) {
            text = Data.data.distance === 0 ? Data.data.town_name : qsTr('%1 шт').arg(Data.data.distance) + translator.emptyString;
            distance.lText = Data.data.distance === 0 ? qsTr('Город') : qsTr('Столбов от столицы') + translator.emptyString;
        }
        updateRow(distance, 'distance', text);

        updatePetRow(petName, 'pet_name');
        updatePetRow(petClass, 'pet_class');
        updatePetRow(petLevel, 'pet_level');
        if (petLevel.rText.length === 0)
            petLevel.visible = false;

        //diary.visible = Data.data.hasOwnProperty('diary_last');
        if (Data.data.hasOwnProperty('diary_last')) {
            diary.text = Data.data.diary_last;
            diary.visible = true;
        }
        else
            diary.visible = false;

        if (Data.data.hasOwnProperty('godpower')) {
            text = Data.data.godpower + '%';
            mainWindow.gp = Data.data.godpower / 100;
            mainWindow.showBars = true;
        }
        else
            mainWindow.showBars = false;
        updateRow(power, 'godpower', text);

        //hInventory.visible = Data.data.hasOwnProperty('inventory_num');
        if (Data.data.gender === 'male') {
            if (Data.data.hasOwnProperty('inventory_num')) {
                hInventory.text = Data.data.inventory_num > 0 ?
                            qsTr('В карманах у героя можно найти:') : qsTr('В карманах у героя пусто.') + translator.emptyString;
                hInventory.visible = true;
            }
            else
                hInventory.visible = false;
            hHero.text = qsTr('Герой') + translator.emptyString;
            hData.text = qsTr('Данные героя') + translator.emptyString;
            hDiary.text = qsTr('Дневник героя') + translator.emptyString;
        }
        else {
            if (Data.data.hasOwnProperty('inventory_num')) {
                hInventory.text = Data.data.inventory_num > 0 ?
                            qsTr('В карманах у героини можно найти:') : qsTr('В карманах у героини пусто.') + translator.emptyString;
                hInventory.visible = true;
            }
            else
                hInventory.visible = false;
            hHero.text = qsTr('Героиня') + translator.emptyString;
            hData.text = qsTr('Данные героини') + translator.emptyString;
            hDiary.text = qsTr('Дневник героини') + translator.emptyString;
        }
        updateInventory();

        updateBar(expBar, 'exp_progress', 100);
        updateBar(invBar, 'inventory_num', Data.data.inventory_max_num);
        updateBar(healthBar, 'health', Data.data.max_health);
        updateBar(questBar, 'quest_progress', 100);
        updateBar(powerBar, 'godpower', 100);

        mainWindow.coverText = Data.data.godname;
        if (Data.data.hasOwnProperty('quest_progress')) {
            mainWindow.qp = Data.data.quest_progress / 100;
            mainWindow.showBars = true;
        }
        else
            mainWindow.showBars = false;

        mainWindow.gold = Data.data.gold_approx
        mainWindow.expired = Data.data.hasOwnProperty('expired') && Data.data.expired;
        mainWindow.fight = Data.data.hasOwnProperty('arena_fight') && Data.data.arena_fight;
    }

    function updateInventory() {
        var component = Qt.createComponent('InventoryString.qml')
        for (var i in Data.data.inventory) {
            var price = Data.data.inventory[i].price !== 0;
            var potion = Data.data.inventory[i].hasOwnProperty('type') && Data.data.inventory[i].type === 'heal_potion';
            var activate = Data.data.inventory[i].hasOwnProperty('activate_by_user') && Data.data.inventory[i].activate_by_user;
            var pos = Data.data.inventory[i].pos;
            var string = '• ' + i + (activate ? ' (@)' : '');
            if (pos < Data.inventory.length && Data.inventory[pos] !== null) {
                Data.inventory[pos].text = string;
                Data.inventory[pos].font.bold = price;
                Data.inventory[pos].font.italic = potion;
            }
            else {
                var item = component.createObject(invColumn);
                item.text = string;
                item.font.bold = price;
                item.font.italic = potion;
                item.opacity = 1;
                Data.inventory[pos] = item;
            }
        }
        if (Data.inventory.length > Data.data.inventory_num) //what if inventory_num is undefined?
            for (var i = Data.data.inventory_num; i < Data.inventory.length; i++)
                if (Data.inventory[i] !== null) {
                    //Data.inventory[i].opacity = 0;
                    Data.inventory[i].destroy();
                    Data.inventory[i] = null;
                }
    }

    function saveJson() {
        console.debug("saving json");
        Settings.setSetting('json', Data.json);
    }
}
