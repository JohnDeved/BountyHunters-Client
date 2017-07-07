nearObjs = player nearObjects 20;

if (!isNil {nearObjs}) then {

    _noidObjs = [];
    _bushes = [];
    _trees = [];
    _vehicles = [];
    _weapons = [];
    _processor = [];

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
            case (_x isKindOf "LandVehicle"): {
                _vehicles pushBack _x;
            };
            case (_x isKindOf "WeaponHolder"): {
                _weapons pushback _x;
            };
            case (_x isKindOf "Land_InfoStand_V2_F"): {
                _processor pushback _x;
            };
        };
    } forEach nearObjs;

    nearNoidObjs = _noidObjs;
    nearBushes = _bushes;
    nearTrees = _trees;
    nearVehicles = _vehicles;
    nearWeapons = _weapons;
    nearProcessors = _processor;

    nearBuyableVehicles = call filter_fnc_vehicles;
    nearBuyableWeapons = call filter_fnc_weapons;
    nearUseableProcessors = call filter_fnc_processors;
    nearFarmableBushes = call filter_fnc_bushes;
    nearFarmableTrees = [];

};
