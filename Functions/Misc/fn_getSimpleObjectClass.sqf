params ["_obj"];

_name = str _obj;
_class = "";
_prefix = "";
switch (true) do {
    case (_name find "backpack_" != -1): {
        _prefix = "backpack_";
    };
};
_name = _name select [_name find _prefix];
_name = _name select [0, _name find ".p3d"];
switch (_name) do {
    case ("backpack_tortila"): {
        _class = "B_Carryall_cbr";
    };
    case ("backpack_small"): {
        _class = "B_TacticalPack_blk";
    };
    case ("backpack_gorod"): {
        _class = "B_FieldPack_cbr";
    };
    case ("backpack_fast"): {
        _class = "B_Kitbag_cbr";
    };
    case ("backpack_compact"): {
        _class = "B_AssaultPack_rgr";
    };
    default {};
};
_class
