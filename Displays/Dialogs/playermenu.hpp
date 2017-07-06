class RscPlayerMenu {
    idd = -1;
    movingEnable = true;
	enableSimulation = true;
    onLoad = "_this call dialog_fnc_playerMenu";

    class controls
    {
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
        class invenotry_list: RscTree
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
    };
};
