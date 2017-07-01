nearStuff = nearestObjects [player, [], 10];
if (!isNil {nearStuff}) then {
    _bushes = [];
    _farmableBushes = [];
    _trees = [];
    _farmableTrees = [];
    {
        _name = str _x;
        if (_name find ": b_" != -1) then {
            _bush = _x;
            _bushes pushBack _bush;
            {
                _configName = configName _x;
                if (_name find _configName != -1) then {
                    _displayName = getText (_x >> "displayname");
                    _farmableBushes pushback [_bush, _configName, _displayName];
                };
            } forEach ("true" configClasses (missionConfigFile >> "CfgPlants" >> "Bushes"));
        };
        if (_name find ": t_" != -1) then {
            _tree = _x;
            _trees pushBack _tree;
            {
                _configName = configName _x;
                if (_name find _configName != -1) then {
                    _displayName = getText (_x >> "displayname");
                    _farmableTrees pushback [_tree, _configName, _displayName];
                };
            } forEach ("true" configClasses (missionConfigFile >> "CfgPlants" >> "Trees"));
        };
    } forEach nearStuff;

    nearBushes = _bushes;
    nearFarmableBushes = _farmableBushes;
    nearTrees = _trees;
    nearFarmableTrees = _farmableTrees;
};
