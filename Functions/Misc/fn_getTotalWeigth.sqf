_maxWeigth = call misc_fnc_getMaxWeigth;
_totalWeigth = 0;
{
    _item = _x select 0;
    _count = _x select 1;
    _itemWeigth = getNumber (missionConfigFile >> "CfgvItems" >> _item >> "weigth");
    _itemWeigth = _itemWeigth * _count;
    _totalWeigth = _totalWeigth + _itemWeigth;
} forEach vItems;
_return = [_totalWeigth, _maxWeigth];
_return
