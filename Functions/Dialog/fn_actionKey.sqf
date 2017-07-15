params ["_key", "_time", "_callback"];
for "_i" from 0 to 24 do {
    if (keyPressed != _key) exitWith {loadingCount = 0};
    if (loadingCount >= 24) then {
        loadingCount = 0;
        keyPressed = 0;
        playSound "addItemOK";
        call _callback;
    } else {
        loadingCount = loadingCount + 1;
    };
    sleep (_time / 24);
};
