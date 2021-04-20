
// ***********************************************************
// by Blakord
// House action script
// ***********************************************************

private["_curTarget","_unit","_CtrlDLG","_ButText","_ButTopTip","_ButAction","_ButEnable","_ButIcon","_MakeButon","_Condition"];

_curTarget = param[0];
if (dialog) exitWith {};
//life_action_inUse = true;
if(isNil {_curTarget}) exitWith {};
if(isNull _curTarget) exitWith {};

_MakeButon = [];

BK_DialogOpen = true;
_CtrlDLG = 30101;
_ok = createDialog "FullActionsAll";
life_pInact_curTarget = _curTarget;

if(((typeOF _curTarget) in listaCasas) && playerSide == west) Then {
		if(!isNil {_curTarget getVariable "house_owner"}) then {
			_ButText = "Ver Propietario";
			_ButTopTip = "Verifivar registros de propiedad de la casa";
			_ButAction = " [life_pInact_curTarget] call life_fnc_copHouseOwner ";
			_ButIcon = "MenuIcoCas_CasaLicencia";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Forzar puerta";
			_ButTopTip = "Verifivar registros de propiedad de la casa";
			_ButAction = " [life_pInact_curTarget] spawn life_fnc_copBreakDoor ";
			_ButIcon = "MenuIcoCas_CasaForzarCop";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Registrar";
			_ButTopTip = "Realizar un registro de la casa";
			_ButAction = " [life_pInact_curTarget] spawn life_fnc_raidHouse ";
			_ButIcon = "MenuIcoCas_CasaBuscar";
			if(player distance _curTarget > 10) then {
				_ButEnable = false;
			} else {
				_ButEnable = true;
			};
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			
			_ButText = "Ganzuar";
			_ButTopTip = "Ganzuar esta casa ejem he perdido las llaves";
			_ButAction = " [life_vInact_curTarget] spawn life_fnc_lockpick ";
			_ButIcon = "MenuIcoCas_CasaForzar";
			if(["pop_ganzua"] call ica_fnc_tengo > 0) then { // Hay que poner la condicion tb de la puerta
				_ButEnable = true;
			} else {
				_ButEnable = false;
			};
			if(isNil {_curTarget getVariable "house_owner"}) then { _ButEnable = false; };
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
			
			_ButText = "Cerrar casa";
			_ButTopTip = "Cerrar esta casa para que nadie pueda entrar";
			_ButAction = " [life_pInact_curTarget] spawn life_fnc_lockupHouse ";
			_ButIcon = "MenuIcoCas_CasaCerrar";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

		} else {
			BK_DialogOpen = false;
			if (true) exitWith {};
		};

} else {
	_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
	if(_houseCfg isEqualTo []) exitWith {BK_DialogOpen = false};

	if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {

		if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget];};

		_ButText = "Comprar casa";
		_ButTopTip = "Comprar esta casa lista para entrar";
		_ButAction = " [life_pInact_curTarget] spawn life_fnc_buyHouse ";
		_ButIcon = "MenuIcoCas_CasaComprar";
		_ButEnable = true;
		if(!isNil {_curTarget getVariable "house_owner"}) then { _ButEnable = false };
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
		
		_ButText = "Ganzuar";
		_ButTopTip = "Ganzuar esta casa ejem he perdido las llaves";
		_ButAction = " [life_vInact_curTarget] spawn life_fnc_lockpick ";
		_ButIcon = "MenuIcoCas_CasaForzar";
		if(["pop_ganzua"] call ica_fnc_tengo > 0) then { // Hay que poner la condicion tb de la puerta
			_ButEnable = true;
		} else {
			_ButEnable = false;
		};
		if(isNil {_curTarget getVariable "house_owner"}) then { _ButEnable = false; };
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	} else {

		if((typeOf _curTarget) in listaGarajes) then {

			_ButText = "Garaje";
			_ButTopTip = "Acceder a mis coches en el garaje";
			_ButAction = " [life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage ";
			_ButIcon = "MenuIcoCas_Garaje";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
			
			_ButText = "Guardar vehiculo";
			_ButTopTip = "Guardar mi vehiculo en el garaje";
			_ButAction = " [life_pInact_curTarget,player] spawn life_fnc_storeVehicle ";
			_ButIcon = "MenuIcoCas_GuardarCoche";
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Vender Garaje";
			_ButTopTip = "Vender este garaje que ya no necesito";
			_ButAction = "  [life_pInact_curTarget] spawn life_fnc_sellHouse ";
			_ButIcon = "MenuIcoCas_GarajeVender";
			_ButEnable = true;
			if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then { _ButEnable = false; };
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
		
		} else {

			_ButText = "Cerrar armarios";
			_ButTopTip = "Cerrar armarios para que nadie me robe mis cosas";
			_ButAction = " [life_pInact_curTarget] call life_fnc_lockHouse ";
			_ButIcon = "MenuIcoCas_CajasCerrar";
			if(_curTarget getVariable ["locked",true]) then {
				_ButText = "Abrir armarios";
				_ButTopTip = "Abrir armarios para que todos mis amigos se sirvan lo que quieran";
				_ButIcon = "MenuIcoCas_CajasAbrir";
			};
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
			
			_ButText = "Encender Luces";
			_ButTopTip = "Encender luces de la casa para ver mejor";
			_ButAction = " [life_pInact_curTarget] call life_fnc_lightHouseAction ";
			_ButIcon = "MenuIcoCas_LuzEncemder";
			if(!(isNull (_curTarget getVariable ["lightSource",ObjNull]))) then {
				_ButText = "Apagar luces";
				_ButTopTip = "Apagar las luces de mi casa para fastidiar a Iberdrola";
				_ButIcon = "MenuIcoCas_LuzApagar";
			};
			_ButEnable = true;
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

			_ButText = "Vender casa";
			_ButTopTip = "Vender esta bonita casa";
			_ButAction = " [life_pInact_curTarget] spawn life_fnc_sellHouse ";
			_ButIcon = "MenuIcoCas_CasaVender";
			_ButEnable = true;
			if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then { _ButEnable = false; };
			_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
			
		};
	};
};

[_CtrlDLG, _MakeButon] call bk_fnc_ActionMenuCreate;