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
            if ((count allNearObjects)-1 >= _forEachIndex) then {
                _arr = (allNearObjects select _forEachIndex);
                switch (true) do {
                    case (_arr in nearBuyableWeapons): {[_x, _arr] call interaction_fnc_itemShop};
                    case (_arr in nearBuyableVehicles): {[_x, _arr] call interaction_fnc_carShop};
                    case (_arr in nearFarmableBushes): {[_x, _arr] call interaction_fnc_farming};
                    case (_arr in nearUseableProcessors): {[_x, _arr] call interaction_fnc_processor};
                    default {_x ctrlShow false};
                };
            } else {
                _x ctrlShow false;
            };
        };
    } forEach ((allControls _ui)-[_image, _background, _text, _select, _info]);
};
