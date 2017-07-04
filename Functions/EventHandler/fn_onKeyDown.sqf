params ["_display", "_key", "_shift", "_ctrl", "_alt"];
if !(onKeydownCooldown) then {
    switch (_key) do {
        case (0xDB): {
            if (cursorObject isKindOf "LandVehicle") then {
                if (!isNil {cursorObject getVariable "buyable"}) then {
                    if ((cursorObject distance player) < 5) then {
                        [cursorObject] remoteExecCall ["payment_fnc_carShop", 2];
                        onKeydownCooldown = true;
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
                        onKeydownCooldown = true;
                    };
                };
            };
            if (cursorObject in (nearTrees + nearBushes)) then {
                if (animationState player in ["amovpercmstpsnonwnondnon", "amovpercmstpsraswrfldnon", "amovpercmstpsraswpstdnon"]) then {
                    {
                        if (_x find cursorObject != -1) then {
                            if (player distance cursorObject < 5) then {
                                _plant = _x;
                                _plant pushBack servertime;
                                _plant remoteExecCall ["farming_fnc_harvestPlant", 2];
                            };
                        };
                    } forEach (nearFarmableBushes);
                    {
                        if (_x find cursorObject != -1) then {
                            hint str _x;
                            player playmove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
                        };
                    } forEach (nearFarmableTrees);
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
                        onKeydownCooldown = true;
                    };
                };
            };
        };
        case (0x15): {
            createDialog "RscPlayerMenu";
            onKeydownCooldown = true;
        };
        default {
            /*systemChat str _this;*/
        };
    };
};
