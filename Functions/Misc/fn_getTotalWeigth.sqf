_return = [];
_backpack = backpack player;
_maxWeigth = getNumber (missionConfigFile >> "CfgClothing" >> "Backpacks" >> _backpack >> "carryweigth");
_totalWeigth = 0;
{
    _item = _x select 0;
    _count = _x select 1;
    _className = "";
    {
        _harvest = getText (_x >> "variable");
        if (_harvest isEqualTo _item) then {
            _className = configName _x;
        };
    } forEach ("true" configClasses (missionConfigFile >> "CfgPlants"));
    _itemWeigth = getNumber (missionConfigFile >> "CfgPlants" >> _className >> "weigth");
    _itemWeigth = _itemWeigth * _count;
    _totalWeigth = _totalWeigth + _itemWeigth;
} forEach vItems;
_return = [_totalWeigth, _maxWeigth];
_return
