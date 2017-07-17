if (!isNil {uiNamespace getVariable ["hud_gunSale",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_gunSale",displayNull];
    _background = _ui displayCtrl 1184;
    _background ctrlShow false;
    _image = _ui displayCtrl 1185;
    _image ctrlShow false;
    _text = _ui displayCtrl 1186;
    _text ctrlShow false;
    _select = _ui displayCtrl 1187;
    _select ctrlShow false;
    _info = _ui displayCtrl 1188;
    _info ctrlShow false;
    {
        if (ctrlIDC _x == -1) then {
            if ((count nearBuyableWeapons)-1 >= _forEachIndex) then {
                _arr = (nearBuyableWeapons select _forEachIndex);
                _item = _arr select 0;
                _name = _arr select 1;
                _type = _arr select 2;
                _price = _arr select 3;
                _heigth = _arr select 4;
                _price2 = 0;
                _pos = getPosATL _item;
                if (_type == "weapon") then {
                    _price2 = _arr select 5;
                };
                _icon = "";
                switch (_type) do {
                    case ("weapon"): {
                        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\handgun_ca.paa";
                    };
                    case ("attatchment"): {
                        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\itemoptic_ca.paa";
                    };
                    case ("clothing"): {
                        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\uniform_ca.paa";
                    };
                    case ("headgear"): {
                        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\headgear_ca.paa";
                    };
                    case ("backpack"): {
                        _icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\backpack_ca.paa";
                    };
                };
                _sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + _heigth];
                if !(_sPos isEqualTo []) then {
                    if (player distance _item < 10) then {
                        _x ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _x) / 1.5), .5, ctrlTextHeight _x];
                        if (realCursorObject == _item) then {
                            if ((_item distance player) < 3) then {
                                _selectIcon = "";
                                if (actionKeyPressed == 1) then {
                                    switch (keyPressed) do {
                                        case (0xDB): {
                                            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
                                        };
                                        case (0x21): {
                                            if (_type == "weapon") then {
                                                _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
                                                _icon = "\a3\ui_f\data\igui\cfg\cursors\iconrearmat_ca.paa";
                                            } else {
                                                _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
                                            };
                                        };
                                        default {
                                            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
                                        };
                                    };
                                } else {
                                    _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa";
                                };

                                _select ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _select) / 2), .5, ctrlTextHeight _select];
                                _select ctrlSetStructuredText parseText ("<t align='center' shadow='2' size='2'><img image='" + _selectIcon + "'/></t>");
                                _select ctrlCommit 0;
                                _select ctrlShow true;

                                if (_type == "weapon") then {
                                    _key = "icons\win.paa";
                                    _key2 = "icons\f.paa";
                                    _info ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)+((ctrlTextHeight _select) / 2), .5, ctrlTextHeight _info];
                                    _info ctrlSetStructuredText parseText ("<t align='center' shadow='2'>"+
                                        "Weapon: <t color='#0A78F2'>$" + str _price + "</t><br/>"+
                                        "Hold <img image='" + _key + "'/> To <t color='#0A78F2'>BUY</t><br/>"+
                                        "Ammo: <t color='#0A78F2'>$" + str _price2 + "</t><br/>"+
                                        "Hold <img image='" + _key2 + "'/> To <t color='#0A78F2'>BUY</t>"+
                                    "</t>");
                                    _info ctrlCommit 0;
                                    _info ctrlShow true;
                                } else {
                                    _key = "icons\win.paa";
                                    _info ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)+((ctrlTextHeight _select) / 2), .5, ctrlTextHeight _info];
                                    _info ctrlSetStructuredText parseText ("<t align='center' shadow='2'><t color='#0A78F2'>$" + str _price + "</t><br/>Hold <img image='" + _key + "'/> To <t color='#0A78F2'>BUY</t></t>");
                                    _info ctrlCommit 0;
                                    _info ctrlShow true;
                                };

                                _x ctrlSetStructuredText parseText ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");
                                _x ctrlSetFade 0;
                            } else {
                                _x ctrlSetStructuredText parseText ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");
                                _x ctrlSetFade 0;
                            };
                        } else {
                            _x ctrlSetStructuredText parseText ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");
                            _x ctrlSetFade ((player distance _item) / 10);
                        };
                        _x ctrlCommit 0;
                        _x ctrlShow true;
                    } else {
                        _x ctrlShow false;
                    };
                } else {
                    _x ctrlShow false;
                };
            } else {
                _x ctrlShow false;
            };
        };
    } forEach ((allControls _ui)-[_image, _background, _text, _select, _info]);
};
