nearStuff = nearestObjects [player, [], 10];
if (!isNil {nearStuff}) then {
    _bushes = [];
    _farmableBushes = [];
    _harvestedBushes = [];

    _trees = [];
    _farmableTrees = [];
    _harvestedTrees = [];
    {
        _name = str _x;
        if (_name find ": b_" != -1) then {
            _bush = _x;
            _bushes pushBack _bush;
            if (isNil {varTower getVariable (str _bush)}) then {
                if (getDammage _bush == 1) then {
                    _bush setDamage 0;
                } else {
                    {
                        _configName = configName _x;
                        if (_name find _configName != -1) then {
                            _displayName = getText (_x >> "displayname");
                            _farmableBushes pushback [_bush, _configName, _displayName];
                        };
                    } forEach ("true" configClasses (missionConfigFile >> "CfgPlants" >> "Bushes"));
                };
            } else {
                _time = varTower getVariable (str _bush);
                if (_time < servertime) then {
                    [_bush] remoteExecCall ["farming_fnc_updatePlant", 2];
                };
                _harvestedBushes pushBack _bush;
            };
        };
        if (_name find ": t_" != -1) then {
            _tree = _x;
            _trees pushBack _tree;
            if (getDammage _tree == 0) then {
                {
                    _configName = configName _x;
                    if (_name find _configName != -1) then {
                        _displayName = getText (_x >> "displayname");
                        _farmableTrees pushback [_tree, _configName, _displayName];
                    };
                } forEach ("true" configClasses (missionConfigFile >> "CfgPlants" >> "Trees"));
            };
        };
    } forEach nearStuff;

    nearBushes = _bushes;
    nearFarmableBushes = _farmableBushes;
    nearharvestedBushes = _harvestedBushes;

    nearTrees = _trees;
    nearFarmableTrees = _farmableTrees;
};
