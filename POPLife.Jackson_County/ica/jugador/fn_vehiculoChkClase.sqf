
// ***********************************************************
// PoP Police framework by Blakord
// Get class of vehicle if player is in vehi
// ***********************************************************

private ["_Target","_MyVehicule"];

_Target  = param[0];

if ( ! isPlayer _Target ) exitWith { nil; };
if ( vehicle _Target  isEqualTo  _Target ) exitWith { nil; };

_MyVehicule = assignedVehicle _Target;

typeOf _MyVehicule;