
// ***********************************************************
// PoP Police framework by Blakord
// Obtener vehiculo del jugador si es en alguno
// ***********************************************************

private ["_Target","_MyVehicule","_result"];

_Target  = param[0];

if ( ! isPlayer _Target ) exitWith { nil; };
if ( vehicle _Target  isEqualTo  _Target ) exitWith { nil; };

assignedVehicle _Target;