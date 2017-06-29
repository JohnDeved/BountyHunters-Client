class hud_info {
    idd = -1;
    duration = 1e+011;
    name = "hud_info";
    onLoad = "uiNamespace setVariable ['hud_info',_this select 0]";
    objects[] = {};

    class controls
    {
        class i1: RscStructuredText
        {
        	idc = -1;
        	text = "";
        	x = 0.267906 * safezoneW + safezoneX;
        	y = 0.0161785 * safezoneH + safezoneY;
        	w = 0.464187 * safezoneW;
        	h = 0.75872 * safezoneH;
        };
    };
};
