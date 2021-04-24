
/*
por: Icaruk
	["menu", 1] spawn ica_fnc_menuAlmacen
	["menu", 2] spawn ica_fnc_menuAlmacen
*/

_param = _this select 0;
almacen = _this select 1;
_maxAlmacen = 1000;

if (_param isEqualTo "menu") exitWith {
	_tio = [tioA1, tioA2] call ica_fnc_masCercano;
	if ((player distance _tio) > 2) exitWith {hint "Los negocios tienen que ser de cerca."};
	if ((count (nearestObjects [(getPos _tio), ["Man"], 2])) > 1) exitWith {
		hint "Los negocios tienen que ser de tú a tú, la demás peña, sobra.";
	};

	[player, ["alm1Ali", "alm1Agu", "alm1Com", "alm1Mad", "alm2Ali", "alm2Agu", "alm2Com", "alm2Mad"]] call ica_fnc_varToServer; waitUntil {recibido};
	disableSerialization;
	createDialog "traficante_dialog";

	_ui = uiNameSpace getVariable "traficante_dialog";
	_boton = _ui displayCtrl 6015;
	_entrada = _ui displayCtrl 6016;
	_lista = _ui displayCtrl 6017;
	_bar1 = _ui displayCtrl 6018;
	_bar2 = _ui displayCtrl 6019;
	_bar3 = _ui displayCtrl 6020;
	_bar4 = _ui displayCtrl 6021;
	_txt1 = _ui displayCtrl 6022;
	_txt2 = _ui displayCtrl 6023;
	_txt3 = _ui displayCtrl 6024;
	_txt4 = _ui displayCtrl 6025;
	_pre1 = _ui displayCtrl 6026;
	_pre2 = _ui displayCtrl 6027;
	_pre3 = _ui displayCtrl 6028;
	_pre4 = _ui displayCtrl 6029;

	_idxLista = lbCurSel 6017;
	_cosa = _lista lbData _idxLista;

	if (almacen == 1) then {
		var1 = alm1Ali;
		var2 = alm1Agu;
		var3 = alm1Com;
		var4 = alm1Mad;
	} else {
		var1 = alm2Ali;
		var2 = alm2Agu;
		var3 = alm2Com;
		var4 = alm2Mad;
	};
	

	_boton ctrlSetText "Vender";

	_pre1 ctrlSetText format ["%1 €", round(275*(-0.0000005*var1*var1-0.00025*var1+1))];
	_pre2 ctrlSetText format ["%1 €", round(225*(-0.0000005*var2*var2-0.00025*var2+1))];
	_pre3 ctrlSetText format ["%1 €", round(450*(-0.0000005*var3*var3-0.00025*var3+1))];
	_pre4 ctrlSetText format ["%1 €", round(350*(-0.0000005*var4*var4-0.00025*var4+1))];
	_bar1 progressSetPosition (var1 / _maxAlmacen);
	_bar2 progressSetPosition (var2 / _maxAlmacen);
	_bar3 progressSetPosition (var3 / _maxAlmacen);
	_bar4 progressSetPosition (var4 / _maxAlmacen);


	_txt1 ctrlSetStructuredText parseText format ["<t align='left'>  Alimento</t>"];
	_txt2 ctrlSetStructuredText parseText format ["<t align='left'>  Agua</t>"];

	_pos = ctrlPosition _txt3;
	_txt3 ctrlSetPosition [(_pos select 0) - 0.02, _pos select 1, (_pos select 2) + 0.1, _pos select 3];
	_txt3 ctrlCommit 0;
	_txt3 ctrlSetStructuredText parseText format ["<t align='left' size='0.95'>  Combustible</t>"];

	_txt4 ctrlSetStructuredText parseText format ["<t align='left'>    Madera</t>"];


	_suministros = ["Alimento", "Agua", "Combustible", "Madera"];
	_data = ["Ali", "Agu", "Com", "Mad"];
	_value = [ctrlText _pre1, ctrlText _pre2, ctrlText _pre3, ctrlText _pre4];

	_idx = 0;
	while {_idx < (count _suministros)} do {
		_lista lbAdd (_suministros select _idx);
		_lista lbSetData [_idx, _data select _idx];
		_lista lbSetValue [_idx, parseNumber (_value select _idx)];
		_idx = _idx + 1;
	};

	_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo', almacen] spawn ica_fnc_menuAlmacen; "];
	_entrada ctrlSetEventHandler ["Char", "['actualizo', almacen] spawn ica_fnc_menuAlmacen; "];
};

if (_param isEqualTo "actualizo") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "traficante_dialog";
	_boton = _ui displayCtrl 6015;
	_entrada = _ui displayCtrl 6016;
	_lista = _ui displayCtrl 6017;

	_idxLista = lbCurSel 6017;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;
	entrada = parseNumber (ctrlText _entrada);
	almacen = _this select 1;

	_boton buttonSetAction '
		closeDialog 0;
		["vendo", cosa, precio, entrada, almacen] spawn ica_fnc_menuAlmacen;
	';
};

//////////////
if (_param isEqualTo "vendo") then {
	if (isNil {autoclick}) then {
		autoclick = 0;
		[] spawn {sleep 1; autoclick = nil};
	};
	autoclick = autoclick + 1;
};
if !(isNil {autoclick}) then {
	_fuera = false;
	if (autoclick > 13) exitWith {
		player setDamage 1;
		_fuera = true;
	};
	if (_fuera) exitWith {};
};
////////////////

if (_param isEqualTo "vendo") exitWith {
	private ["_cosa", "_precio", "_almacen", "_pre", "_can", "_cosa"];

	_cosa = _this select 1;
	_precio = _this select 2;
	_can = round (_this select 3);
	_almacen = _this select 4;
	if (_can <= 0) exitWith {hint "Eso no es ninguna cantidad"};

	_pre = round (_precio * _can);
	if (isNil {_cosa}) exitWith {hint "No has seleccionado nada"};

	private "_class";
	_class = switch (_cosa) do {
		case "Ali": {"pop_cajaalimentos"};
		case "Agu": {"pop_agualimpia"};
		case "Com": {"pop_barril"};
		case "Mad": {"pop_madera"};
	};

	if !(([_class] call ica_fnc_tengo) >= _can) exitWith {hint "No tienes suministros para mí,  ponte a trabajar illo."};

	_cosa = format ["alm%1%2", _almacen, _cosa];
	missionNamespace setVariable [_cosa, (missionNamespace getVariable _cosa) + _can];
	if ((missionNamespace getVariable _cosa) > _maxAlmacen) then {missionNamespace setVariable [_cosa, _maxAlmacen]};
	if ((missionNamespace getVariable _cosa) < 0) then {missionNamespace setVariable [_cosa, 0]};
	publicVariableServer _cosa;

	[format ["almacen%1", _almacen], _pre] spawn ica_fnc_subeBajaBeneficios;
	[_class, _can *-1] call ica_fnc_item;
	medel_din = medel_din + _pre;
	["exp", _pre / 500] call ica_fnc_arrayExp;
	
	hint "Graciah por los suministroh illo. Sigue trabajando duro y veráh la recompensa.";
	[format ["- %1 %2", _can, [_class] call ica_fnc_classToName]] call ica_fnc_infolog;
	[format ["+ %1€", [_pre] call ica_fnc_numToStr]] call ica_fnc_infolog;
};

