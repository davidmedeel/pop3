/*
por: Icaruk y Tisor
	call ica_fnc_creaMatricula
*/

private ["_num", "_letra", "_mat", "_ref", "_refs"];

_ref = _this select 0; // string?

if (isNil {_ref}) then {

	_num = (round random 8999) + 1000;
	/*_letra = [
		"B", "C", "D", "F", "G", "H", "J", "K", "L", "M",
		"N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"
	];
*/
	_mat = "P-";

	_mat = _mat + str _num + "-POP";
	//for "_x" from 0 to 1 do {
		//_mat = _mat + (_mat call BIS_fnc_selectRandom);

} else {

	_ref = format["%1", _ref];
	_mat = "";

	if (count _ref < 4) then {
		for "_x" from 0 to (3 - (count _ref)) do {
			_mat = "38";
		};
	};

	//_letra = ["B", "F", "H", "L", "M", "N", "P", "T", "X", "Z"];
	_mat = _mat + _ref + "-POP";

	_refs = format["%1", _ref];
	_numarray = [_refs] call KRON_StrToArray;
	reverse _numarray;
	//_mat = _mat + (_letra select (parseNumber (_numarray select 0)));
	//_mat = _mat + (_letra select (parseNumber (_numarray select 1)));
	//_mat = _mat + (_letra select (parseNumber (_numarray select 2)));

};

_mat = if (isNil {_mat}) then {"MATisNull"} else {_mat};

_mat