
if (dialog) exitWith {};

private ["_display","_list","_side","_texto","_alerta","_txt"];

createDialog "informacion";

disableSerialization;

waitUntil {!isNull (findDisplay 3200)};

while {!(isNull (findDisplay 3200))} do {
	if (isNull (findDisplay 3200)) exitWith{};
	_display = findDisplay 3200;
	_texto = _display displayCtrl 4001;
	_list = _display displayCtrl 4002;

	_alerta = missionNamespace getVariable "nivelAlerta";

	_texto ctrlSetStructuredText parsetext format ["<t size='0.97' font='PuristaMedium'>
		Policías: %1 <br/>
		EMS: %2 <br/>
		Civiles: %3 <br/>
		Nivel de alerta: %4 <br/>
		Jugadores totales: %5 / %6 <br/>
	</t>",west countSide playableUnits, independent countSide playableUnits, civilian countSide playableUnits, _alerta, count playableUnits, count allPlayers];

	_txt = ctrlText (_display displayCtrl 4004);
	if((_txt != '') && (_txt != 'Buscar jugador')) then {
		_txt = toLower _txt;
		lbClear _list;
		{
		_nombre = _x getVariable["realname",name _x];
		if((toLower _nombre) find _txt > -1) then {
			_side = switch(side _x) do {case west: {"Policia"}; case civilian : {"Civil"}; case independent : {"EMS"}; default {"Unknown"};};
			_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
			_list lbSetdata [(lbSize _list)-1,str(_x)];
		};
		} foreach playableUnits;
		lbSort [_list, "ASC"];
		waitUntil {(ctrlText (_display displayCtrl 4004)) != _txt || (isNull (findDisplay 3200))};
	};
	if (_txt isEqualTo '' || _txt isEqualTo 'Buscar jugador') then {
		lbClear _list;

		{
			_side = switch(side _x) do {case west: {"Policia"}; case civilian : {"Civil"}; case independent : {"EMS"}; default {"Unknown"};};
			_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
			_list lbSetdata [(lbSize _list)-1,str(_x)];
		} foreach playableUnits;
		lbSort [_list, "ASC"];
		waitUntil {(ctrlText (_display displayCtrl 4004)) != '' || (isNull (findDisplay 3200)) || (ctrlText (_display displayCtrl 4004)) != 'Buscar jugador'};
	};
	uiSleep 0.1;
};
