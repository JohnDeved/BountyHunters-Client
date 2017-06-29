cutText ["","BLACK FADED", 1e5];
{
    cutText ["Syncing " + (configName _x) + "...","BLACK FADED", 1e5];
    [[(configName _x)]] remoteExecCall ["sync_fnc_variable", 2];
    waitUntil {
        if (!isNil {missionNamespace getVariable (configName _x)}) exitWith {true};
    }
} forEach ("true" configClasses (missionConfigFile >> "CfgVariables" >> "Sync"));
cutText ["","BLACK IN"];
