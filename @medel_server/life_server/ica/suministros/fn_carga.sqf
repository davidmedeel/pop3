/*
por: Icaruk
	[almacen, _cosa, _can, _variable, _precio] spawn ica_fnc_carga;
*/

if (!isNil {ocupado}) exitWith {hint "Sólo puedes hacer esto cada 18 segundos"};
0 spawn {
	if (isNil {ocupado}) then {
		ocupado = true;
		sleep 18;
		ocupado = nil;
	};
};


if (!isNil {cargando}) exitWith {hint "Ya estás cargando una caja..."};

_busqueda = 12;

private ["_estoy", "_cosa", "_can", "_caja", "_veh", "_cargaMax"];

_estoy = "mrkAlmacen" + str (_this select 0);
_cosa = _this select 1;
_can = _this select 2;
_variable = _this select 3;
_pago = _this select 4;

_listaVeh = ["pop_volvo_camion_sin", "pop_Man_TGXsin_negro", "POP_renaultmagnum1_f"];

if ((typeName _can) != "SCALAR") exitWith {hint "La cantidad debe de ser un número"};
if !(_can > 0) exitWith {hint "La cantidad debe de ser mayor que 0"};

_veh = (nearestObjects [(getMarkerPos _estoy), _listaVeh, _busqueda]) select 0; // busco el camión
if (isNil {_veh}) exitWith {hint "No hay ningún vehículo"};

_cargaMax = switch (typeOf _veh) do {
	case "pop_volvo_camion_sin": {50};
	case "pop_Man_TGXsin_negro": {100};
	case "POP_renaultmagnum1_f": {150};
};
_cargaMax = if (("log" call ica_fnc_expToLevel) >= 2) then {_cargaMax + 10} else {_cargaMax};
_cargaMax = if (("log" call ica_fnc_expToLevel) >= 4) then {_cargaMax + 10} else {_cargaMax};

if (_can > _cargaMax) exitWith {hint format ["Sólo puedes llevar %1 toneladas", _cargaMax] };

_carga = nearestObjects [(getMarkerPos _estoy), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F"
	], 15];
if (count _carga != 0) exitWith {hint "El camión ya está cargado"; };
if ((_veh distance (getMarkerPos _estoy)) > _busqueda) exitWith {hint "Estás demasiado lejos"; };


if (_pago > medel_din) exitWith {hint format ["Necesitas %1€ más para pagar los impuestos", _pago - medel_din]; };
medel_din = medel_din - _pago;
[format ["- %1€", _pago]] call ica_fnc_infolog;

missionNamespace setVariable [_variable, (missionNamespace getVariable _variable) - _can];
_palServer = missionNamespace getVariable _variable;
publicVariableServer _variable;

switch (_cosa) do { // creo la caja
	case "Ali": { _caja = "Land_Cargo20_light_green_F" createVehicle (getMarkerPos "") };
	case "Agu": { _caja = "Land_Cargo20_blue_F" createVehicle (getMarkerPos "") };
	case "Com": { _caja = "Land_Cargo20_yellow_F" createVehicle (getMarkerPos "") };
	case "Mad": { _caja = "Land_Cargo20_sand_F" createVehicle (getMarkerPos "") };
};

cargando = true;
hint format ["Empaquetando %1 tonelada(s)...", _can];
sleep 8;
hint "Montando la mercancia en el camion...";
sleep 3;
hint "Colocando una etiqueta bonita...";
sleep 2;

_carga = nearestObjects [(getMarkerPos _estoy), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F"
	], 15];
if (count _carga != 0) exitWith {hint "Ya había una carga en tu camión, has intentado abusar y te has quedado sin dinero. Enhorabuena."; cargando = nil};
if ((_veh distance (getMarkerPos _estoy)) > _busqueda) exitWith {hint "Has movido el camión mientras se cargaba la mercancía y se ha derramado todo."; cargando = nil};
if !(isNil {_veh getVariable "carga"}) exitWith {hint "El camion ya está cargado"; cargando = nil};

hint "Todo listo, buen viaje :)";

waitUntil {!isNull _caja};
cargando = nil;

_caja setVariable ["carga", [_cosa, _can], true];
switch (typeOf _veh) do {
	case "pop_volvo_camion_sin": { _caja attachTo [_veh, [0 ,-2.6, 2.5]]; };
	case "pop_Man_TGXsin_negro": { _caja attachTo [_veh, [0, -3.3, 2.35]]; };
	case "POP_renaultmagnum1_f": { _caja attachTo [_veh, [0, -3.7, 2.55]]; };
};

_caja setdir 270;
[_caja, ["<t color='#DF0101'>Eliminar mágicamente</t>",'if (side player != CIVILIAN) then {deleteVehicle (_this select 0)}', "", 1,false,true,"",""]] remoteexeccall ["ica_fnc_meteAccion",-2,true];
