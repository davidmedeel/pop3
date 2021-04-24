
/*
por: Icaruk

	["menu"] call ica_fnc_diagnostico;
	["menu", player] call ica_fnc_diagnostico; // autodiag
	["diag", player] call ica_fnc_diagnostico;
*/

_param = _this select 0;

if (((animationstate Player) == "ainjPpneMstpSnonWnonDnon") or ((animationstate Player) == "amovppnemstpsnonwnondnon_injured")) exitWith {};

if (_param isEqualTo "menu") exitWith {


	if (vehicle player != player) then {
			quien = nil;
			_pasajeros = crew vehicle player;
			_tVeh = typeOf vehicle player;
			_cidx = switch (_tVeh) do {
					case "": {[1, 2]};
					case "": {[1, 2]};
					case "": {[0, 1]};
					default {[5, 5]};
			};

			if (vehicle player getCargoIndex player != (_cidx select 0)) exitWith {
					hintSilent "No te puedes curar en un vehículo";
					closedialog 0;
			};

			{
					if (vehicle player getCargoIndex _x == (_cidx select 1)) exitWith {
							quien = _x;
					};
			} forEach _pasajeros;

	} else {

			quien = if (!isNil {_this select 1}) then {
					_this select 1;
			} else {
					_cerca = (nearestObjects [player, ["Man"], 2]);
					if ((count _cerca) > 1) then {
							_cerca select 1;
					} else {
							player;
					};
			};
		};

	if (isNil {quien}) exitWith {};
	if ((player distance quien) > 2) exitWith {hint "Estás demasiado lejos"};

	disableSerialization;
	createDialog "medico";
	_ui = uiNamespace getVariable "medico";
	_txt = _ui displayCtrl 7017;
	_lista = _ui displayCtrl 7018;
	_botonDiag = _ui displayCtrl 7019;
	_selCab = _ui displayCtrl 7029;
	_selPec = _ui displayCtrl 7030;
	_selBra1 = _ui displayCtrl 7031;
	_selBra2 = _ui displayCtrl 7032;
	_selPie = _ui displayCtrl 7033;


	_arrLista = ["Vendas", "Vendas compresivas", "Tramadol", "Morfina", "Epinefrina", "Desfibrilador", "Bolsa de sangre", "Kit forense"];
	_data = ["pop_vendas", "pop_vendas_c", "pop_tramadol", "pop_morfina", "pop_epinefrina", "pop_desfibrilador", "pop_bolsadesangre", "pop_csi"];
	_ico = ["\POP_medic\vendaje\tex\vendasico.paa", "\POP_medic\vendaje\tex\vendascico.paa", "\POP_medic\tramadol\data\tramadolico.paa", "\POP_medic\morfina\data\morfinaico.paa",
		"\POP_medic\epinefrina\data\epenefrinaico.paa", "\POP_medic\defibrilador\data\desfibriladoico.paa", "\POP_medic\bolsadesangre\data\bolsadesangreico.paa", "\POP_objects\csikit\Data\csikitico.paa"];

	_idx = 0;
	while {_idx < (count _arrLista)} do {
		_lista lbAdd (_arrLista select _idx);
		_lista lbSetData [_idx, _data select _idx];
		_lista lbSetPicture [_idx, _ico select _idx];
		_idx = _idx + 1;
	};

	_selCab buttonSetAction ' zonaSelec = "cabeza"; ';
	_selPec buttonSetAction ' zonaSelec = "pecho"; ';
	_selBra1 buttonSetAction ' zonaSelec = "brazos"; ';
	_selBra2 buttonSetAction ' zonaSelec = "brazos"; ';
	_selPie buttonSetAction ' zonaSelec = "piernas"; ';

	_txt ctrlSetStructuredText parseText format [" <t size='1.13' align='center'>%1</t> ", "?????"];

	_botonDiag buttonSetAction '
		["diag", quien] call ica_fnc_diagnostico;
	';

	_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo', quien] call ica_fnc_diagnostico"];
	{_x ctrlSetEventHandler ["ButtonClick", "['actualizo', quien] call ica_fnc_diagnostico"]} forEach [_selCab, _selPec, _selBra1, _selBra2, _selPie];

};

if (_param isEqualTo "actualizo") exitWith {
	disableSerialization;
	_ui = uiNamespace getVariable "medico";
	_lista = _ui displayCtrl 7018;
	_botonTratar = _ui displayCtrl 7020;

	quien = _this select 1;
	cosa = _lista lbData (lbCursel 7018);

	if (isNil {zonaSelec}) exitWith {};
	_botonTratar buttonSetAction '
		closeDialog 0;
		[quien, zonaSelec, cosa] spawn ica_fnc_tratamiento;
	';
};

if (!isNil {ocupado}) exitWith {};
ocupado = true;

if (_param isEqualTo "diag") then {
	_quien = _this select 1;
	if (isNil {_quien}) exitWith {closeDialog 0; ocupado = nil};
	[_quien] spawn {
		_quien = _this select 0;

		if (("med" call ica_fnc_expToLevel) >= 7) then {
			[2, "Diagnosticando..."] spawn ica_fnc_barrita;
		} else {
			[8, "Diagnosticando..."] spawn ica_fnc_barrita;
			if (vehicle player == player) then {
				player playmove "AinvPknlMstpSnonWrflDr_medic4";
				sleep 8;
				player switchMove "";
			} else { sleep 8};
		};

		if (!dialog) exitWith {ocupado = nil};
		disableSerialization;
		_ui = uiNamespace getVariable "medico";

		_txt = _ui displayCtrl 7017;
		_cabeza = _ui displayCtrl 7021;
		_pecho = _ui displayCtrl 7022;
		_brazos = _ui displayCtrl 7023;
		_piernas = _ui displayCtrl 7024;
		_sangCab = _ui displayCtrl 7025;
		_sangPec = _ui displayCtrl 7026;
		_sangBra = _ui displayCtrl 7027;
		_sangPie = _ui displayCtrl 7028;
		_sangre = _ui displayCtrl 7034;

		_txt ctrlSetStructuredText parseText format [" <t size='1.13' align='center'>Paciente</t> ", name quien];

		_sangre ctrlSetText format ["Sangre: %1%2", (1 - (damage _quien)) * 100, "%"];
		_sangre ctrlSetTextColor [damage _quien,1 - (damage _quien),0,1];

		_ruta = "\pop_iconos\icons\medica\";

		_imgCab = switch (true) do {
			case ((_quien getVariable "cabeza") >= 80): {"cab5.paa"};
			case ((_quien getVariable "cabeza") >= 60): {"cab4.paa"};
			case ((_quien getVariable "cabeza") >= 40): {"cab3.paa"};
			case ((_quien getVariable "cabeza") >= 20): {"cab2.paa"};
			case ((_quien getVariable "cabeza") >= 0): {"cab1.paa"};
		};
		_imgPec = switch (true) do {
			case ((_quien getVariable "pecho") >= 80): {"pec5.paa"};
			case ((_quien getVariable "pecho") >= 60): {"pec4.paa"};
			case ((_quien getVariable "pecho") >= 40): {"pec3.paa"};
			case ((_quien getVariable "pecho") >= 20): {"pec2.paa"};
			case ((_quien getVariable "pecho") >= 0): {"pec1.paa"};
		};
		_imgBra = switch (true) do {
			case ((_quien getVariable "brazos") >= 80): {"bra5.paa"};
			case ((_quien getVariable "brazos") >= 60): {"bra4.paa"};
			case ((_quien getVariable "brazos") >= 40): {"bra3.paa"};
			case ((_quien getVariable "brazos") >= 20): {"bra2.paa"};
			case ((_quien getVariable "brazos") >= 0): {"bra1.paa"};
		};
		_imgPie = switch (true) do {
			case ((_quien getVariable "piernas") >= 80): {"pie5.paa"};
			case ((_quien getVariable "piernas") >= 60): {"pie4.paa"};
			case ((_quien getVariable "piernas") >= 40): {"pie3.paa"};
			case ((_quien getVariable "piernas") >= 20): {"pie2.paa"};
			case ((_quien getVariable "piernas") >= 0): {"pie1.paa"};
		};
		_sanCab = switch ((_quien getVariable "sangrando") select 0) do {
			case 2: {"cabsan2.paa"};
			case 1: {"cabsan1.paa"};
			case 0: {""};
		};
		_sanPec = switch ((_quien getVariable "sangrando") select 1) do {
			case 2: {"pecSan2.paa"};
			case 1: {"pecSan1.paa"};
			case 0: {""};
		};
		_sanBra = switch ((_quien getVariable "sangrando") select 2) do {
			case 2: {"braSan2.paa"};
			case 1: {"braSan1.paa"};
			case 0: {""};
		};
		_sanPie = switch ((_quien getVariable "sangrando") select 3) do {
			case 2: {"pieSan2.paa"};
			case 1: {"pieSan1.paa"};
			case 0: {""};
		};


		_arr1 = [_cabeza, _pecho, _brazos, _piernas, _sangCab, _sangPec, _sangBra, _sangPie];
		_arr2 = [_imgCab, _imgPec, _imgBra, _imgPie, _sanCab, _sanPec, _sanBra, _sanPie];

		for "_x" from 0 to (count _arr1) do {
			if ((_arr2 select _x) != "") then {
				(_arr1 select _x) ctrlSetText (_ruta + (_arr2 select _x));
			};
		};
	};
	ocupado = nil;
};