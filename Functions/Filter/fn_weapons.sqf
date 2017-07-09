if (!isNil {nearWeapons}) then {
    if !(nearWeapons isEqualTo []) then {
        _nearBuyableWeapons = [];
        {
            if (!isNil {_x getVariable "buyable"}) then {
                _name = getText (configFile >>  "CfgVehicles" >>  typeOf _x >> "displayName");
                _item = _x;
                _weaponsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Weapons"));
                _attatchmentsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Attatchments"));
                _clothingConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Clothing"));
                _headGearConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "HeadGear"));
                {
                    if ((typeOf _item) isEqualTo (configName _x)) then {
                        if (_x in _weaponsConfig) then {
                            _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> typeOf _item >> "price");
                            _priceAmmo = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> typeOf _item >> "ammoPrice");
                            _type = "weapon";
                            _nearBuyableWeapons pushBack [_item, _name, _type, _price, _priceAmmo];
                        };
                        if (_x in _attatchmentsConfig) then {
                            _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Attatchments" >> typeOf _item >> "price");
                            _type = "attatchment";
                            _nearBuyableWeapons pushBack [_item, _name, _type, _price];
                        };
                        if (_x in _clothingConfig) then {
                            _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Clothing" >> typeOf _item >> "price");
                            _type = "clothing";
                            _nearBuyableWeapons pushBack [_item, _name, _type, _price];
                        };
                        if (_x in _headGearConfig) then {
                            _price = getNumber (missionConfigFile >>  "CfgPrices" >> "HeadGear" >> typeOf _item >> "price");
                            _type = "headgear";
                            _nearBuyableWeapons pushBack [_item, _name, _type, _price];
                        };
                    };
                } forEach (_weaponsConfig + _attatchmentsConfig + _clothingConfig + _headGearConfig);
            };
        } forEach nearWeapons;
        _nearBuyableWeapons
    } else {
        []
    };
};
