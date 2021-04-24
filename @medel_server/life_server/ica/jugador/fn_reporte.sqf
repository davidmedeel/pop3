
/*
por: Icaruk
	call ica_fnc_reporte;
*/

if (!isNil "reporteUsado") exitWith {hint "Sólo puedes usar esta función cada 20 minutos"};

reporteUsado = true;

_din = round (medel_atmdin * 0.25);

medel_atmdin = medel_atmdin - _din;

//medel_atmdin = medel_atmdin - _din;
[0] call SOCK_fnc_updatePartial;
[format ["REPORTE ----- %1 (%2) ha usado la función reporte (- %3€)", name player, getPlayerUID player, _din], "diag_log", false, false, false] call BIS_fnc_MP;
	["Reporte Log",format [
	"%1 - (%2) ha utilizado la función reporte y se le han retirado %3 de su cuenta bancaria",
	profileName,
	(getPlayerUID player),
	_din
	]
	] remoteexeccall ["ica_fnc_customlog",2];
hint format ["Has usado la funcion reporte, se te han retirado %1€ de tu cuenta bancaria",_din];

[] spawn {

	sleep 30;
	removeMissionEventHandler ["Draw3D", EHreporte];

	sleep (60 * 20);
	reporteUsado = nil;

};

EHreporte = addMissionEventHandler ["Draw3D",{

	_arr = nearestObjects [player, ["Man", "Car"], 60];
	if ((count _arr) > 1) then {
		{
			_dist = player distance _x;
			_dist = if (_dist < 1.5) then {1.5} else {_dist};

			drawIcon3D [
				"\a3\ui_f\data\map\Markers\System\dummy_ca.paa", 
				[1,0.2,0.2, (60 - _dist) / 50], 
				[((getPos _x) select 0), ((getPos _x) select 1), 2+(1.8/(60/_dist))],
				1,
				1,
				0,
				format ["%1 - %2",name _x, getplayeruid _x],
				1.8,
				0.036,
				"TahomaB"
			];
		} forEach _arr;
	};
}];
