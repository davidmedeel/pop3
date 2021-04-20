
/*
por: Icaruk
	["menu"] spawn ica_fnc_menuY;
	["menu"] execVM "ica\dialog\fn_menuY.sqf";
*/

_param = _this select 0;
disableSerialization;

if (_param isEqualTo "menu") exitWith {
	if (!isNil {camaraInicial}) exitWith {};
	createDialog "menuY";

	_ui = uiNameSpace getVariable "menuY";
	_i1 = _ui displayCtrl 7040;
	_i2 = _ui displayCtrl 7041;
	_i3 = _ui displayCtrl 7042;
	_i4 = _ui displayCtrl 7043;
	_i5 = _ui displayCtrl 7044;
	_i6 = _ui displayCtrl 7045;
	_b1 = _ui displayCtrl 7046;	 // dinero
	_b2 = _ui displayCtrl 7047;	 // llaves
	_b3 = _ui displayCtrl 7048;	 // crafteo
	_b4 = _ui displayCtrl 7049;	 // bailes
	_b5 = _ui displayCtrl 7050;	 // sync
	_b6 = _ui displayCtrl 7051; // buscados

	putaFnc = {
		if (side player == WEST) then {
			[] call life_fnc_wantedMenu;
		} else {
			if (isNil "life_action_gangInUse") then {
				if (isNil {(group player) getVariable "gang_owner"}) then {
					createDialog "Life_Create_Gang_Diag";
				} else {
					[] spawn life_fnc_gangMenu;
				};
			};
		}
	};

	_b1 buttonSetAction ' closeDialog 0; ["menu"] call ica_fnc_daDinero';
	_b2 buttonSetAction ' closeDialog 0; ["menu"] call ica_fnc_daLlaves ';
	_b3 buttonSetAction ' closeDialog 0; ["menu"] call ica_fnc_menucrafteo';
	_b4 buttonSetAction ' closeDialog 0; if (vehicle player != player) then {hint "No tienes suficiente espacio para bailar con flow."} else {createDialog "animaBaile_dialog"}';
	_b5 buttonSetAction ' closeDialog 0; [] spawn ica_fnc_sync; hint "Has sincronizado"';
	_b6 buttonSetAction ' closeDialog 0; call putaFnc';

	private ["_icono", "_ctrls"];
	switch (true) do {
		case ((animationState player) == "ainjPpneMstpSnonWnonDnon"): {
			llamadaDeSocorro = {
				closeDialog 0;
				if (!isNil {llamadaSocorroHecha}) exitWith {hint "Sólo puedes hacer una llamada de socorro cada minuto"};
				0 spawn {llamadaSocorroHecha = true; sleep 60; llamadaSocorroHecha = nil};
				["recibo", player, format ["Mensaje automático: estoy herido en %1", mapGridPosition player]] remoteexeccall ["ica_fnc_mensajeica",independent];
				titleText ["Los médicos han recibido tu llamada de socorro", "PLAIN"];
			};
			_icono = ["icoAyuda.paa"];
			_ctrls = [_i1];
			{_x ctrlEnable false} forEach [_b2, _b3, _b4, _b5, _b6];
			_b1 buttonSetAction '
				call llamadaDeSocorro;
			';
		};
		case ((animationState player) == "amovppnemstpsnonwnondnon_injured"): {
			llamadaDeSocorro = {
				closeDialog 0;
				if (!isNil {llamadaSocorroHecha}) exitWith {hint "Sólo puedes hacer una llamada de socorro cada minuto"};
				0 spawn {llamadaSocorroHecha = true; sleep 60; llamadaSocorroHecha = nil};
				["recibo", player, format ["Mensaje automático: estoy herido en %1", mapGridPosition player]] remoteexeccall ["ica_fnc_mensajesica",independent];
				titleText ["Los médicos han recibido tu llamada de socorro", "PLAIN"];
			};
			_icono = ["icoAyuda.paa"];
			_ctrls = [_i1];
			{_x ctrlEnable false} forEach [_b2, _b3, _b4, _b5, _b6];
			_b1 buttonSetAction '
				call llamadaDeSocorro;
			';
		};
		case ((side player == CIVILIAN) OR (side player == INDEPENDENT)): {
			_icono = ["icoDinero.paa", "icoLlaves.paa", "icoCraft.paa", "icoBailes.paa", "icoSync.paa", "icoGrupo.paa"];
			_ctrls = [_i1, _i2, _i3, _i4, _i5, _i6];
		};
		case (side player == WEST): {
			_icono = ["icoDinero.paa", "icoLlaves.paa", "icoCraft.paa", "icoBailes.paa", "icoSync.paa", "icoBuscados.paa"];
			_ctrls = [_i1, _i2, _i3, _i4, _i5, _i6];
		};
	};
	_ruta = "icons\menuY\";

	{
		_x ctrlSetPosition [((ctrlPosition _x) select 0) + 0.1, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
		_x ctrlCommit 0;
	} forEach _ctrls;

	_idx = 0;
	while {_idx < (count _ctrls)} do {
		(_ctrls select _idx) ctrlSetText (_ruta + (_icono select _idx));
		_idx = _idx + 1;
	};

	{
		_x ctrlSetPosition [((ctrlPosition _x) select 0) - 0.12, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
		_x ctrlCommit 0.5;
		sleep 0.05;
	} forEach _ctrls;

	{
		waitUntil {((ctrlPosition _x) select 0) <= 1.5925};
		_x ctrlSetPosition [((ctrlPosition _x) select 0) + 0.02, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
		_x ctrlCommit 0.2;
	} forEach _ctrls;

};
