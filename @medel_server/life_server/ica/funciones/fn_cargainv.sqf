
/*
por: Icaruk
	[] call ica_fnc_cargaInv; 		// devuelve la carga teniendo en cuenta el equipamiento (si sólo tienes mochila, sólo calcula 1/1, si tienes todo cacula 3/3)
	["kg"] call ica_fnc_cargaInv; 	// devuelve la carga total teórica (como si tuvieses todos los contenedores equipados)
*/

private "_fin";

_kg = 0;
_div = 0;
if ((backPack player) != "") then {_kg = _kg + loadBackPack player; _div = _div + 1};
if ((uniform player) != "") then {_kg = _kg + loadUniform player; _div = _div + 1};
if ((vest player) != "") then {_kg = _kg + loadVest player; _div = _div + 1};
if (_div == 0) then {_kg = 1; _div = 1};

_fin = (_kg / _div);

if ((_this select 0) == "kg") then {
	_fin = _kg;
};

_fin