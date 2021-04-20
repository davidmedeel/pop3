
// ***********************************************************
// PoP Police framework by Blakord
// Clean vehicles with attach siren
// ***********************************************************

private ["_Veh","_vehDel"];

_Veh = param[0];
_vehDel = param[1];

{ 
	If ( !(_x isKindOf "Thing") and !(_x isKindOf "Static") and !(_x isKindOf "MineMine") and !(_x isKindOf "AllVehicles") and !(_x isKindOf "Logic") ) Then {
		deleteVehicle _x;
	};
} forEach attachedObjects _Veh;

If ( _vehDel ) Then {
	deleteVehicle _Veh;
};