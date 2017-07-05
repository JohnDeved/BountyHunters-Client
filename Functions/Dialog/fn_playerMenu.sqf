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
        default {};
    };
} forEach allControls _display;

/*
_CT_TREE tvAdd [ [],"Parent_A"];
_CT_TREE tvAdd [ [0],"Child_A"];
_CT_TREE tvAdd [ [0,0],"Grandchild_A"];
_CT_TREE tvAdd [ [],"Parent_B"];
_CT_TREE tvAdd [ [1],"Child_B"];
*/
