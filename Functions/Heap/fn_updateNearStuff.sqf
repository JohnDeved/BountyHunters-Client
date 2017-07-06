nearStuff = nearestObjects [player, [], 10];
if (!isNil {nearStuff}) then {
    _bushes = [];
    _farmableBushes = [];
    _harvestedBushes = [];

    _trees = [];
    _farmableTrees = [];
    _harvestedTrees = [];

    _noidObjs = [];
    {
        _name = str _x;
        switch (true) do {
            case (_name find "NOID <no shape>" != -1): {
                _noidObjs pushBack _x;
            };
            case (_name find ": b_" != -1): {
                _bushes pushBack _x;
            };
            case (_name find ": t_" != -1): {
                _trees pushBack _x;
            };
        };
    } forEach nearStuff;

    nearNoidObjs = _noidObjs;
    nearBushes = _bushes;
    nearTrees = _trees;

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
                if (_time < servertime) then {
                    [_bush, servertime] remoteExecCall ["farming_fnc_updatePlant", 2];
                };
                _harvestedBushes pushBack _bush;
            };
        };
    } forEach _bushes;

    nearFarmableBushes = _farmableBushes;
    nearharvestedBushes = _harvestedBushes;

    // put tree stuff here ->
    nearFarmableTrees = _farmableTrees;
};
