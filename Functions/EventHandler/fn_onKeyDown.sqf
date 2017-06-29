params ["_display", "_key", "_shift", "_ctrl", "_alt"];
switch (_key) do {
    case (219): {
        if (cursorObject isKindOf "LandVehicle") then {
            if (!isNil {cursorObject getVariable "buyable"}) then {
                if ((cursorObject distance player) < 5) then {
                    [cursorObject] remoteExecCall ["payment_fnc_carShop", 2];
                };
            };
        };
    };
    default {
        /*systemChat str _this;*/
    };
};
