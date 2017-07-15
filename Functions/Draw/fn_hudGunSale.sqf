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
                        if (cursorObject == _item) then {
                            if ((_item distance player) < 3) then {

                                /*_xOffset = .25;
                                _yOffset = .10;
                                _boxWidth = .5;
                                _boxHeight = ctrlTextHeight _x;

                                _x1 = _sPos select 0;
                                _y1 = _sPos select 1;

                                _x2 = _x1 - _xOffset;
                                _y2 = _y1 - (_boxHeight + _yOffset);

                                _x ctrlSetPosition [_x2, _y2, _boxWidth, _boxHeight];*/

                                _selectIcon = "";
                                switch (keyPressed) do {
                                    case (0xDB): {
                                        _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
                                    };
                                    case (0x21): {
                                        if (_type == "weapon") then {
                                            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_" + str loadingCount + "_ca.paa";
                                            _icon = "\a3\ui_f\data\igui\cfg\cursors\iconrearmat_ca.paa";
                                        } else {
                                            _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\idle\idle_" + str idleLoadingCount + "_ca.paa";
                                        };
                                    };
                                    default {
                                        _selectIcon = "\a3\ui_f\data\igui\cfg\holdactions\idle\idle_" + str idleLoadingCount + "_ca.paa";
                                    };
                                };

                                _text ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _text) / 2), .5, ctrlTextHeight _text];
                                _text ctrlSetStructuredText parseText ("<t align='center' shadow='2' size='2'><img image='\a3\ui_f\data\igui\cfg\holdactions\in\in_3_ca.paa'/></t>");
                                _text ctrlCommit 0;
                                _text ctrlShow true;

                                _select ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _text) / 2), .5, ctrlTextHeight _text];
                                _select ctrlSetStructuredText parseText ("<t align='center' shadow='2' size='2'><img image='" + _selectIcon + "'/></t>");
                                _select ctrlCommit 0;
                                _select ctrlShow true;

                                _x ctrlSetStructuredText parseText ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");
                                _x ctrlSetFade 0;
                            } else {
                                _x ctrlSetStructuredText parseText ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");
                                _x ctrlSetFade 0;
                            };
                        } else {
                            _x ctrlSetStructuredText parseText ("<t align='center' shadow='2'>" + _name + "<br/><t size='2'><img image='" + _icon + "' /></t></t>");
                            _x ctrlSetFade 0;
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
    } forEach ((allControls _ui)-[_image, _background, _text, _select]);
};
