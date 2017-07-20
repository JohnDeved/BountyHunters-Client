if (!isNil {uiNamespace getVariable ["hud_info",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_info",displayNull];
    {
        _x ctrlSetStructuredText parseText ("<t align='center' color='#00ff00' size='1.5'>$" + str Cash + "</t>");
        _x ctrlCommit 0;
        _x ctrlShow true;
    } forEach allControls _ui;
};
