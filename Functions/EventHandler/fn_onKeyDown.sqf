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
                            _weaponsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Weapons"));
                            _attatchmentsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Attatchments"));
                            _clothingConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Clothing"));
                            _headGearConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "HeadGear"));
                            {
                                if ((configName _x) isEqualTo (typeOf cursorObject)) then {
                                    if (_x in _weaponsConfig) then {
                                        [cursorObject, "weapon"] remoteExecCall ["payment_fnc_gunShop", 2];
                                    };
                                    if (_x in _attatchmentsConfig) then {
                                        [cursorObject, "attatchment"] remoteExecCall ["payment_fnc_gunShop", 2];
                                    };
                                    if (_x in _clothingConfig) then {
                                        [cursorObject, "clothing"] remoteExecCall ["payment_fnc_gunShop", 2];
                                    };
                                    if (_x in _headGearConfig) then {
                                        [cursorObject, "headgear"] remoteExecCall ["payment_fnc_gunShop", 2];
                                    };
                                };
                            } forEach (_weaponsConfig + _attatchmentsConfig + _clothingConfig + _headGearConfig);
                            onKeydownCooldown = true;
                        };
                    };
                };
                case (cursorObject in (nearTrees + nearBushes)): {
                    if (animationState player in ["amovpercmstpsnonwnondnon", "amovpercmstpsraswrfldnon", "amovpercmstpsraswpstdnon"]) then {
                        if (player distance cursorObject < 5) then {
                            {
                                if (_x find cursorObject != -1) then {
                                        _plant = _x;
                                        _plant pushBack servertime;
                                        _plant remoteExecCall ["farming_fnc_harvestPlant", 2];

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
                case (cursorTarget in nearProcessors): {
                    if (player distance cursorObject < 5) then {
                        [cursorObject] remoteExecCall ["farming_fnc_processing", 2];
                    };
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
