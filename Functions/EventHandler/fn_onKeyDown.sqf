params ["_display", "_key", "_shift", "_ctrl", "_alt"];
if !(onKeydownCooldown) then {
    if (keyPressed != _key) then {
        keyPressed = _key;
        switch (_key) do {
            case (0xDB): {
                switch (true) do {
                    case (realCursorObject in nearVehicles): {
                        if (!isNil {realCursorObject getVariable "buyable"}) then {
                            if ((realCursorObject distance player) < 5) then {
                                {
                                    if ((configName _x) isEqualTo (typeOf realCursorObject)) then {
                                        [realCursorObject] remoteExecCall ["payment_fnc_carShop", 2];
                                    };
                                } forEach ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Vehicles"));
                                onKeydownCooldown = true;
                            };
                        };
                    };
                    case (realCursorObject in nearWeapons): {
                        if (!isNil {realCursorObject getVariable "buyable"} || isSimpleObject realCursorObject) then {
                            if ((realCursorObject distance player) < 5) then {
                                onKeydownCooldown = true;
                                [realCursorObject, _key, .5, {
                                    _weaponsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Weapons"));
                                    _attatchmentsConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Attatchments"));
                                    _clothingConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Clothing"));
                                    _headGearConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "HeadGear"));
                                    _backpackConfig = ("true" configClasses (missionConfigFile >> "CfgPrices" >> "Backpacks"));
                                    if !(isSimpleObject realCursorObject) then {
                                        {
                                            if ((configName _x) isEqualTo (typeOf realCursorObject)) then {
                                                if (_x in _weaponsConfig) then {
                                                    [realCursorObject, "weapon"] remoteExecCall ["payment_fnc_gunShop", 2];
                                                };
                                                if (_x in _attatchmentsConfig) then {
                                                    [realCursorObject, "attatchment"] remoteExecCall ["payment_fnc_gunShop", 2];
                                                };
                                                if (_x in _clothingConfig) then {
                                                    [realCursorObject, "clothing"] remoteExecCall ["payment_fnc_gunShop", 2];
                                                };
                                                if (_x in _headGearConfig) then {
                                                    [realCursorObject, "headgear"] remoteExecCall ["payment_fnc_gunShop", 2];
                                                };
                                            };
                                        } forEach (_weaponsConfig + _attatchmentsConfig + _clothingConfig + _headGearConfig);
                                    } else {
                                        _class = [realCursorObject] call misc_fnc_getSimpleObjectClass;
                                        {
                                            if ((configName _x) isEqualTo _class) then {
                                                [realCursorObject, "backpack"] remoteExecCall ["payment_fnc_gunShop", 2];
                                            };
                                        } forEach _backpackConfig;
                                    };
                                }] spawn dialog_fnc_actionKey;
                            };
                        };
                    };
                    case (realCursorObject in (nearTrees + nearBushes)): {
                        if (animationState player in ["amovpercmstpsnonwnondnon", "amovpercmstpsraswrfldnon", "amovpercmstpsraswpstdnon"]) then {
                            if (player distance realCursorObject < 5) then {
                                {
                                    if (_x find realCursorObject != -1) then {
                                            _plant = _x;
                                            _plant pushBack servertime;
                                            _plant remoteExecCall ["farming_fnc_harvestPlant", 2];

                                    };
                                } forEach (nearFarmableBushes);
                                {
                                    if (_x find realCursorObject != -1) then {
                                        hint str _x;
                                        player playmove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
                                    };
                                } forEach (nearFarmableTrees);
                            };
                        };
                    };
                    case (realCursorObject in nearProcessors): {
                        if (player distance realCursorObject < 5) then {
                            [realCursorObject] remoteExecCall ["farming_fnc_processing", 2];
                        };
                    };
                    default {};
                };
            };
            case (0x21): {
                if (realCursorObject isKindOf "WeaponHolder") then {
                    if (!isNil {realCursorObject getVariable "buyable"}) then {
                        if ((realCursorObject distance player) < 5) then {
                            onKeydownCooldown = true;
                            if ((typeOf realCursorObject) find "Weapon_" != -1) then {
                                [realCursorObject, _key, .5, {
                                    [realCursorObject, "ammo"] remoteExecCall ["payment_fnc_gunShop", 2];
                                }] spawn dialog_fnc_actionKey;
                            };
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
};
