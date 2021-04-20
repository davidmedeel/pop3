/*
	Author: Borjamed Zacarias



  fn_removeWeapons.sqf
*/
private["_cop","_handgun"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
_cosa = _this select 1;
_cantidad = _this select 2;
if(_cop == player) then {};
if(isNull player) exitWith {};
if(isNull _cop OR !(player getVariable["restrained",FALSE])) exitWith {};
_i = 0;
{
    _fnscnt = _cantidad select _i;
    _cnt = 0;
    while {_cnt < _fnscnt} do {
      switch (true) do {
        case(_x in weapons player): {
          player removeWeapon _x;
        };
        default {
          player removeitem _x;
        };
      };
     _cnt = _cnt + 1;
    };
   _i = _i + 1;
} forEach _cosa;
hint format ["%4 te ha confiscado:\n%1\n%2\n%3",[_cosa select 0] call ica_fnc_classToName,[_cosa select 1] call ica_fnc_classToName,[_cosa select 2] call ica_fnc_classToName,name _cop];
life_action_inUse = false;
