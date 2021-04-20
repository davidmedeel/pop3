
// ***********************************************************
// by Blakord
// Vehicles action script
// ***********************************************************

private["_unit","_CtrlDLG","_ButText","_ButTopTip","_ButAction","_ButEnable","_ButIcon","_MakeButon","_Condition"];

_unit = param[0];
_Condition = param[1];
//life_action_inUse = true;
if (dialog) exitWith {};
if(isNull _unit) exitWith {};

_MakeButon = [];
life_vInact_curTarget = _unit;
BK_DialogOpen = true;
_CtrlDLG = 30101;
_ok = createDialog "FullActionsAll";

	_ButText = "Reparar vehiculo";
	_ButTopTip = "Reparar el vehiculo para poder continuar el viaje";
	_ButAction = " [life_vInact_curTarget] spawn ica_fnc_hab_Reparar ";
	_ButIcon = "MenuIcoVeh_Reparar";
	if ("ToolKit" in (items player) && (damage _unit < 1)) then {
		_ButEnable = true;
	} else {
		_ButEnable = false;
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Empujar vehiculo";
	_ButTopTip = "Empujar vehiculos demostrando lo cachas que estas";
	_ButAction = " [] spawn life_fnc_pushObject ";
	_ButIcon = "MenuIcoVeh_Empujar";
	_ButEnable = true;
	if(typeOf (_unit) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
		_ButText = "Conducir Kart";
		_ButAction = " player moveInDriver life_vInact_curTarget ";
		if(count crew _unit > 0 or {!(canMove _unit)} or {locked _unit != 0}) then {
			_ButEnable = true;
		};
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Sacar del vehiculo";
	_ButTopTip = "Sacar pasajeros del vehiculo";
	_ButAction = " [life_vInact_curTarget] spawn life_fnc_pulloutAction ";
	_ButIcon = "MenuIcoVeh_Sacar";
	if(count crew _unit > 0) then	{
		_ButEnable = true;
	} else {
		_ButEnable = false;
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	If ( _Condition != "med" ) Then {
		_ButText = "Ganzuar";
		_ButTopTip = "Ganzuar este coche para ir de fiesta";
		_ButAction = " [life_vInact_curTarget] spawn life_fnc_lockpick ";
		_ButIcon = "MenuIcoVeh_Ganzuar";
		if(["pop_ganzua"] call ica_fnc_tengo > 0) then	{
			_ButEnable = true;
		} else {
			_ButEnable = false;
		};
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	};

	_ButText = "Voltear";
	_ButTopTip = "Dar la vuelta a vehiculos volcados";
	_ButAction = "if (life_vInact_curTarget distance player > 4) exitWith {hint ""acercate más ...""};   life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5] ";
	_ButIcon = "MenuIcoVeh_Voltear";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	If ( _Condition != "civ" ) Then {
		_ButText = "Confiscar";
		_ButTopTip = "Confiscar el vehiculo";
		_ButAction = " [life_vInact_curTarget] spawn life_fnc_impoundAction ";
		_ButIcon = "MenuIcoVeh_Confiscar";
		_ButEnable = false;
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;		
		
		_ButText = "Ver licencias";
		_ButTopTip = "Ver licencias del vehiculo";
		_ButAction = " [life_vInact_curTarget] spawn life_fnc_searchVehAction ";
		_ButIcon = "MenuIcoVeh_Licencias";
		_ButEnable = true;
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	};

	if(typeOf _unit == "O_Truck_03_device_F") then	{
		_ButText = "Dispositivo de Mina";
		_ButTopTip = "??????????";
		_ButAction = " [life_vInact_curTarget] spawn life_fnc_deviceMine ";
		_ButIcon = "X";
		if(!isNil {(_unit getVariable "mining")} OR !local _unit && {_unit in life_vehicles}) then {
			_ButEnable = false;
		} else {
			_ButEnable = true;
		};
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	};
	if (typeof _unit in ["C_Van_01_fuel_F","Volvo_Cisterna_1","B_Truck_01_fuel_F"]) then {
		_ButText = "Vaciar tanque";
		_ButTopTip = "Vaciar el tanque";
		_ButAction = ' ["vaciar"] spawn ica_fnc_tanque; ';
		_ButIcon = "MenuIcoVeh_Voltear";
		_ButEnable = true;
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	};
[_CtrlDLG, _MakeButon] call bk_fnc_ActionMenuCreate;