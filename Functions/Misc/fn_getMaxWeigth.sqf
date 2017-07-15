private ["_maxWeigth", "_backpack"];

_maxWeigth = 0;
_backpack = backpack player;
if !(_backpack isEqualTo "") then {
    _maxWeigth = getNumber (missionConfigFile >> "CfgClothing" >> _backpack >> "carryweigth");
} else {
    _maxWeigth = getNumber (missionConfigFile >> "CfgClothing" >> "None" >> "carryweigth");
};
_maxWeigth
