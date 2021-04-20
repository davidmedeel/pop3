/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

[] spawn ica_fnc_dupeosuelo;
	switch(playerSide) do
	{
	case west: {}; //Blah
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in [
			"GEO_Pop",
			"CNP_Pop",
			"SAMUR_Pop",
			"CNP2_Pop",
			"GC_Pop",
			"GC2_Pop",
			"UEI_Pop",
			"GCT_Pop"
			]) then {
		[_item,false,false,false,false] call life_fnc_handleItem;
	};
};
case independent: {};
};