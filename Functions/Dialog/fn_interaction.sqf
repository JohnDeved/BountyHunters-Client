params ["_obj", "_ctrl", "_sPos", "_visibleDistance", "_interactableDistance", "_ctrlText", "_infoText", "_selectText"];

if !(_sPos isEqualTo []) then {
    if (player distance _obj < _visibleDistance) then {
        _ctrl ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _ctrl) / 1.5), .5, ctrlTextHeight _ctrl];
        if (realCursorObject == _obj) then {
            if ((_obj distance player) < _interactableDistance) then {
                _select ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _select) / 2), .5, ctrlTextHeight _select];
                _select ctrlSetStructuredText parseText _selectText;
                _select ctrlCommit 0;
                _select ctrlShow true;

                _info ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)+((ctrlTextHeight _select) / 2), .5, ctrlTextHeight _info];
                _info ctrlSetStructuredText parseText _infoText;
                _info ctrlCommit 0;
                _info ctrlShow true;

                _ctrl ctrlSetStructuredText parseText _ctrlText;
                _ctrl ctrlSetFade 0;
            } else {
                _ctrl ctrlSetStructuredText parseText _ctrlText;
                _ctrl ctrlSetFade ((player distance _obj) / (_visibleDistance * 1.5));
            };
        } else {
            _ctrl ctrlSetStructuredText parseText _ctrlText;
            _ctrl ctrlSetFade ((player distance _obj) / _visibleDistance);
        };
        _ctrl ctrlCommit 0;
        _ctrl ctrlShow true;
    } else {
        _ctrl ctrlShow false;
    };
} else {
    _ctrl ctrlShow false;
};
