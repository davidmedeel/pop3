
/*
Sistema de subasta
by: Icaruk

Función: Dependiendo del parámetro, se puja en una subasta u otra.
["menu", "campo"] spawn ica_fnc_subasta;
*/

_param = _this select 0;
_nPuja = 4000;


private "_subastaActual";

if (_param == "menu") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
	if !(playerSide isEqualTo civilian) exitWith {hint "No eres civil ¿Que intentas?";};
	_cosa = _this select 1; // almacen1, almacen2, comercios, transportes, mineria
	[player, [_cosa, "subastaActual"]] call ica_fnc_varToServer; waitUntil {recibido};

	private ["_str1", "_str2", "_str3"];
	_str1 = (missionNamespace getVariable _cosa) select 0;
	_str2 = (missionNamespace getVariable _cosa) select 1;
	_str3 = (missionNamespace getVariable _cosa) select 2;

	disableSerialization;
	createDialog "subasta";
	_ui = uiNameSpace getVariable "subasta";
	_tiempo = (_ui displayCtrl 4055);
	_cabecera = (_ui displayCtrl 4052);
	_pujatxt = (_ui displayCtrl 4053);
	_boton = (_ui displayCtrl 4054);

	cosa = _cosa;

	if (subastaActual  == _cosa) then { // si hay subasta muestro su tiempo, si no, no
		_tiempo ctrlSetText format ["Tiempo: %1 min", round(_str3 / 60)];
	} else {
		_tiempo ctrlSetText "";
	};

	_cabecera ctrlSetText format ["Subasta: %1", _cosa];
	_boton ctrlSetText format ["PUJAR +%1€", _nPuja];
	_boton buttonSetAction '	["pujo", cosa] spawn ica_fnc_subasta	';
	_pujatxt ctrlSetText format ["Puja: %1 (%2€)", _str1, _str2];
};

if (_param == "pujo") exitWith {
	if (vehicle player != player) exitWith {hint "¿Pretendes pujar desde un vehículo? No me seas vago."};

	_cosa = _this select 1;


	if (!isNil {spamSubasta}) exitWith {
		spamSubasta = spamSubasta + 5;
		closeDialog 0;
		hint format ["Tienes que esperar %1 segundos", spamSubasta];
		sleep 3;
		hint "";
	};
	[] spawn {
		if (isNil {spamSubasta}) then {
			spamSubasta = 5;

			while {true} do {
				if (spamSubasta <= 0) exitWith {spamSubasta = nil };
				spamSubasta = spamSubasta - 1;
				sleep 1;
			};
		};
	};

	_empiezaPuja = {
		if ((subastaActual  == "") AND ((((missionnamespace getVariable _cosa) select 0) == ""))) then { 	// si no hay ninguna subasta activa
			subastaActual = _cosa; 		// empiezo esta
			publicVariableServer "subastaActual";

			[_cosa] remoteExec ["ica_fnc_initSubasta",2];
		};
	};

	if ((subastaActual != _cosa) AND (subastaActual != "")) exitWith {hint "Actualmente ya hay una subasta activa, espera a que termine para empezar esta.";};

	// Empiezo a pujar
	[player, [_cosa, "subastaActual"]] call ica_fnc_varToServer; waitUntil {recibido};
	
	if (((missionnamespace getVariable _cosa) select 2) <= 0) exitWith {hint "Esta puja ha finalizado"};
	call _empiezaPuja;
	if (name player == ((missionnamespace getVariable _cosa) select 0)) exitWith {hint "No puedes superar tu propia puja"};
	if (medel_atmdin < (((missionnamespace getVariable _cosa) select 1) + _nPuja)) exitWith {hint "No tienes dinero para superar la puja máxima"};
	missionnamespace setVariable [_cosa, [name player, ((missionnamespace getVariable _cosa) select 1) + _nPuja, (missionnamespace getVariable _cosa) select 2]];
	publicVariableServer _cosa;

	closeDialog 0;
};

