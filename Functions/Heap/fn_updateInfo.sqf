if (!isNil {uiNamespace getVariable ["hud_info",displayNull]}) then {
    disableSerialization;
    _ui = uiNamespace getVariable ["hud_info",displayNull];
    {
        _x ctrlSetStructuredText parseText ("<t align='center' color='#00ff00' size='1.5'>$" + str Cash + "</t>");
        if (cursorObject isKindOf "LandVehicle") then {
            if (!isNil {cursorObject getVariable "buyable"}) then {
                if ((cursorObject distance player) < 5) then {
                    _price = getNumber (missionConfigFile >>  "CfgPrices" >> "Vehicles" >> typeOf cursorObject >> "price");
                    _x ctrlSetStructuredText parseText ("<t align='center'><t color='#00ff00' size='1.5'>$" + str Cash + "</t><br/><t color='#ff0000'>- $" + str _price + "</t><br/>$" + str (Cash - _price) + "</t>");
                };
            };
        };
        _x ctrlCommit 0;
        _x ctrlShow true;
    } forEach allControls _ui;
};
