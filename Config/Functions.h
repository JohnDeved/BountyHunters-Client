class Misc_functions
{
	tag = "misc";
	class Misc
	{
		file = "Functions\Misc";
		class defineSync {};
		class defineAsync {};
	};
};
class EventHandler_functions
{
	tag = "event";
	class Event
	{
		file = "Functions\EventHandler";
		class onKeyDown {};
		class onHeapStack {};
		class onDraw {};
	};
};
class Hud_functions
{
	tag = "hud";
	class Hud
	{
		file = "Functions\Hud";
		// !- selfinit
		class carSale {};
		class gunSale {};
		class farming {};
		class info {};
	};
};
class Draw_functions
{
	tag = "draw";
	class Draw
	{
		file = "Functions\Draw";
		class hudCarSale {};
		class hudGunSale {};
		class hudFarming {};
	};
};
class Heap_functions
{
	tag = "heap";
	class Heap
	{
		file = "Functions\Heap";
		class updateInfo {};
		class updateNearVehicles {};
		class updateNearWeapons {};
		class updateNearStuff {};
	};
};
