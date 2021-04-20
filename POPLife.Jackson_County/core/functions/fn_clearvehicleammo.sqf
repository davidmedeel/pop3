
#include "..\..\script_macros.hpp"

private["_veh","_classname","_vehicle"];

_veh = _this select 0;
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_classname = typeOf _veh;

switch (_classname) do {
    case "SAS_AH99_W":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
    
    case "SAS_A149_W":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	
    case "SAS_V44_INF_W":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	
    case "ffaa_famet_ch47_mg":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	
    case "ffaa_famet_cougar":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	
	case "ffaa_famet_tigre":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	
	case "ffaa_nh90_tth_transport":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_lince_m2":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_vamtac_trans_blind":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_vamtac_trans":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_pegaso_carga":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_anibal":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_vamtac_crows":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_ar_harrier":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_ea_hercules_cargo":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_ea_hercules":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_vamtac_lag40":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_gc_lince_m2":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_lince_lag40":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
	case "ffaa_et_lince_mg3":
    {
        _veh setVehicleAmmo 0;
        _veh setDamage 0;
        _veh allowDamage true;
        clearItemCargoGlobal _veh;
    };
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
