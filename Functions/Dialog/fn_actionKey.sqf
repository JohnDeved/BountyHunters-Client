params ["_obj", "_key", "_time", "_callback"];
if (isNil "actionKeyActive") then {actionKeyActive = false};
if !(actionKeyActive) then {
    actionKeyActive = true;
    for "_i" from 0 to 24 do {
        if (keyPressed != _key || realCursorObject != _obj) exitWith {
            loadingCount = 0;
            actionKeyPressed = 0;
            keyPressed = 0;
            actionKeyActive = false;
        };
        if (loadingCount >= 24) exitWith {
            loadingCount = 0;
            actionKeyPressed = 0;
            actionKeyActive = false;
            playSound "addItemOK";
            call _callback;
        };
        loadingCount = loadingCount + 1;
        actionKeyPressed = 1;
        sleep (_time / 24);
    };
};
