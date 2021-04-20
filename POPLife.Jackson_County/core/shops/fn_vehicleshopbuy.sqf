#include <macro.h>
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_achat","_money","_sp","_box","_offset"];
_mode = _this select 0;
_achat = _this select 1;
if (isnil "medel_din") exitWith {medel_din = 0;closeDialog 0};
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(medel_din < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - medel_din] call life_fnc_numberText];closeDialog 0;};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense";closeDialog 0;};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","Motorcycle"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","Motorcycle"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";closeDialog 0;};
medel_din = medel_din - _basePrice;
call ica_fnc_sync;
[] call SOCK_fnc_updateRequest;

	["Money Log",format [
	"%1 - (%2) ha comprado %6 por %3  - Dinero en banco : %4 - Dinero en mano %5 (Tienda de Coches)",
	profileName,
	(getPlayerUID player),
	_basePrice,
	medel_atmdin,
	medel_din,
	_classname
	]
	] remoteexeccall ["ica_fnc_customlog",2];

	_organizacion = cursorTarget getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
	[(round (_price * 0.01)),_organizacion] call life_fnc_gangExtorsion;  
	};
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
_GCrepaint = false;
//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] remoteexec ["life_fnc_colorVehicle",-2];
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteexeccall ["TON_fnc_setObjVar",2];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	if (_className isEqualTo "pop_mercedes_benz_vito_atgc1") then {
		_className = "pop_mercedes_benz_vito_cnp1";
		_GCrepaint = true;
	};

	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	
	if (_GCrepaint) then {
		_vehicle setObjectTextureGlobal [0, "pop_coches_policia\pop_mercedes_benz_vito_gc\data\texturas\gc.paa"];
	};
	
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[_vehicle,_colorIndex] remoteexec ["life_fnc_colorVehicle",-2];
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteexeccall ["TON_fnc_setObjVar",2];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

_vehicle allowDamage true;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteexeccall ["TON_fnc_keyManagement",2];

if((__GETC__(life_donator) > 2) && !((typeOf _vehicle) in ["O_MRAP_02_F","B_MRAP_01_F"])) then {_vehicle setVariable["insured",true,true];};

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteexeccall ["TON_fnc_vehicleCreate",2];
	};
};

_box = boundingBox _vehicle;
_offset = _box select 1;  //Gets an array with the maximum bounding values
_offset = _offset select 2; //Gets the Maxmimum Z height
_offset = _offset + 0.8; //Just a few inches more...

_sp = visiblePosition _vehicle;
_sp = _sp vectorAdd [0,0,_offset];

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;