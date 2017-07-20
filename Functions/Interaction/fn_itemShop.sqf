params ["_ctrl", "_arr"];
_arr params ["_item", "_name", "_type", "_price", "_heigth"];
_price2 = 0;
_pos = getPosATL _item;
_sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + _heigth];
if (_type == "weapon") then {
    _price2 = _arr select 5;
};
_icon = "";
switch (_type) do {
    case ("weapon"): {
        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\handgun_ca.paa";
    };
    case ("attatchment"): {
        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\itemoptic_ca.paa";
    };
    case ("clothing"): {
        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\uniform_ca.paa";
    };
    case ("headgear"): {
        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\headgear_ca.paa";
    };
    case ("backpack"): {
        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\backpack_ca.paa";
    };
};

_selectIcon = "";
if (actionKeyPressed == 1 && realCursorObject == _item) then {
    switch (keyPressed) do {
        case (getNumber (missionConfigFile >> "CfgHotKeys" >> "Interact" >> "key")): {
            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
        };
        case (getNumber (missionConfigFile >> "CfgHotKeys" >> "InteractAlt" >> "key")): {
            if (_type == "weapon") then {
                _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
                _icon = "\a3\ui_f\data\igui\cfg\cursors\iconrearmat_ca.paa";
            } else {
                _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
            };
        };
        default {
            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
        };
    };
} else {
    _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
};

_ctrlText = ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");

_selectText = ("<t align='center' shadow='0' size='2'><img image='" + _selectIcon + "'/></t>");

_infoText = "";
if (realCursorObject == _item) then {
    if (_type == "weapon") then {
        _key = "icons\win.paa";
        _key2 = "icons\f.paa";
        _priceColor = "";
        if (Cash >= _price) then {
            _priceColor = "#0A78F2";
            _keyColor = "#FFFFFF";
            if (keyPressed == getNumber (missionConfigFile >> "CfgHotKeys" >> "Interact" >> "key")) then {
                _keyColor = "#0A78F2";
            };
            _infoText = "Hold <t color='" + _keyColor + "'><img image='" + _key + "'/></t> To <t color='#0A78F2'>BUY</t>";
            canBuyCursorItem = true;
        } else {
            _priceColor = "#94090D";
            _infoText = "Cant Afford";
            canBuyCursorItem = false;
        };
        _priceColor2 = "";
        _infoText2 = "";
        if (Cash >= _price2) then {
            _priceColor2 = "#0A78F2";
            _keyColor = "#FFFFFF";
            if (keyPressed == getNumber (missionConfigFile >> "CfgHotKeys" >> "InteractAlt" >> "key")) then {
                _keyColor = "#0A78F2";
            };
            _infoText2 = "Hold <t color='" + _keyColor + "'><img image='" + _key2 + "'/></t> To <t color='#0A78F2'>BUY</t>";
            canBuyCursorAmmo = true;
        } else {
            _priceColor2 = "#94090D";
            _infoText2 = "Cant Afford";
            canBuyCursorAmmo = false;
        };
        _infoText = ("<t align='center' shadow='2'>"+
            "Weapon: <t color='" + _priceColor + "'>$" + str _price + "</t><br/>"+_infoText+"<br/>"+
            "Ammo: <t color='" + _priceColor2 + "'>$" + str _price2 + "</t><br/>"+_infoText2+
        "</t>");
    } else {
        _key = "icons\win.paa";
        _priceColor = "";
        if (Cash >= _price) then {
            _priceColor = "#0A78F2";
            _keyColor = "#FFFFFF";
            if (keyPressed == getNumber (missionConfigFile >> "CfgHotKeys" >> "Interact" >> "key")) then {
                _keyColor = "#0A78F2";
            };
            _infoText = "Hold <t color='" + _keyColor + "'><img image='" + _key + "'/></t> To <t color='#0A78F2'>BUY</t>";
            canBuyCursorItem = true;
        } else {
            _priceColor = "#94090D";
            _infoText = "Cant Afford";
            canBuyCursorItem = false;
        };
        _infoText = ("<t align='center' shadow='2'><t color='" + _priceColor + "'>$" + str _price + "</t><br/>"+ _infoText + "</t>");
    };
};

[_item, _ctrl, _sPos, 10, 3, _ctrlText, _infoText, _selectText] call dialog_fnc_interaction;
