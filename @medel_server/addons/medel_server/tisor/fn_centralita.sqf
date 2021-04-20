
/*
por: Tisor
	["menu"] spawn ica_fnc_centralita
	["actualizar"] spawn ica_fnc_centralita
*/

_param = param [0];

if (_param isEqualTo "menu") exitWith {

	[player, ["centralitaArray"]] call ica_fnc_varToServer; waitUntil {recibido};
	disableSerialization;
	createDialog "centralita";

	_ui = uiNameSpace getVariable "centralita_dialog";
	_mando = _ui displayCtrl 777701;
	_zeta10 = _ui displayCtrl 777702;
	_zeta11 = _ui displayCtrl 777703;
	_zeta20 = _ui displayCtrl 777704;
	_zeta21 = _ui displayCtrl 777705;
	_zeta30 = _ui displayCtrl 777706;
	_zeta31 = _ui displayCtrl 777707;
	_zeta40 = _ui displayCtrl 777709;
	_sierra10 = _ui displayCtrl 777708;
	_alpha100 = _ui displayCtrl 777710;
	_bravo100 = _ui displayCtrl 777711;
	_charlie100 = _ui displayCtrl 777712;
	_delta100 = _ui displayCtrl 777713;
	_intervencion = _ui displayCtrl 777714;
	_meta = _ui displayCtrl 777715;

	_mando ctrlSetText (centralitaArray select 0);
	_zeta10 ctrlSetText (centralitaArray select 1);
	_zeta11 ctrlSetText (centralitaArray select 2);
	_zeta20 ctrlSetText (centralitaArray select 3);
	_zeta21 ctrlSetText (centralitaArray select 4);
	_zeta30 ctrlSetText (centralitaArray select 5);
	_zeta31 ctrlSetText (centralitaArray select 6);
	_zeta40 ctrlSetText (centralitaArray select 7);
	_sierra10 ctrlSetText (centralitaArray select 8);
	_alpha100 ctrlSetText (centralitaArray select 9);
	_bravo100 ctrlSetText (centralitaArray select 10);
	_charlie100 ctrlSetText (centralitaArray select 11);
	_delta100 ctrlSetText (centralitaArray select 12);
	_intervencion ctrlSetText (centralitaArray select 13);
	_meta ctrlSetText (centralitaArray select 14);

};

if (_param isEqualTo "actualizar") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "centralita_dialog";
	_mando = _ui displayCtrl 777701;
	_zeta10 = _ui displayCtrl 777702;
	_zeta11 = _ui displayCtrl 777703;
	_zeta20 = _ui displayCtrl 777704;
	_zeta21 = _ui displayCtrl 777705;
	_zeta30 = _ui displayCtrl 777706;
	_zeta31 = _ui displayCtrl 777707;
	_zeta40 = _ui displayCtrl 777709;
	_sierra10 = _ui displayCtrl 777708;
	_alpha100 = _ui displayCtrl 777710;
	_bravo100 = _ui displayCtrl 777711;
	_charlie100 = _ui displayCtrl 777712;
	_delta100 = _ui displayCtrl 777713;
	_intervencion = _ui displayCtrl 777714;
	_meta = _ui displayCtrl 777715;


	centralitaArray = [
		ctrlText _mando,
		ctrlText _zeta10,
		ctrlText _zeta11,
		ctrlText _zeta20,
		ctrlText _zeta21,
		ctrlText _zeta30,
		ctrlText _zeta31,
		ctrlText _zeta40,
		ctrlText _sierra10,
		ctrlText _alpha100,
		ctrlText _bravo100,
		ctrlText _charlie100,
		ctrlText _delta100,
		ctrlText _intervencion,
		ctrlText _meta
	];

	publicVariableServer "centralitaArray";

	closeDialog 0;


};