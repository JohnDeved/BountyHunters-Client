params ["_key"];

if (realCursorObject isKindOf "WeaponHolder") then {
    if (!isNil {realCursorObject getVariable "buyable"}) then {
        if ((realCursorObject distance player) < 3) then {
            if ((typeOf realCursorObject) find "Weapon_" != -1) then {
                if (canBuyCursorAmmo) then {
                    [realCursorObject, _key, .5, {
                        [realCursorObject, "ammo"] remoteExecCall ["payment_fnc_gunShop", 2];
                    }] spawn dialog_fnc_actionKey;
                };
            };
        };
    };
};
