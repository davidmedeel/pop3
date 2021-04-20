/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
if !(isNil "dropeando") exitWith {};
dropeando = true;
private["_obj","_unit","_item","_value"];
param [0];
_unit = _this select 0;
_value = missionNamespace getVariable "medel_din";

_pos = _unit modelToWorld[0,3,0];
_pos = [_pos select 0, _pos select 1, 0];
_obj = "Land_Money_F" createVehicle _pos;
_obj setVariable["item",["money",_value],true];
_obj setPos _pos;
[_obj] remoteexeccall ["life_fnc_simDisable",-2];
missionNamespace setVariable["medel_din",0];
dropeando = nil;
/*
{
	_item = _x;
	_value = missionNamespace getVariable _item;

	switch(_item) do
	{

		case "medel_din":
		{
			if(medel_din > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
				[[_obj],"life_fnc_simDisable",nil,true] call lifefncMP;
				missionNamespace setVariable[_x,0];
			};
		};
	};
} foreach (["medel_din"]);
