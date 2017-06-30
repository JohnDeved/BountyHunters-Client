{
    _val = (_x >> "val");
    switch (true) do {
    	case (isNumber _val): {_val = getNumber _val};
    	case (isText _val): {_val = getText _val};
    	case (isArray _val): {_val = getArray _val;};
    	default {_val = nil};
    };
    missionNamespace setVariable [(configName _x), _val];
} forEach ("true" configClasses (missionConfigFile >> "CfgVariables" >> "Async"));
