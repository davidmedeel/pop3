
/*
Menú de tienda de compra y de venta por Icaruk

Params:
	0: STRING - "menu" // para abrir el menu
	1: BOOL - true comprar, false vender
	2: STRING - "nombreTienda" // 
	3: ARRAY (opcional) - [CIVILIAN, WEST, EAST, INDEPENDENT] o nil // para limitar quién puede entrar

Se invoca con:
	["menu", true, "Tienda general", [CIVILIAN, WEST]] call ica_fnc_menuCompraVenta // compra para civ y west
	["menu", false, "Almacen"] call ica_fnc_menuCompraVenta // venta para todos
*/

_param = _this select 0;
disableSerialization;

if (_param isEqualTo "menu") exitWith {
	_modo = _this select 1;
	_txtTienda = _this select 2;
	_sides = _this select 3;
	
	private ["_sides"];
	if (isNil {_sides}) then {_sides = [CIVILIAN, WEST, EAST, INDEPENDENT]};
	if !(side player in _sides) exitWith {hint "Parece que este señor te ignora, te ignora fuerte."};
	if (_txtTienda isEqualTo "Tienda del periodista" && !license_civ_periodista) exitWith {hint "Necesitas la licencia de periodista para poder usar esta tienda"};
	createDialog "menuCompraVenta";

	_ui = uiNameSpace getVariable "menuCompraVenta";
	_titulo = _ui displayCtrl 6030;	
	_btnC = _ui displayCtrl 6032;
	_btnV = _ui displayCtrl 6033;
	
	if (_modo) then {
		_btnV ctrlShow false;
		_btnV ctrlEnable false;
	} else {
		_btnC ctrlShow false;
		_btnC ctrlEnable false;
	};
	_titulo ctrlSetText _txtTienda;
	
	["llenaLista", _modo, _txtTienda] call ica_fnc_menuCompraVenta;
};

if (_param isEqualTo "llenaLista") exitWith {
	_modo = _this select 1;
	_txtTienda = _this select 2;
	_ui = uiNameSpace getVariable "menuCompraVenta";
	_titulo = _ui displayCtrl 6030;
	_lista = _ui displayCtrl 6031;
	
	private ["_pre", "_arrayTienda"];
	// _lista ctrlSetEventHandler ["LBSelChanged", "['actualizo'] call ica_fnc_menuCompraVenta; "];	
	
	lbClear _lista;
	_arrayTienda = [_txtTienda] call ica_fnc_arrayTienda;
	
	/*
	if (_modo) then {
		_arrayTienda = [_txtTienda] call ica_fnc_arrayTienda;
	} else {
		_arrayInv = uniformItems player + vestItems player + backpackItems player;
		
		_idx = 0;
		arrayTienda = [];
		while {_idx < (count _arrayInv)} do {
			arrayTienda pushBack [_arrayInv select _idx, _idx];		
			_arrayTienda = arrayTienda;
			
			_idx = _idx + 1;
		};	
	};
	*/
	
	// hint format ["%1", _arrayTienda]; // debug
	
	_idx = 0;
	while {_idx < (count _arrayTienda)} do {
		
		if ((typeName (_arrayTienda select _idx)) == "STRING") then { //
			_pic = [_arrayTienda select _idx] call ica_fnc_classToPic;
			_nom = [_arrayTienda select _idx] call ica_fnc_classToName;
			_precio = [_arrayTienda select _idx, _modo, _txtTienda] call ica_fnc_precio; // SCALAR

			_pre = format ["  (%1 €)", ([_precio, 3] call ica_fnc_numToStr)]; // STRING

			_lista lbAdd format ["%1 %2", _nom, _pre];
			_lista lbSetPicture [_idx, _pic];
			_lista lbSetData [_idx, (_arrayTienda select _idx)];
			_lista lbSetValue [_idx, _precio];		

			if !(_modo) then {
				if (([_arrayTienda select _idx] call ica_fnc_tengo) <= 0) then {
					_lista lbSetColor [_idx, [1, 0, 0, 1]]; 
				};
			};			
		} else {
			_lista lbAdd "";			
		};
		
		_idx = _idx + 1;
	};
};

if (_param isEqualTo "actualiza") exitWith {
	private ["_boton"];
	
	_ui = uiNameSpace getVariable "menuCompraVenta";
	_lista = _ui displayCtrl 6031;
	_btnC = _ui displayCtrl 6032;
	_btnV = _ui displayCtrl 6033;
	_txtTiendaTengo = _ui displayCtrl 6034;
	_txtTiendaPrecio = _ui displayCtrl 6035;
	if (ctrlShown _btnC) then {
		_boton = _btnC;
		modo = "compro";
	} else {
		_boton = _btnV;
		modo = "vendo";
	};
	
	_idxLista = lbCurSel 6031;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;	

	// _txtTiendaTengo ctrlSetText format ["%1 asdf", _cosa]; // aún no se usa
	
	_boton buttonSetAction '
		[modo, cosa, precio] call ica_fnc_menuCompraVenta;
	';
};

if ((_param isEqualTo "compro") OR (_param isEqualTo "vendo")) then {
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

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;
	_vendasCompradas = missionNamespace getVariable "stockVendas";
	_kitsComprados = missionNameSpace getVariable "stockKits";

	if (_cosa == "") exitWith {hint "No puedes comprar un separador"};
	if !(medel_din >= _precio) exitWith {hint "No tienes suficiente dinero"; };
	_picohacha = true;
	if ((_cosa isEqualTo "cl_pick_axeweap" OR _cosa isEqualTo "cl_axe" OR _cosa isEqualTo "cl_shovel") && currentWeapon player isEqualTo "" && primaryweapon player isEqualTo "" && secondaryWeapon player isEqualTo "" && handgunWeapon player isEqualTo "") then {player addweapon _cosa; _picohacha = false;};
	if (!(player canAdd _cosa) && _picohacha) exitWith {hint "No tienes suficiente espacio"; closeDialog 0;};
	if (_picohacha) then {[_cosa] call ica_fnc_item;};
	["comercios", _precio] spawn ica_fnc_subeBajaBeneficios;
	medel_din = medel_din - _precio;
	hint format ["Te has gastado %1€ en %2", _precio, [_cosa] call ica_fnc_classToName];

	[format ["- %1€", [_precio] call ica_fnc_numToStr]] call ica_fnc_infolog;
	[format ["+ 1 %1", [_cosa] call ica_fnc_classToName]] call ica_fnc_infolog;
};

if (_param isEqualTo "vendo") exitWith {
	_cosa = _this select 1; 
	_precio = _this select 2; 

	if (_cosa == "") exitWith {hint "No puedes vender un separador"};
	if !(([_cosa] call ica_fnc_tengo) >= 1) exitWith {hint "No tienes nada que vender"};
	[_cosa, -1] call ica_fnc_item;
	["comercios", _precio] spawn ica_fnc_subeBajaBeneficios;
	medel_din = medel_din + _precio;
	hint format ["Has vendido %1 por %2", [_cosa] call ica_fnc_classToName, _precio];
	[format ["- 1 %1", [_cosa] call ica_fnc_classToName]] call ica_fnc_infolog;
	[format ["+ %1€", [_precio] call ica_fnc_numToStr]] call ica_fnc_infolog;
	
	// [_cosa] call ica_fnc_demanda;
	
	["Money Log",format [
	"%1 - (%2) ha vendido %6 por %3 - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_precio,
	medel_atmdin,
	medel_din,
	([_cosa] call ica_fnc_classtoname)
	]
	] remoteexeccall ["ica_fnc_customlog",2];

	["llenaLista", false, ctrlText ((uiNameSpace getVariable "menuCompraVenta") displayCtrl 6030)] call ica_fnc_menuCompraVenta;
};
