class hud_processor {
    idd = -1;
    duration = 1e+011;
    name = "hud_processor";
    onLoad = "uiNamespace setVariable ['hud_processor',_this select 0]";
    objects[] = {};

    class controls
    {
        class t1: RscStructuredText {idc = -1;};
        class t2: RscStructuredText {idc = -1;};
        class t3: RscStructuredText {idc = -1;};
        class t4: RscStructuredText {idc = -1;};
        class t5: RscStructuredText {idc = -1;};
    };
};
