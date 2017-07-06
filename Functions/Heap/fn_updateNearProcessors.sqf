nearProcessors = player nearObjects ["Land_InfoStand_V2_F", 10];
_nearUseableProcessors = [];
{
    if (!isNil {_x getVariable "processor"}) then {
        _processor = _x;
        _processorType = _x getVariable "processor";
        {
            if (((configName _x) isEqualTo _processorType)) then {
                _processTime = getNumber (_x >> "processtime");
                _processReturn = getText (_x >> "processreturn");
                _nearUseableProcessors pushBack [_processor, _processorType, _processTime, _processReturn];
            };
        } forEach ("true" configClasses (missionConfigFile >> "CfgProcessors"));
    };
} forEach nearProcessors;

nearUseableProcessors = _nearUseableProcessors;
