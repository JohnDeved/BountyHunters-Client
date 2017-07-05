params ["_display"];

{
    switch (ctrlIDC _x) do {
        case (1500): {
            _ctrl = _x;
            {
                _item = _x select 0;
                _count = _x select 1;
                _className = "";
                {
                    _harvest = getText (_x >> "harvest");
                    if (_harvest isEqualTo _item) then {
                        _className = configName _x;
                    };
                } forEach ("true" configClasses (missionConfigFile >> "CfgPlants" >> "Bushes"));
                _weight = getNumber (missionConfigFile >> "CfgPlants" >> "Bushes" >> _className >> "weigth");

                _ctrl tvAdd [[], _item];
                _ctrl tvAdd [[_forEachIndex], ("Amount: " + str _count)];
                _ctrl tvAdd [[_forEachIndex], ("Weight: " + str (_weight * _count) + "kg")];
            } forEach vItems;
        };
        case (1101): {
            _ctrl = _x;
            _weigths = call misc_fnc_getTotalWeigth;
            if (_weigths isEqualTo []) exitWith {systemChat "couldnt get players total weigth!"};
            _curretWeigth = _weigths select 0;
            _maxWeigth = _weigths select 1;
            _ctrl ctrlSetStructuredText parseText ("<t font='PuristaMedium' shadow='2' size='1.3'>Inventory [" + str _curretWeigth + "/" + str _maxWeigth + "kg]</t>")
        };
        default {};
    };
} forEach allControls _display;
