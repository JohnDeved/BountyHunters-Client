if (!isNil {uiNamespace getVariable ["hud_processor",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_processor",displayNull];
    {
        if ((count nearUseableProcessors)-1 >= _forEachIndex) then {
            _arr = nearUseableProcessors select _forEachIndex;
            _processor = _arr select 0;
            _processorType = _arr select 1;
            _processTime = _arr select 2;
            _processReturn = _arr select 3;
            _pos = getPosATL _processor;

            _sPos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + 1];

            if !(_sPos isEqualTo []) then {
                if (player distance _processor < 10) then {
                    _x ctrlSetPosition [(_sPos select 0)-.25, (_sPos select 1)-((ctrlTextHeight _x) / 2), .5, ctrlTextHeight _x];
                    if (cursorObject == _processor && (player distance _processor) < 5) then {
                        _x ctrlSetStructuredText parseText ("<t align='center'><t size='1.5'>" + _processReturn + " Processor</t><br/><t color='#ff0000'>Resource</t><br/>Press [Win] to <t color='#00ff00'>Process</t></t>");
                        _x ctrlSetFade 0;
                    } else {
                        _x ctrlSetStructuredText parseText ("<t align='center'>" + _processReturn + " Processor<br/><t color='#ff0000'>Resource</t></t>");
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
        } else {
            _x ctrlShow false;
        };
    } forEach allControls _ui;
};
