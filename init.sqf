if (isServer) exitWith {};

[]spawn {
    call misc_fnc_defineAsync;
    call misc_fnc_defineSync;

    waitUntil {!isNull findDisplay 46};
    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call event_fnc_onKeyDown"];
    addMissionEventHandler ["Draw3D", event_fnc_onDraw];

    {
        _fnc_name = configName _x;
        if (_fnc_name in ["Hud_functions"]) then {
            _tag = getText (_x >> "tag");
            {
                _fnc = missionNamespace getVariable (_tag + "_fnc_" + configName _x);
                call _fnc;
            } forEach ("true" configClasses (_x >> _tag));
        };
    } forEach ("true" configClasses (missionConfigFile >> "CfgFunctions"));

    while {true} do event_fnc_onHeapStack;
};
