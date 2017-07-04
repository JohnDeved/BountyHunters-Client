class RscPlayerMenu {
    idd = -1;
    movingEnable = true;
	enableSimulation = true;
    onLoad = "systemchat'heyho'";

    class controlsBackground
    {
        class Background: BountyHunters_Background
        {
            x = safezoneX + 0.1 * safezoneW;
            y = safezoneY + 0.1 * safezoneH;
            w = safezoneW * 0.8;
            h = safezoneH * 0.8;
        };
        class Frame: BountyHunters_Frame
        {
            x = safezoneX + 0.1 * safezoneW;
            y = safezoneY + 0.1 * safezoneH;
            w = safezoneW * 0.8;
            h = safezoneH * 0.8;
        };
    };
};
