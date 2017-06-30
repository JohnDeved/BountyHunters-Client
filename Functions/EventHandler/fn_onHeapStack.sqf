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

if (!isNil {uiNamespace getVariable ["hud_info",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_info",displayNull];
    {
        _x ctrlSetStructuredText parseText ("<t align='center' color='#00ff00' size='1.5'>$" + str Cash + "</t>");
        if (cursorObject isKindOf "LandVehicle") then {
            if (!isNil {cursorObject getVariable "buyable"}) then {
                if ((cursorObject distance player) < 5) then {
                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Vehicles" >> typeOf cursorObject >> "price");
                    _x ctrlSetStructuredText parseText ("<t align='center'><t color='#00ff00' size='1.5'>$" + str Cash + "</t><br/><t color='#ff0000'>- $" + str _price + "</t><br/>$" + str (Cash - _price) + "</t>");
                };
            };
        };
        _x ctrlCommit 0;
        _x ctrlShow true;
    } forEach allControls _ui;
};

sleep .1;
