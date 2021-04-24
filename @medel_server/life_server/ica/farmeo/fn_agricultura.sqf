
/*
por: Icaruk
	call ica_fnc_agricultura // el parámetro depende de tu stance
	no funciona en el editor
*/

// --- SERVIDOR ---
_param = _this select 0;

if (isServer) exitWith {
	if (_param isEqualTo "plantoServer") exitWith {
		private ["_class", "_planta", "_hundimiento", "_pos"];
		_pos = _this select 1;
		_class = _this select 2;

		_planta = createVehicle [_class select 0, [(getpos _pos select 0), (getpos _pos select 1), (getpos _pos select 2) - 0.1], [], 0, "CAN_COLLIDE"];
		_hundimiento = (boundingBox _planta select 1 select 2);
		_planta setPos [(getPos _planta select 0), (getPos _planta select 1), (getPos _planta select 2) - _hundimiento];
		_planta setVariable ["crecimiento", 0, true];
		while {true} do {
			if (isNil {_planta getVariable "crecimiento"}) exitWith {};
			if (isNull _planta) exitWith {};
			
			if ((_planta getVariable "crecimiento") >= 100) exitWith {
				_planta setVariable ["crecimiento", 100, true];
				_hundimiento = (boundingBox _planta select 1 select 2);
				_planta setPos [(getPos _planta select 0), (getPos _planta select 1), (getPos _planta select 2) + _hundimiento];
			};
			_planta setVariable ["crecimiento", (_planta getVariable "crecimiento") + 20, true];
			sleep ((_class select 1) / 5);
		};
	};
};


// --- CLIENTE ---

// antispam
if (!isNil {spamAgricultura}) exitWith {
	spamAgricultura = spamAgricultura + 1;
	closeDialog 0;
	hint format ["Tienes que esperar %1 segundo(s)", spamAgricultura];
};
[] spawn {
	if (isNil {spamAgricultura}) then {
		spamAgricultura = 1;

		while {true} do {
			if (spamAgricultura <= 0) exitWith {spamAgricultura = nil };
			sleep 1;
			spamAgricultura = spamAgricultura - 1;
		};
	};
};

// seleccion de modo
private "_param";
_param = switch (stance player) do {
	case "STAND": {"planto"};
	case "CROUCH": {"recolecto"};
	case "PRONE": {"riego"};
};
if ((typeName _param) == "BOOL") exitWith {hint "Error"};

_plantas = [
	"pop_rabano_plan",
	"pop_bamboo_plan",
	"pop_algodon_plan",
	"pop_girasol_plan",
	"pop_maiz_plan",
	"pop_trigo_plan",
	"pop_cannabis1_plan"
];


if (_param isEqualTo "planto") exitWith {
	private ["_cercania"];

	if (isNil {estoyPlantando}) exitWith {hint "Usa una semilla y después intenta plantar" };
	_semilla = estoyPlantando;
	if ((_semilla == "cannabis") AND (("agr" call ica_fnc_expToLevel) < 2)) exitWith {hint "No sabes plantar eso"};
	if ((_semilla == "cannabis") AND (({side _x isEqualto WEST} count playableunits) <= 2)) exitWith {hint "Se necesitan 3 policias para plantar cannabis"};

	// seleccion classname planta
	_mrkAcidos = ["TPHacido1", "TPHacido2", "TPHacido3"];
	_mrkBasicos = ["TPHbasico1", "TPHbasico2", "TPHbasico3"];
	_mrkNeutros = ["TPHneutro1", "TPHneutro2", "TPHneutro3"];

	_t = if (("agr" call ica_fnc_expToLevel) >= 1) then {3} else {12};

	_class = switch (_semilla) do {
		case "rabano":	{["pop_rabano_plan", (60 * _t), "pop_rabano_s", _mrkBasicos]};
		case "bamboo":	{["pop_bamboo_plan", (60 * _t), "pop_bamboo_s", _mrkNeutros]};
		case "algodon":	{["pop_algodon_plan", (60 * _t), "pop_algodon_s", _mrkNeutros]};
		case "girasol":	{["pop_girasol_plan", (60 * _t), "pop_girasol_s", _mrkBasicos]};
		case "maiz":	{["pop_maiz_plan", (60 * _t), "pop_maiz_s", _mrkAcidos]};
		case "trigo":	{["pop_trigo_plan", (60 * _t), "pop_trigo_s", _mrkAcidos]};
		case "cannabis":	{["pop_cannabis1_plan", (60 * _t), "pop_cannabis_s", _mrkNeutros]};
	};
	if ((typeName _class) == "BOOL") exitWith {hint "Error"};

	// comprobacion tipo de tierra
	if (((getMarkerPos ((_class select 3) call ica_fnc_masCercano)) distance player) > 30) exitWith {
		hint "Esta planta no va aquí, o estás demasiado lejos de donde debería de ir";
	};

	// comprobacion cercania
	_cercania = nearestObjects [player, _plantas, 3];
	if (count _cercania == 0) then {_cercania = false} else {_cercania = true};
	if (_cercania) exitWith { hint "Hay una planta demasiado cerca"; };

	// comprobacion item
	if !(([_class select 2] call ica_fnc_tengo) >= 1) exitWith { hint "No tienes semillas"; };
	[_class select 2, -1] call ica_fnc_item;
	[format ["-1 %1", [_class select 2] call ica_fnc_classToName]] call ica_fnc_infolog;
	
	_str = format ["Plantando %1", [_semilla] call ica_fnc_classToName];
	titleText [_str, "PLAIN", 0.3];

	// se lo mando al servidor
	["plantoServer", player, _class] remoteexec ["ica_fnc_agricultura",2];
};


if (_param isEqualTo "recolecto") exitWith {
	_cercania = nearestObjects [player, _plantas, 3];
	if (isNull (_cercania select 0)) exitWith {};
	if ((((_cercania select 0) getVariable "crecimiento") < 100) OR (isNil {(_cercania select 0) getVariable "crecimiento"})) then {
		hint format ["Esta planta está al %1%2 de su crecimiento, la paciencia es la clave", (_cercania select 0) getVariable "crecimiento", "%"];
	} else {
		_que = typeOf (_cercania select 0);

		_pillo = switch (_que) do {
			case "pop_rabano_plan": 		{"pop_rabano_i" };
			case "pop_bamboo_plan":		{"pop_bamboo_i" };
			case "pop_algodon_plan": 		{"pop_algodon_i" };
			case "pop_girasol_plan":		{"pop_girasol_i" };
			case "pop_maiz_plan":			{"pop_maiz_i" };
			case "pop_trigo_plan": 		{"pop_trigo_i" };
			case "pop_cannabis1_plan": 	{"pop_cannabis_i" };
		};

		_n = if (("agr" call ica_fnc_expToLevel) >= 3) then {2} else {1};

		if !(player canAdd _pillo) exitWith {hint "No tienes suficiente espacio"};
		[_pillo, _n] call ica_fnc_item;
		deleteVehicle (_cercania select 0);
		_str = format ["Recolectando %1", [_pillo] call ica_fnc_classToName];
		titleText [_str, "PLAIN", 0.3];
	};
};

if (_param isEqualTo "riego") exitWith {
	_cercania = nearestObjects [player, _plantas, 3];
	if (isNull (_cercania select 0)) exitWith {};
	if (isNil {(_cercania select 0) getVariable "crecimiento"}) exitWith {};

	if !((["pop_aguasucia"] call ica_fnc_tengo) >= 1) exitWith {hint "No tienes agua para regar. No, la saliva no vale."};

	if ((((_cercania select 0) getVariable "crecimiento") > 90) AND (((_cercania select 0) getVariable "crecimiento") <= 100)) then {
		["pop_aguasucia", -1] call ica_fnc_item;
		(_cercania select 0) setVariable ["crecimiento", ((_cercania select 0) getVariable "crecimiento") - 20, true];
		titleText ["Has regado con suma preción", "PLAIN", 0.3];
	} else {
		hint "Esta planta ya ha pasado su fase inicial, no puedes regarla o la matarás. ¿Acaso quieres matarla? ¿eh, eh?";
	};
};
