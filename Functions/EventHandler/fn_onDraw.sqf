if (!isNil {uiNamespace getVariable ["hud_carSale",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_carSale",displayNull];
    {
        if ((count nearBuyableVehicles)-1 >= _forEachIndex) then {
            _arr = (nearBuyableVehicles select _forEachIndex);
            _veh = _arr select 0;
            _name = _arr select 1;
            _price = _arr select 2;
            _height = _arr select 3;
            _pos = getPosATL _veh;

            _sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + _height];
            if !(_sPos isEqualTo []) then {
                _x ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _x) / 2), .5, ctrlTextHeight _x];
                if (cursorObject == _veh) then {
                    if ((_veh distance player) < 5) then {
                        _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>For Sale!</t><br/><t color='#00ff00'>$" + str _price + "</t><br/>Press [Win] to <t color='#00ff00'>BUY CAR</t></t>");
                        _x ctrlSetFade 0;
                    } else {
                        _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>For Sale!</t><br/><t color='#00ff00'>$" + str _price + "</t></t>");
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
    } forEach allControls _ui;
};

if (!isNil {uiNamespace getVariable ["hud_gunSale",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_gunSale",displayNull];
    {
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
                    if ((_item distance player) < 5) then {
                        if (_type == "weapon") then {
                            _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>WEAPON | AMMO</t><br/><t color='#00ff00'>$" + str _price + " | $" + str _price2 + "</t><br/>Press [Win] to <t color='#00ff00'>BUY WEAPON</t><br/>Press [F] to <t color='#00ff00'>BUY AMMO</t></t>");
                            _x ctrlSetFade 0;
                        };
                        if (_type == "attatchment") then {
                            _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>ATTATCHMENT</t><br/><t color='#00ff00'>$" + str _price + "</t><br/>Press [Win] to <t color='#00ff00'>BUY ATTATCHMENT</t></t>");
                            _x ctrlSetFade 0;
                        };
                    } else {
                        _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>For Sale!</t><br/><t color='#00ff00'>$" + str _price + "</t></t>");
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
    } forEach allControls _ui;
};
