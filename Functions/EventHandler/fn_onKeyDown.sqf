params ["_display", "_key", "_shift", "_ctrl", "_alt"];
if !(onKeydownCooldown) then {
    if (keyPressed != _key) then {
        onKeydownCooldown = true;
        keyPressed = _key;
        {
            _handleKey = getNumber (_x >> "key");
            if (_handleKey == _key) then {
                [_key] call (call compile ("hotkey_fnc_" + configName _x));
            };
        } forEach ("true" configClasses (missionConfigFile >> "CfgHotKeys"));
        systemChat str _key;
    };
};
