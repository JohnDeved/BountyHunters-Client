if (!isNil {uiNamespace getVariable ["hud_gunSale",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_gunSale",displayNull];
    _background = _ui displayCtrl 1184;
    _background ctrlShow false;
    _image = _ui displayCtrl 1185;
    _image ctrlShow false;
    {
        if (ctrlIDC _x == -1) then {
            if ((count nearBuyableWeapons)-1 >= _forEachIndex) then {
                _arr = (nearBuyableWeapons select _forEachIndex);
                _item = _arr select 0;
                _name = _arr select 1;
                _type = _arr select 2;
                _price = _arr select 3;
                _price2 = 0;
                _pos = getPosATL _item;
                if (_type == "weapon") then {
                    _price2 = _arr select 4;
                };
                _sPos = worldToScreen _pos;
                if !(_sPos isEqualTo []) then {
                    _x ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _x) / 2), .5, ctrlTextHeight _x];
                    if (cursorObject == _item) then {
                        if ((_item distance player) < 3) then {

                            _xOffset = .25;
                            _yOffset = .10;
                            _boxWidth = .5;
                            _boxHeight = ctrlTextHeight _x;

                            _x1 = _sPos select 0;
                            _y1 = _sPos select 1;

                            _x2 = _x1 - _xOffset;
                            _y2 = _y1 - (_boxHeight + _yOffset);

                            _wImage = 0.03 * safezoneW;
                            _hImage = 0.05 * safezoneH;

                            _xImageOffset = _wImage / 2;
                            _yImageOffset = _hImage;

                            _x ctrlSetPosition [_x2, _y2, _boxWidth, _boxHeight];
                            _background ctrlSetPosition [_x2, _y2, _boxWidth, _boxHeight];
                            _image ctrlSetPosition [_x1 - _xImageOffset, _y1 - _yImageOffset, _wImage, _hImage];
                            _background ctrlCommit 0;
                            _background ctrlShow true;
                            _image ctrlCommit 0;
                            _image ctrlShow true;
                            if (_type == "weapon") then {
                                _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>WEAPON | AMMO</t><br/><t color='#00ff00'>$" + str _price + " | $" + str _price2 + "</t><br/>Press [Win] to <t color='#00ff00'>BUY WEAPON</t><br/>Press [F] to <t color='#00ff00'>BUY AMMO</t></t>");
                                _x ctrlSetFade 0;
                            };
                            if (_type == "attatchment") then {
                                _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>ATTATCHMENT</t><br/><t color='#00ff00'>$" + str _price + "</t><br/>Press [Win] to <t color='#00ff00'>BUY</t></t>");
                                _x ctrlSetFade 0;
                            };
                        } else {
                            _x ctrlSetStructuredText parseText ("<t align='center'>" + _name + "<br/><t color='#ff0000'>For Sale!</t><br/><t color='#00ff00'>$" + str _price + "</t></t>");
                            _x ctrlSetFade 0;
                        }
                    } else {
                        _x ctrlSetStructuredText parseText ("<t align='center'>" + _name + "<br/><t color='#ff0000'>For Sale!</t></t>");
                        _x ctrlSetFade .5;
                    };
                    _x ctrlCommit 0;
                    _x ctrlShow true;
                } else {
                    _x ctrlShow false;
                };
            } else {
                _x ctrlShow false;
            };
        };
    } forEach ((allControls _ui)-[_image, _background]);
};
