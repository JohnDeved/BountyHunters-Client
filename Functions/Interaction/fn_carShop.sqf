params ["_ctrl", "_arr"];
_arr params ["_veh", "_name", "_price", "_height"];
_pos = getPosATL _veh;

_sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + _height];

_icon = getText (configFile >> "CfgVehicles" >> typeof _veh >> "picture");
_ctrlText = ("<t align='center' shadow='2'>" + _name + "<br/><t size='.6'><img image='" + _icon + "' /></t></t><t size='2'> </t><t align='right' size='2'> </t>");

_selectIcon = "";
if (actionKeyPressed == 1) then {
    switch (keyPressed) do {
        case (getNumber (missionConfigFile >> "CfgHotKeys" >> "Interact" >> "key")): {
            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
        };
        default {
            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
        };
    };
} else {
    _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
};
_selectText = ("<t align='center' shadow='0' size='2'><img image='" + _selectIcon + "'/></t>");

_key = "icons\win.paa";
_priceColor = "";
_infoText = "";
if (realCursorObject == _veh) then {
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
};
_infoText = ("<t align='center' shadow='2'><t color='" + _priceColor + "'>$" + str _price + "</t><br/>" + _infoText + "</t>");

[_veh, _ctrl, _sPos, 10, 5, _ctrlText, _infoText, _selectText] call dialog_fnc_interaction;
