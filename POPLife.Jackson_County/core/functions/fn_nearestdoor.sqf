/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches the nearest door of the building the player is looking
	at.
*/
private["_house","_door","_numOfDoors"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {0};
if !((typeOf _house) in listaCasas) exitWith {0};
_door = 0;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
_doors = 20;

/*
for "_i" from 1 to _doors do {
	_selectionPos = _house selectionPosition format["Door%1_Button",_i];
	_worldSpace = _house modelToWorld _selectionPos;
	if(player distance _worldSpace < 2.4) exitWith {_door = _i};
};

_door;
*/

/*
Comprobador de la puerta más cercana por Icaruk
Se invoca con:
	[[1, 1.7], [2, 4.8], [3, 9.5]] call ica_fnc_puertaMasCercana;
	[[numPuerta, distancia], [numPuerta2, distancia2]]
*/
_ica_fnc_puertaMasCercana = {

	private ["_fin", "_array0", "_array", "_cuantos", "_cerca", "_lugarArr", "_fin"];
	_array0 = _this;
	_cuantos = count _array0;
	
	_array = [];
	for "_i" from 0 to _cuantos do {
		_array pushBack (_array0 select _i select 1);
	};
	
	_cerca = if ((count _array) > 1) then {_array call BIS_fnc_lowestNum} else {_array};
	_lugarArr = if (count _array > 1) then {_array find _cerca} else {0};
	
	_fin = _array0 select _lugarArr select 0;
	if (isNil {_fin}) then {_fin = 0};
	_fin
};


[_house, _selectionPos, _worldSpace, _doors, _ica_fnc_puertaMasCercana] spawn {
    _house = _this select 0;
    _selectionPos = _this select 1;
    _worldSpace = _this select 2;
    _doors = _this select 3;
    _ica_fnc_puertaMasCercana = _this select 4;
    
	private "_puerta";
    _puerta = [];
    while {true} do {
        _selectionPos = _house selectionPosition format ["Door%1_Button", _doors];
        _worldSpace = _house modelToWorld _selectionPos;
        if (player distance _worldSpace < 7) then {
            _puerta pushBack [_doors, player distance _worldSpace];
        };

        _doors = _doors - 1;
        if (_doors < 0) exitWith {
            quePuerta = (_puerta call _ica_fnc_puertaMasCercana);
         
            titleText [format ["Has bloqueado/desbloqueado la puerta %1", quePuerta], "PLAIN"];
            // _house animate [format ["door%1", quePuerta], 0];
        };
    };
};

if (isNil {quePuerta}) then {
	quePuerta = 0;
};

quePuerta