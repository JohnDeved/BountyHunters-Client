if (isServer) exitWith {};

waitUntil {!isNull findDisplay 46};
call misc_fnc_defineAsync;
call misc_fnc_defineSync;

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call event_fnc_onKeyDown"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call event_fnc_onKeyUp"];
addMissionEventHandler ["Draw3D", event_fnc_onDraw];
inGameUISetEventHandler["Action","_this call" + str {
    params ["_target"];
    _return = false;
    if !(isNil{_target getVariable "buyable"}) then {
        _return = true;
    };
    _return
}];

["Hud_functions"] call misc_fnc_autoInit;

while {true} do event_fnc_onHeapStack;
