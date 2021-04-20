/*
Carga del camión
by: Icaruk

Función: Busca la caja de un camión para eliminarla, dando dinero acorde con los suministros. Aumenta suministros.
	[1] spawn ica_fnc_descarga;
	[2] spawn ica_fnc_descarga;
	[3] spawn ica_fnc_descarga;
	[4] spawn ica_fnc_descarga;
*/

_param = _this select 0; // 0-4
_estoy = "mrkDescarga" + str _param;
_busqueda = 16;

if ((player distance (getMarkerPos _estoy)) > 4) exitWith {hint "¡ACÉRCATEEE, NO TE ESCUCHO DESDE AHÍ!"; };
if ((count (nearestObjects [(getMarkerPos _estoy), ["Man"], 4])) > 1) exitWith {
	hint "Los negocios se hacen entre 2 personas, cuando intervienen más, es que una parte quiere hacer algo raro.";
};

_caja = nearestObjects [(getMarkerPos _estoy), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_sand_F"
], _busqueda]; // busco la caja

if (isNil {_caja select 0}) exitWith {hint "No hay ninguna mercancía"};
if (((_caja select 0) distance (getMarkerPos _estoy)) > _busqueda) exitWith {hint "El camión está demasiado lejos"};

_var = (_caja select 0) getVariable "carga";
if (isNil {_var}) exitWith {hint "Variable carga no encontrada"};

_cosa = _var select 0;
_can = _var select 1;

detach (_caja select 0);
deleteVehicle (_caja select 0);

[player, ["alm1Ali", "alm1Agu", "alm1Com", "alm1Mad",
	"alm2Ali", "alm2Agu", "alm2Com", "alm2Mad",
	"des1Ali", "des1Agu", "des1Com", "des1Mad",
	"des2Ali", "des2Agu", "des2Com", "des2Mad",
	"des3Ali", "des3Agu", "des3Com", "des3Mad",
	"des4Ali", "des4Agu", "des4Com", "des4Mad"]
] call ica_fnc_varToServer;

 waitUntil {recibido};

_variable = format ["des%1%2", _param, _cosa];
variable = (missionNamespace getVariable _variable);

_formula = {
	private ["_zd", "_cosa", "_multi", "_n"];
	_cosa = _this select 0;
	_zd = _this select 1;
	_multi = switch (_zd) do {
	// estoy hay que tocarlo, cuanto más alto más larga la ruta, depende de las posiciones del mapa
		case 1: {1.1};
		case 2: {1.4};
		case 3: {1.3};
		case 4: {1};
	};

	_multi=_multi*(-0.0000005*variable*variable-0.00025*variable+1);
	_n = 200;
	_fin = round (_n * _multi);
	_fin
};

_valor = [_cosa, _param] call _formula;
_valorTotal = _valor * _can;
["transportes", _valorTotal] spawn ica_fnc_subeBajaBeneficios;
medel_din = medel_din + medel_dsin_valorTotal;
[format ["+ %1€", _valorTotal]] call ica_fnc_infolog;

["exp", _valorTotal / 1000] call ica_fnc_arrayExp;

missionNamespace setVariable [_variable, (missionNamespace getVariable _variable) + _can];
if ((missionNamespace getVariable _variable) > 1000) then {missionNamespace setVariable [_variable, 1000]};
if ((missionNamespace getVariable _variable) < 0) then {missionNamespace setVariable [_variable, 0]};
publicVariableServer _variable;
