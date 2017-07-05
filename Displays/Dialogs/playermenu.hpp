class RscPlayerMenu {
    idd = -1;
    movingEnable = true;
	enableSimulation = true;
    onLoad = "systemchat'heyho'";

    class controls
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by Adi Frost, v1.063, #Mixule)
        ////////////////////////////////////////////////////////

        class tint: RscText
        {
        	idc = 1000;

        	x = 0 * safezoneW + safezoneX;
        	y = -1.63858e-008 * safezoneH + safezoneY;
        	w = 1 * safezoneW;
        	h = 1 * safezoneH;
        	colorBackground[] = {0.1,0.1,0.1,0.8};
        };
        class background: RscText
        {
        	idc = 1000;

        	x = 0.2 * safezoneW + safezoneX;
        	y = 0.2 * safezoneH + safezoneY;
        	w = 0.6 * safezoneW;
        	h = 0.6 * safezoneH;
        	colorBackground[] = {0.1,0.1,0.1,1};
        };
        class title: RscStructuredText
        {
        	idc = 1100;

        	text = "<t font='PuristaMedium' shadow='2' size='2'>PLAYER MENU</t>"; //--- ToDo: Localize;
        	x = 0.2025 * safezoneW + safezoneX;
        	y = 0.2 * safezoneH + safezoneY;
        	w = 0.1375 * safezoneW;
        	h = 0.04 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class title_underline: RscText
        {
        	idc = 1001;

        	x = 0.2075 * safezoneW + safezoneX;
        	y = 0.24 * safezoneH + safezoneY;
        	w = 0.585 * safezoneW;
        	h = 0.00149816 * safezoneH;
        	colorBackground[] = {0.04,0.47,0.95,1};
        };
        class inventory_title: RscStructuredText
        {
        	idc = 1101;

        	text = "<t font='PuristaMedium' shadow='2' size='1.3'>Inventory</t>"; //--- ToDo: Localize;
        	x = 0.2075 * safezoneW + safezoneX;
        	y = 0.244 * safezoneH + safezoneY;
        	w = 0.2875 * safezoneW;
        	h = 0.036 * safezoneH;
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class stats_title: RscStructuredText
        {
        	idc = 1103;

        	text = "<t font='PuristaMedium' shadow='2' size='1.3'>Stats</t>"; //--- ToDo: Localize;
        	x = 0.4975 * safezoneW + safezoneX;
        	y = 0.244 * safezoneH + safezoneY;
        	w = 0.295 * safezoneW;
        	h = 0.036 * safezoneH;
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class inventory_background: RscText
        {
        	idc = 1002;

        	x = 0.2075 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.2875 * safezoneW;
        	h = 0.284 * safezoneH;
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class stats_background: RscText
        {
        	idc = 1003;

        	x = 0.4975 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.295 * safezoneW;
        	h = 0.284 * safezoneH;
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class stats_background_light: RscText
        {
        	idc = 1004;

        	x = 0.4975 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.295 * safezoneW;
        	h = 0.28 * safezoneH;
        	colorBackground[] = {1,1,1,0.1};
        };
        class invenotry_background_light: RscText
        {
        	idc = 1005;

        	x = 0.2075 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.2875 * safezoneW;
        	h = 0.28 * safezoneH;
        	colorBackground[] = {1,1,1,0.1};
        };
        class invenotry_list: RscListBox
        {
        	idc = 1500;

        	x = 0.2075 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.2875 * safezoneW;
        	h = 0.28 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class remove_item_button: RscButtonMenu
        {
        	idc = 2401;

        	text = "Remove Item"; //--- ToDo: Localize;
        	x = 0.4025 * safezoneW + safezoneX;
        	y = 0.568 * safezoneH + safezoneY;
        	w = 0.0925 * safezoneW;
        	h = 0.032 * safezoneH;
        	colorText[] = {1,1,1,1};
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class use_item_button: RscButtonMenu
        {
        	idc = 2400;

        	text = "Use Item"; //--- ToDo: Localize;
        	x = 0.3075 * safezoneW + safezoneX;
        	y = 0.568 * safezoneH + safezoneY;
        	w = 0.0925 * safezoneW;
        	h = 0.032 * safezoneH;
        	colorText[] = {1,1,1,1};
        	colorBackground[] = {0.15,0.15,0.15,1};
        };
        class use_item_underline: RscText
        {
        	idc = 1006;

        	x = 0.3075 * safezoneW + safezoneX;
        	y = 0.6 * safezoneH + safezoneY;
        	w = 0.0925 * safezoneW;
        	h = 0.00149816 * safezoneH;
        	colorBackground[] = {0.04,0.47,0.95,1};
        };
        class delete_item_underline: RscText
        {
        	idc = 1007;

        	x = 0.4025 * safezoneW + safezoneX;
        	y = 0.6 * safezoneH + safezoneY;
        	w = 0.0925 * safezoneW;
        	h = 0.00149816 * safezoneH;
        	colorBackground[] = {0.04,0.47,0.95,1};
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////

    };
};

/* #Typese
$[
	1.063,
	["playermenu",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,0,0],
	[1010,"tint",[1,"",["0 * safezoneW + safezoneX","-1.63858e-008 * safezoneH + safezoneY","1 * safezoneW","1 * safezoneH"],[-1,-1,-1,-1],[0.1,0.1,0.1,0.8],[-1,-1,-1,-1],"","-1"],["idc = 1000;"]],
	[1001,"background",[1,"",["0.2 * safezoneW + safezoneX","0.2 * safezoneH + safezoneY","0.6 * safezoneW","0.6 * safezoneH"],[-1,-1,-1,-1],[0.1,0.1,0.1,1],[-1,-1,-1,-1],"","-1"],["idc = 1000;"]],
	[1100,"title",[1,"<t font='PuristaMedium' shadow='2' size='2'>PLAYER MENU</t>",["0.2025 * safezoneW + safezoneX","0.2 * safezoneH + safezoneY","0.1375 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,-1],"","-1"],["idc = 1100;"]],
	[1002,"title_underline",[1,"",["0.2075 * safezoneW + safezoneX","0.24 * safezoneH + safezoneY","0.585 * safezoneW","0.00149816 * safezoneH"],[-1,-1,-1,-1],[0.04,0.47,0.95,1],[-1,-1,-1,-1],"","-1"],["idc = 1001;"]],
	[1101,"inventory_title",[1,"<t font='PuristaMedium' shadow='2' size='1.3'>Inventory</t>",["0.2075 * safezoneW + safezoneX","0.244 * safezoneH + safezoneY","0.2875 * safezoneW","0.036 * safezoneH"],[-1,-1,-1,-1],[0.15,0.15,0.15,1],[-1,-1,-1,-1],"","-1"],["idc = 1101;"]],
	[1102,"stats_title",[1,"<t font='PuristaMedium' shadow='2' size='1.3'>Stats</t>",["0.4975 * safezoneW + safezoneX","0.244 * safezoneH + safezoneY","0.295 * safezoneW","0.036 * safezoneH"],[-1,-1,-1,-1],[0.15,0.15,0.15,1],[-1,-1,-1,-1],"","-1"],["idc = 1103;"]],
	[1003,"inventory_background",[1,"",["0.2075 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.2875 * safezoneW","0.284 * safezoneH"],[-1,-1,-1,-1],[0.15,0.15,0.15,1],[-1,-1,-1,-1],"","-1"],["idc = 1002;"]],
	[1004,"stats_background",[1,"",["0.4975 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.295 * safezoneW","0.284 * safezoneH"],[-1,-1,-1,-1],[0.15,0.15,0.15,1],[-1,-1,-1,-1],"","-1"],["idc = 1003;"]],
	[1005,"stats_background_light",[1,"",["0.4975 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.295 * safezoneW","0.28 * safezoneH"],[-1,-1,-1,-1],[1,1,1,0.1],[-1,-1,-1,-1],"","-1"],["idc = 1004;"]],
	[1006,"invenotry_background_light",[1,"",["0.2075 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.2875 * safezoneW","0.28 * safezoneH"],[-1,-1,-1,-1],[1,1,1,0.1],[-1,-1,-1,-1],"","-1"],["idc = 1005;"]],
	[1007,"invenotry_list: RscListBox",[1,"",["0.2075 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.2875 * safezoneW","0.28 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,-1],"","-1"],["idc = 1500;"]],
	[2400,"remove_item_button",[1,"Remove Item",["0.4025 * safezoneW + safezoneX","0.568 * safezoneH + safezoneY","0.0925 * safezoneW","0.032 * safezoneH"],[1,1,1,1],[0.15,0.15,0.15,1],[-1,-1,-1,-1],"","-1"],["idc = 2401;"]],
	[2401,"use_item_button",[1,"Use Item",["0.3075 * safezoneW + safezoneX","0.568 * safezoneH + safezoneY","0.0925 * safezoneW","0.032 * safezoneH"],[1,1,1,1],[0.15,0.15,0.15,1],[-1,-1,-1,-1],"","-1"],["idc = 2400;"]],
	[1008,"use_item_underline",[1,"",["0.3075 * safezoneW + safezoneX","0.6 * safezoneH + safezoneY","0.0925 * safezoneW","0.00149816 * safezoneH"],[-1,-1,-1,-1],[0.04,0.47,0.95,1],[-1,-1,-1,-1],"","-1"],["idc = 1006;"]],
	[1009,"delete_item_underline",[1,"",["0.4025 * safezoneW + safezoneX","0.6 * safezoneH + safezoneY","0.0925 * safezoneW","0.00149816 * safezoneH"],[-1,-1,-1,-1],[0.04,0.47,0.95,1],[-1,-1,-1,-1],"","-1"],["idc = 1007;"]]
]
*/
