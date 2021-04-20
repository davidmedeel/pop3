
// ***********************************************************
// PoP Police framework by Blakord
// Verificar matriz de tipo de vehiculo
// ***********************************************************

private ["_Target","_MyVehicule","_tempMsg"];

_Target  = param[0];


player sideChat "soy entra 1";

if ( ! isPlayer _Target ) exitWith { nil; };
//if ( vehicle _Target == _Target ) exitWith { nil; };

_MyVehicule = assignedVehicle _TargWet;

If (_MyVehicule getCargoIndex _Target >= 0 ) Then {
	_tempMsg = str (_MyVehicule getCargoIndex _Target);
} Else {
	_tempMsg = "not";
};
//_tempMsg = format ["p%1",  (toString  _MyVehicule getCargoIndex _Target)];

If ( _MyVehicule getCargoIndex _Target == 0 ) Then { player sideChat "soy copiloto";
player sideChat "soy copiloto";

_tempMsg
