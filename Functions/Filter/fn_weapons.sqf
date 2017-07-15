if (!isNil {nearWeapons}) then {
    if !(nearWeapons isEqualTo []) then {
        _nearBuyableWeapons = [];
        {
            if (!isNil {_x getVariable "buyable"} || isSimpleObject _x) then {
                _item = _x;
                _weaponsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Weapons"));
                _attatchmentsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Attatchments"));
                _clothingConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Clothing"));
                _headGearConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "HeadGear"));
                _backpackConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Backpacks"));

                if !(isSimpleObject _item) then {
                    _class = typeOf _item;
                    _name = getText (configFile >>  "CfgVehicles" >> _class >> "displayName");
                    {
                        if (_class isEqualTo (configName _x)) then {
                            switch (true) do {
                                case (_x in _weaponsConfig): {
                                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> _class >> "price");
                                    _heigth = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> _class >> "heigth");
                                    _priceAmmo = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> _class >> "ammoPrice");
                                    _type = "weapon";
                                    _nearBuyableWeapons pushBack [_item, _name, _type, _price, _heigth, _priceAmmo];
                                };
                                case (_x in _attatchmentsConfig): {
                                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Attatchments" >> _class >> "price");
                                    _heigth = getNumber (missionConfigFile >>  "CfgPrices" >> "Attatchments" >> _class >> "heigth");
                                    _type = "attatchment";
                                    _nearBuyableWeapons pushBack [_item, _name, _type, _price, _heigth];
                                };
                                case (_x in _clothingConfig): {
                                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Clothing" >> _class >> "price");
                                    _heigth = getNumber (missionConfigFile >>  "CfgPrices" >> "Clothing" >> _class >> "heigth");
                                    _type = "clothing";
                                    _nearBuyableWeapons pushBack [_item, _name, _type, _price, _heigth];
                                };
                                case (_x in _headGearConfig): {
                                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "HeadGear" >> _class >> "price");
                                    _heigth = getNumber (missionConfigFile >>  "CfgPrices" >> "HeadGear" >> _class >> "heigth");
                                    _type = "headgear";
                                    _nearBuyableWeapons pushBack [_item, _name, _type, _price, _heigth];
                                };
                                default {};
                            };
                        };
                    } forEach (_weaponsConfig + _attatchmentsConfig + _clothingConfig + _headGearConfig);
                } else {
                    _class = [_item] call misc_fnc_getSimpleObjectClass;
                    {
                        if (_class isEqualTo (configName _x)) then {
                            switch (true) do {
                                case (_x in _backpackConfig): {
                                    _name = getText (configFile >>  "CfgVehicles" >> _class >> "displayName");
                                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Backpacks" >> _class >> "price");
                                    _heigth = getNumber (missionConfigFile >>  "CfgPrices" >> "Backpacks" >> _class >> "heigth");
                                    _type = "backpack";
                                    _nearBuyableWeapons pushBack [_item, _name, _type, _price, _heigth];
                                };
                                default {};
                            };
                        };
                    } forEach _backpackConfig;
                };
            };
        } forEach nearWeapons;
        _nearBuyableWeapons
    } else {
        []
    };
};
