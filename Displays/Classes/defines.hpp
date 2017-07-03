#define darkgrey {0.1,0.1,0.1,1}
#define lightgrey {0.3,0.3,0.3,1}
#define whitegrey {0.6,0.6,0.6,1}
#define grey {0.15,0.15,0.15,1}
#define white {1,1,1,1}

class BountyHunters_Background: RscBackground
{
	shadow = 1;
	text = "";
	ColorBackground[] = darkgrey;
	ColorText[] = {0.1,0.1,0.1,1};
	font = "PuristaMedium";
	SizeEx = 1;
};
class BountyHunters_Frame: RscFrame
{
	type = CT_STATIC;
	idc = -1;
	deletable = 0;
	style = ST_FRAME;
	shadow = 0;
	colorText[] = white;
};
