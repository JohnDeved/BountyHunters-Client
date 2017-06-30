params ["_display", "_key", "_shift", "_ctrl", "_alt"];
switch (_key) do {
    case (0xDB): {
        if (cursorObject isKindOf "LandVehicle") then {
            if (!isNil {cursorObject getVariable "buyable"}) then {
                if ((cursorObject distance player) < 5) then {
                    [cursorObject] remoteExecCall ["payment_fnc_carShop", 2];
                };
            };
        };
        if (cursorObject isKindOf "WeaponHolder") then {
            if (!isNil {cursorObject getVariable "buyable"}) then {
                if ((cursorObject distance player) < 5) then {
                    if ((typeOf cursorObject) find "Weapon_" != -1) then {
                        [cursorObject, "weapon"] remoteExecCall ["payment_fnc_gunShop", 2];
                    };
                    if ((typeOf cursorObject) find "Item_muzzle_" != -1 || (typeOf cursorObject) find "Item_optic_" != -1 || (typeOf cursorObject) find "Item_acc_flashlight_" != -1) then {
                        [cursorObject, "attatchment"] remoteExecCall ["payment_fnc_gunShop", 2];
                    };
                };
            };
        };
    };
    case (0x21): {
        if (cursorObject isKindOf "WeaponHolder") then {
            if (!isNil {cursorObject getVariable "buyable"}) then {
                if ((cursorObject distance player) < 5) then {
                    if ((typeOf cursorObject) find "Weapon_" != -1) then {
                        [cursorObject, "ammo"] remoteExecCall ["payment_fnc_gunShop", 2];
                    };
                };
            };
        };
    };
    default {
        /*systemChat str _this;*/
    };
};
