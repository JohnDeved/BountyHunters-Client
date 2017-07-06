params ["_display", "_key", "_shift", "_ctrl", "_alt"];
if !(onKeydownCooldown) then {
    switch (_key) do {
        case (0xDB): {
            switch (true) do {
                case (cursorObject in nearVehicles): {
                    if (!isNil {cursorObject getVariable "buyable"}) then {
                        if ((cursorObject distance player) < 5) then {
                            {
                                if ((configName _x) isEqualTo (typeOf cursorObject)) then {
                                    [cursorObject] remoteExecCall ["payment_fnc_carShop", 2];
                                };
                            } forEach ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Vehicles"));
                            onKeydownCooldown = true;
                        };
                    };
                };
                case (cursorObject in nearWeapons): {
                    if (!isNil {cursorObject getVariable "buyable"}) then {
                        if ((cursorObject distance player) < 5) then {
                            {
                                if ((configName _x) isEqualTo (typeOf cursorObject)) then {
                                    [cursorObject, "weapon"] remoteExecCall ["payment_fnc_gunShop", 2];
                                };
                            } forEach ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Weapons"));
                            {
                                if ((configName _x) isEqualTo (typeOf cursorObject)) then {
                                    [cursorObject, "attatchment"] remoteExecCall ["payment_fnc_gunShop", 2];
                                };
                            } forEach ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Attatchments"));
                            onKeydownCooldown = true;
                        };
                    };
                };
                case (cursorObject in (nearTrees + nearBushes)): {
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
                case (cursorTarget in nearProcessors): {
                    systemChat ("processor: " + str cursorTarget);
                };
                default {};
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
