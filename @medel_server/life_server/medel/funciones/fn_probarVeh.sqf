
/*
por: Medel
*/

_probandoCoche = missionNamespace getVariable "probandoCoche";

if (_probandoCoche isEqualTo 1) exitWith {hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>Ya hay alguien usando el probado de vehículos.</t></t>"; closeDialog 0;};

if((lbCurSel 2302) isEqualTo -1) exitWith {hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>No has seleccionado ningún vehículo.</t></t>"; closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];

if (_className isKindOf "Air") exitwith {hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>No puedes probar este vehículo.</t></t>"; closeDialog 0;};

if (_className isKindOf "Ship") exitwith {hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>No puedes probar este vehículo.</t></t>"; closeDialog 0;};

if (medel_din < 3000) exitWith {hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>No tienes 3000€ para probar el vehículo.</t></t>"; closeDialog 0;};

medel_din = medel_din - 3000;

["- 3000"] spawn ica_fnc_infolog;

_posicion = getPos player;

_vehiculo = _className createVehicle getMarkerPos "probarVeh";

_vehiculo allowDamage false;
clearItemCargoGlobal _vehiculo;
_vehiculo lock 2;
_vehiculo setVectorUp (surfaceNormal (getMarkerPos "probarVeh"));
_vehiculo setDir (markerDir "probarVeh");
_vehiculo setPos (getMarkerPos "probarVeh");

missionNamespace setVariable ["probandoCoche",1,true];

player moveInDriver _vehiculo;

closeDialog 0;

_tiempo = 60;

while {_tiempo > 0} do {
	hintSilent parseText format ["<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>Tiempo Restante: %1s.</t></t>", _tiempo];
	sleep 1;
  	_tiempo = _tiempo - 1;

  if (_tiempo <= 0) then {
	hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO<br/><t size = ""1"" color=""#21618C"" align='left'>Se ha acabado el tiempo.</t></t>";

	player allowDamage false;
	[_vehiculo, [0, 0, 1]] call ica_fnc_setVelocityRas;
	deletevehicle _vehiculo;

	player setPos _posicion;
	player allowDamage true;
	missionNamespace setVariable ["probandoCoche",0,true];

    _tiempo = 0;
  };
};
