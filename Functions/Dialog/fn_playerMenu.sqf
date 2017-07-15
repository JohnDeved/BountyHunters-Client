params ["_display"];

{
    switch (ctrlIDC _x) do {
        case (1500): {
            _ctrl = _x;
            {
                _x params ["_item", "_count"];
                _weight = getNumber (missionConfigFile >> "CfgvItems" >> _item >> "weigth");
                _displayName = getText (missionConfigFile >> "CfgvItems" >> _item >> "displayname");

                _ctrl tvAdd [[], _displayName];
                _ctrl tvAdd [[_forEachIndex], ("Amount: " + str _count)];
                _ctrl tvAdd [[_forEachIndex], ("Weight: " + str (_weight * _count) + "kg")];
            } forEach vItems;
            tvExpandAll _ctrl;
        };
        case (1101): {
            _ctrl = _x;
            _weigths = call misc_fnc_getTotalWeigth;
            if (_weigths isEqualTo []) exitWith {systemChat "couldnt get players total weigth!"};
            _weigths params ["_currentWeigth", "_maxWeigth"];
            _ctrl ctrlSetStructuredText parseText ("<t font='PuristaMedium' shadow='2' size='1.3'>Inventory [" + str _currentWeigth + "/" + str _maxWeigth + "kg]</t>");
        };
        default {};
    };
} forEach allControls _display;
