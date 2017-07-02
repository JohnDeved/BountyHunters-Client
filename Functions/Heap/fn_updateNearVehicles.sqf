nearVehicles = player nearObjects ["LandVehicle", 20];
if (!isNil {nearVehicles}) then {
    if !(nearVehicles isEqualTo []) then {
        _nearBuyableVehicles = [];
        {
            if (!isNil {_x getVariable "buyable"}) then {
                _name = getText (configFile >>  "CfgVehicles" >>  typeOf _x >> "displayName");
                _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Vehicles" >> typeOf _x >> "price");
                _height = getNumber (missionConfigFile >>  "CfgPrices" >> "Vehicles" >> typeOf _x >> "height");
                _nearBuyableVehicles pushBack [_x, _name, _price, _height];
            };
        } forEach nearVehicles;
        nearBuyableVehicles = _nearBuyableVehicles;
    } else {
        nearBuyableVehicles = [];
    };
};
