class CREATEUNIT
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{"STRING"},{"ARRAY"}};
    };

    class SYNTAX2
    {
        targets[] = {0,0,0};
        args[] = {{"GROUP"},{"ARRAY"}};
    };
};

class CREATEVEHICLE
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"STRING"},{"ARRAY"}};
    };

    class SYNTAX2
    {
        targets[] = {1,0,0};
        args[] = {{},{"ARRAY"}};
    };
};

class CREATEVEHICLELOCAL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"STRING"},{"ARRAY"}};
    };
};

class ALLOWDAMAGE
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"BOOL"}};
    };
};

class ONEACHFRAME
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{},{"STRING","CODE"}};
    };
};

class DRAWICON3D
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{},{"ARRAY"}};
    };
};

class DRAWLINE3D
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{},{"ARRAY"}};
    };
};

class SETPOS
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class SETPOSASL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class SETPOSASL2
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class SETPOSASLW
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class SETPOSATL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class SETPOSITION
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"LOCATION"},{"ARRAY"}};
    };
};

class SETPOSWORLD
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDITEM
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDITEMCARGO
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDITEMCARGOGLOBAL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDITEMPOOL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{},{"ARRAY"}};
    };
};

class ADDITEMTOBACKPACK
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDITEMTOUNIFORM
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDITEMTOVEST
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDWEAPON
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDWEAPONCARGO
{
    class SYNTAX1
    {
        targets[] = {1,1,1};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDWEAPONCARGOGLOBAL
{
    class SYNTAX1
    {
        targets[] = {1,1,1};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDWEAPONGLOBAL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDWEAPONITEM
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDWEAPONPOOL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{},{"ARRAY"}};
    };
};

class ADDWEAPONTURRET
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDMAGAZINE
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };

    class SYNTAX2
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDMAGAZINEAMMOCARGO
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDMAGAZINECARGO
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDMAGAZINECARGOGLOBAL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDMAGAZINEGLOBAL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"STRING"}};
    };
};

class ADDMAGAZINEPOOL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{},{"ARRAY"}};
    };
};

class ADDMAGAZINES
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ADDMAGAZINETURRET
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class SAY
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"ARRAY","OBJECT"},{"STRING"}};
    };

    class SYNTAX2
    {
        targets[] = {1,0,0};
        args[] = {{"ARRAY","OBJECT"},{"ARRAY"}};
    };
};

class SAY2D
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"ARRAY","OBJECT"},{"STRING"}};
    };

    class SYNTAX2
    {
        targets[] = {1,0,0};
        args[] = {{"ARRAY","OBJECT"},{"ARRAY"}};
    };
};

class SAY3D
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"ARRAY","OBJECT"},{"STRING"}};
    };

    class SYNTAX2
    {
        targets[] = {1,0,0};
        args[] = {{"ARRAY","OBJECT"},{"ARRAY"}};
    };
};

class ENABLESIMULATION
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"BOOL"}};
    };
};


class ENABLESIMULATIONGLOBAL
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"OBJECT"},{"BOOL"}};
    };
};

class PUBLICVARIABLE
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{},{"STRING"}};
    };
};

class PUBLICVARIABLECLIENT
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{"SCALAR"},{"STRING"}};
    };
};

class PUBLICVARIABLESERVER
{
    class SYNTAX1
    {
        targets[] = {1,0,0};
        args[] = {{},{"STRING"}};
    };
};

class SETANIMSPEEDCOEF
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{"OBJECT"},{"SCALAR"}};
    };
};

class ADDACTION
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{"OBJECT"},{"ARRAY"}};
    };
};

class ENDMISSION
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{},{"STRING"}};
    };
};

class LOADFILE
{
    class SYNTAX1
    {
        targets[] = {0,1,0};
        args[] = {{},{"STRING"}};
    };
};

class PREPROCESSFILE
{
    class SYNTAX1
    {
        targets[] = {0,1,0};
        args[] = {{},{"STRING"}};
    };
};

class PREPROCESSFILELINENUMBERS
{
    class SYNTAX1
    {
        targets[] = {0,1,0};
        args[] = {{},{"STRING"}};
    };
};

class HINT
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{},{"STRING","TEXT"}};
    };
};

class CTRLCREATE
{
    class SYNTAX1
    {
        targets[] = {0,0,0};
        args[] = {{"DISPLAY"},{"ARRAY"}};
    };
};

class CfgDisabledCommands
{
    class SETUNITLOADOUT
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };

        class SYNTAX2
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"STRING"}};
        };

        class SYNTAX3
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"CONFIG"}};
        };
    };
};
