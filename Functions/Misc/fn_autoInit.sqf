{
    _fnc_name = configName _x;
    if (_fnc_name in _this) then {
        _tag = getText (_x >> "tag");
        {
            _fnc = missionNamespace getVariable (_tag + "_fnc_" + configName _x);
            call _fnc;
        } forEach ("true" configClasses (_x >> _tag));
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgFunctions"));
