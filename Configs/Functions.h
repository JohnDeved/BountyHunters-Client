class Misc_functions
{
	tag = "misc";
	class Misc
	{
		file = "Functions\Misc";
		class defineSync {};
		class defineAsync {};
		class autoInit {};
		class getTotalWeigth {};
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
		// !- auto init
		class carSale {};
		class gunSale {};
		class farming {};
		class processor {};
		class info {};
	};
};
class Dialog_functions
{
	tag = "dialog";
	class Dialog
	{
		file = "Functions\Dialog";
		class playerMenu {};
	};
};
class Draw_functions
{
	tag = "draw";
	class Draw
	{
		file = "Functions\Draw";
		// !- auto exec
		class hudCarSale {};
		class hudGunSale {};
		class hudFarming {};
		class hudProcessor {};
	};
};
class Heap_functions
{
	tag = "heap";
	class Heap
	{
		file = "Functions\Heap";
		// !- auto exec
		class updateInfo {};
		class updateNearVehicles {};
		class updateNearWeapons {};
		class updateNearStuff {};
		class updateNearProcessors {};
	};
};
