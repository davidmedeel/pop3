/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
if (!dialog) then {
	createDialog "vInteraction_Menu";
};

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if ((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
life_vInact_curTarget = _curTarget;

//Button 1 - Set vehicle repair action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn ica_fnc_hab_Reparar;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then
{
    _Btn1 ctrlEnable true;
} else {
    _Btn1 ctrlEnable false;
};

//Button 2 - Set search vehicle owner action
_Btn2 ctrlSetText localize "STR_vInAct_Registration";
_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

//Button 3 - Set search vehicle trunk action
_Btn3 ctrlSetText localize "STR_vInAct_Lockpick";
_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_lockpick; closeDialog 0;";

if(["pop_ganzua"] call ica_fnc_tengo > 0) then
{
    _Btn3 ctrlEnable true;
} else {
    _Btn3 ctrlEnable false;
};

//Button 4 - Set pullout action
_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";

if(count crew _curTarget == 0) then {
    _Btn4 ctrlEnable false;
} else {
    _Btn4 ctrlEnable true;
};

//Button 5 - Set impound vehicle action
_Btn5 ctrlSetText localize "STR_vInAct_Impound";
_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";

//Button 6 - Set pushboat action if curTarget is a boat else if curTarget is a kart displays some kart actions
if (_curTarget isKindOf "Ship") then {
	_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
	_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
    if (_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then {
        _Btn6 ctrlEnable true;
    } else {
        _Btn6 ctrlEnable false
    };
} else {
	if (typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
		_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
		_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
        if (count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {
		    _Btn6 ctrlEnable true;
		} else {
		    _Btn6 ctrlEnable false
		};
	} else {
		/*	
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then
			{
				_Btn6 ctrlEnable false;
			} else {
				_Btn6 ctrlEnable true;
			};
		*/
		_Btn6 ctrlSetText "Empujar coche";
		_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if((count crew _curTarget) == 0) then {
			_Btn6 ctrlEnable true;
		} else {
			_Btn6 ctrlEnable false
		};
    };
};