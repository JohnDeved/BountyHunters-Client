if (!isNil {nearVehicles}) then {
    if !(nearVehicles isEqualTo []) then {
        _nearBuyableVehicles = [];
        {
            if (!isNil {_x getVariable "buyable"}) then {
                _veh = _x;
                {
                    if ((typeOf _veh) isEqualTo (configName _x)) then {
                        _name = getText (configFile >>  "CfgVehicles" >>  typeOf _veh >> "displayName");
                        _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Vehicles" >> typeOf _veh >> "price");
                        _height = getNumber (missionConfigFile >>  "CfgPrices" >> "Vehicles" >> typeOf _veh >> "height");
                        _nearBuyableVehicles pushBack [_veh, _name, _price, _height];
                    };
                } forEach ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Vehicles"));
            };
        } forEach nearVehicles;
        _nearBuyableVehicles
    } else {
        []
    };
};
