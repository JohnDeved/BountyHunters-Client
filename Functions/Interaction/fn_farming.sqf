params ["_ctrl", "_arr"];
_arr params ["_obj", "_configName", "_name"];
_pos = getPosATL _obj;

_sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + 1.5];

_icon = "icons\process.paa";
_ctrlText = ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");

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
_infoText = "";
if (realCursorObject == _obj) then {
    _keyColor = "#FFFFFF";
    if (keyPressed == getNumber (missionConfigFile >> "CfgHotKeys" >> "Interact" >> "key")) then {
        _keyColor = "#0A78F2";
    };
    _infoText = "Hold <t color='" + _keyColor + "'><img image='" + _key + "'/></t> To <t color='#0A78F2'>HARVEST</t>";
};
_infoText = ("<t align='center' shadow='2'>" + _infoText + "</t>");

[_obj, _ctrl, _sPos, 10, 3, _ctrlText, _infoText, _selectText] call dialog_fnc_interaction;
