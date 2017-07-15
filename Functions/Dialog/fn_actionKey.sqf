params ["_obj", "_key", "_time", "_callback"];
for "_i" from 0 to 24 do {
    if (keyPressed != _key || cursorObject != _obj) exitWith {
        loadingCount = 0;
        actionKeyPressed = 0;
        keyPressed = 0;
    };
    if (loadingCount >= 24) exitWith {
        loadingCount = 0;
        actionKeyPressed = 0;
        keyPressed = 0;
        playSound "addItemOK";
        call _callback;
    };
    loadingCount = loadingCount + 1;
    actionKeyPressed = 1;
    sleep (_time / 24);
};
