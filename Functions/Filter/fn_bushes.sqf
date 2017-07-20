_farmableBushes = [];
{
    if (vehicle player isKindOf "man") then {
        _name = str _x;
        _bush = _x;
        if (isNil {varTower getVariable (str _bush)}) then {
            {
                _configName = configName _x;
                if (_name find _configName != -1) then {
                    if (getDammage _bush > 0) then {
                        if (_noidObjs isEqualTo []) then {
                            _bush setDamage 0;
                        };
                    };
                    _displayName = getText (_x >> "displayname");
                    _farmableBushes pushback [_bush, _configName, _displayName];
                };
            } forEach ("true" configClasses (missionConfigFile >> "CfgPlants"));
        } else {
            _time = varTower getVariable (str _bush);
            if (_time < realServerTime) then {
                [_bush] remoteExecCall ["farming_fnc_updatePlant", 2];
            };
        };
    };
} forEach nearBushes;
_farmableBushes
