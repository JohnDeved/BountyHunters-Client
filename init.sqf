if (isServer) exitWith {};

[]spawn {
    call misc_fnc_defineAsync;
    call misc_fnc_defineSync;
    
    waitUntil {!isNull findDisplay 46};
    (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call event_fnc_onKeyDown"];
    addMissionEventHandler ["Draw3D", event_fnc_onDraw];

    call hud_fnc_carSale;
    call hud_fnc_gunSale;
    call hud_fnc_info;

    while {true} do event_fnc_onHeapStack;
};
