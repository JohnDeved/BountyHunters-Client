nearWeapons = player nearObjects ["WeaponHolder",8];
if (!isNil {nearWeapons}) then {
    if !(nearWeapons isEqualTo []) then {
        _nearBuyableWeapons = [];
        {
            if (!isNil {_x getVariable "buyable"}) then {
                _name = getText (configFile >>  "CfgVehicles" >>  typeOf _x >> "displayName");
                if ((typeOf _x) find "Weapon_" != -1) then {
                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> typeOf _x >> "price");
                    _priceAmmo = getNumber (missionConfigFile >>  "CfgPrices" >> "Weapons" >> typeOf _x >> "ammoPrice");
                    _type = "weapon";
                    _nearBuyableWeapons pushBack [_x, _name, _type, _price, _priceAmmo];
                };
                if ((typeOf _x) find "Item_muzzle_" != -1 || (typeOf _x) find "Item_optic_" != -1 || (typeOf _x) find "Item_acc_flashlight_" != -1) then {
                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "WeaponAttatchments" >> typeOf _x >> "price");
                    _type = "attatchment";
                    _nearBuyableWeapons pushBack [_x, _name, _type, _price];
                };
            };
        } forEach nearWeapons;
        nearBuyableWeapons = _nearBuyableWeapons;
    } else {
        nearBuyableWeapons = [];
    };
};
