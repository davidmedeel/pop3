
// ***********************************************************
// by Blakord
// Ini script for arrest action  dialog
// ***********************************************************

private["_unit","_CtrlDLG","_ButText","_ButTopTip","_ButAction","_ButEnable","_ButIcon","_MakeButon","_Condition"];
if (dialog) exitWith {};
_unit = param[0];
_Condition = param[1];
//life_action_inUse = true;
if( !isPlayer _unit ) exitWith { };	
if(isNull _unit) exitWith {};
life_pInact_curTarget = _unit;
_MakeButon = [];

		BK_DialogOpen = true;
		_CtrlDLG = 30101;
		_ok = createDialog "FullActionsAll";
		If ( playerSide == west ) Then {
			_ButText = "Mover detenido";
			_ButTopTip = "Mover al detenido a otra parte";
			_ButAction = "Call BK_fnc_MoverArrestado";
			_ButIcon = "MenuIco_CopMover";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Quitar esposas";
			_ButTopTip = "Quitar esposas y liberar al detenido";
			_ButAction = "[life_pInact_curTarget] call life_fnc_unrestrain";
			_ButIcon = "MenuIco_Liberar";
			if((["pop_llaves"] call ica_fnc_tengo) > 0) then {_ButEnable = true} else {_ButEnable = false};
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Subir en vehiculo";
			_ButTopTip = "Subir al detenido en un vehiculo cercano";
			_ButAction = "Call BK_fnc_SubirAlCoche";
			_ButIcon = "MenuIco_CopSubirEnVeh";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Cachear detenido";
			_ButTopTip = "Cachear al detenido a ver que lleva";
			_ButAction = "";
			_ButIcon = "MenuIco_CopCachear";
			_ButEnable = false;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Quitar armas";
			_ButTopTip = "Quitar armas que lleve el detenido";
			_ButAction = "";
			_ButIcon = "MenuIco_CopConfiscarArmas";
			_ButEnable = false;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Quitar dinero";
			_ButTopTip = "Quitar el dinero que lleve el detenido";
			_ButAction = "";
			_ButIcon = "MenuIco_CopConfiscarDinero";
			_ButEnable = false;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Multar";
			_ButTopTip = "Poner unsa multa al detenido";
			_ButAction = "";
			_ButIcon = "MenuIco_CopMultar";
			_ButEnable = false;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Licencias";
			_ButTopTip = "Comprobar licencias del detenido";
			_ButAction = "";
			_ButIcon = "MenuIco_CopLicencias";
			_ButEnable = false;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Enviar a la carcel";
			_ButTopTip = "Enviar detenido a la carcel para pagar por sus delitos";
			_ButAction = "";
			_ButIcon = "MenuIco_CopEnviarCarcel";
			_ButEnable = false;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;



