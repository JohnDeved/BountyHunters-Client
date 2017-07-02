if (!isNil {uiNamespace getVariable ["hud_farming",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_farming",displayNull];
    {
        if ((count (nearFarmableBushes + nearFarmableTrees))-1 >= _forEachIndex) then {
            _arr = ((nearFarmableBushes + nearFarmableTrees) select _forEachIndex);
            _obj = _arr select 0;
            _configName = _arr select 1;
            _name = _arr select 2;
            _pos = getPosATL _obj;

            _sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + 1.5];

            if !(_sPos isEqualTo []) then {
                _x ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _x) / 2), .5, ctrlTextHeight _x];
                if (cursorObject == _obj && (player distance _obj) < 5) then {
                    _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _name + "</t><br/><t color='#ff0000'>Resource</t><br/>Press [Win] to <t color='#00ff00'>FARM</t></t>");
                    _x ctrlSetFade 0;
                } else {
                    _x ctrlSetStructuredText parseText ("<t align='center'>" + _name + "<br/><t color='#ff0000'>Resource</t></t>");
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
