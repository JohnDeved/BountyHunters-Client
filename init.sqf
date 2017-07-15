if (isServer) exitWith {};

[]spawn {
    waitUntil {!isNull findDisplay 46};
    call misc_fnc_defineAsync;
    call misc_fnc_defineSync;

    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call event_fnc_onKeyDown"];
    (findDisplay 46) displayAddEventHandler ["KeyUp", "_this call event_fnc_onKeyUp"];
    addMissionEventHandler ["Draw3D", event_fnc_onDraw];

    ["Hud_functions"] call misc_fnc_autoInit;

    while {true} do event_fnc_onHeapStack;
};
