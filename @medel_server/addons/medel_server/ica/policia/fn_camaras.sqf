
/*
Cámaras de seguridad por Icaruk
	["menu"] call ica_fnc_camaras;
*/

_param = param [0];

// (findDisplay 46) displayAddEventHandler ["KeyDown", "hint format ['%1', _this select 1]; "];


if (!isNil {DDoS}) exitWith {hint "Server is under attack"};

if (_param isEqualTo "init") exitWith {
	
	ica_fnc_vercam = {
		[_this select 0] spawn {
			_obj = param [0];
			
			_cam = "camera" camCreate (getpos _obj);
			_cam setDir (getDir _obj);
			_pitch = (_obj call BIS_fnc_getpitchbank) select 0;
			// _pitch = _pitch - (_pitch * 2); // paso a negativo
			[_cam, _pitch, 0] call BIS_fnc_setpitchbank;
			
			_cam cameraEffect ["INTERNAL", "BACK"];
			
			if (((date select 3) >= 20) OR ((date select 3) < 6)) then [{
				camUseNVG true},{camUseNVG false;
			}];
			
			private ["_ppColor"];
			_ppColor = ppEffectCreate ["colorCorrections", 1999];
			_ppColor ppEffectEnable true;
			_ppColor ppEffectAdjust [1.1, 0.2, 0, [1,1,1,0], [1,1,1,0], [1,1,1,0]];  
			_ppColor ppEffectCommit 0;

			private ["_ppGrain"];
			_ppGrain = ppEffectCreate ["filmGrain", 2012];
			_ppGrain ppEffectEnable true;
			_ppGrain ppEffectAdjust [0.3, 1, 1, 0, 1];
			_ppGrain ppEffectCommit 0;

			
			titleText ["Pulsa espacio para salir", "PLAIN", 0.3];
			
			obj = _obj;
			cam = _cam;
			ppColor = _ppColor;
			ppGrain = _ppGrain;
			
			finCam = (findDisplay 46) displayAddEventHandler ["KeyDown",
				"if ((_this select 1) == 57) then {
					(findDisplay 46) displayRemoveEventHandler ['KeyDown', finCam];
					ppEffectDestroy ppColor;
					ppEffectDestroy ppGrain;
					obj cameraEffect ['TERMINATE', 'BACK'];
					camDestroy cam;
					obj = nil;
					cam = nil;
					ppColor = nil;
					ppGrain = nil;
					
					['menu'] call ica_fnc_camaras;
				}; false"
			];
		};
	};
	

	
	//Land_HandyCam_F
	camComisaria1 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camComisaria1 setPosATL [8739.68,7268.96,6.76597];
	camComisaria1 setdir 206;
	[camComisaria1, -17, 0] call BIS_fnc_setpitchbank;
	camComisaria1 enableSimulation false;
	
	camComisaria2 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camComisaria2 setPosATL [8613.18,7192.9,6.9072];
	camComisaria2 setdir 90;
	[camComisaria2, -21, 0] call BIS_fnc_setpitchbank;
	camComisaria2 enableSimulation false;

	camComisaria3 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camComisaria3 setPosATL [8736.64,7234.32,3.7072];
	camComisaria3 setdir 256;
	[camComisaria3, -30, 0] call BIS_fnc_setpitchbank;
	camComisaria3 enableSimulation false;
	
	camHospital = "pop_camara" createVehicleLocal (getMarkerPos "");
	camHospital setPosATL [8461.68,6493.94,7.49998];
	camHospital setdir 155;
	[camHospital, -13, 0] call BIS_fnc_setpitchbank;
	camHospital enableSimulation false;
	
	camAlcalde1 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camAlcalde1 setPosATL [8012.09,5317.61,11.0072];
	camAlcalde1 setdir 352;
	[camAlcalde1, -17, 0] call BIS_fnc_setpitchbank;
	camAlcalde1 enableSimulation false;
	
	camAlcalde2 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camAlcalde2 setPosATL [7982.55,5394.73,2.61007];
	camAlcalde2 setdir 188;
	[camAlcalde2, -18, 0] call BIS_fnc_setpitchbank;
	camAlcalde2 enableSimulation false;
	
	camGaraje = "pop_camara" createVehicleLocal (getMarkerPos "");
	camGaraje setPosATL [8607.15,6684.81,24.5];
	camGaraje setdir 255;
	[camGaraje, -25, 0] call BIS_fnc_setpitchbank;
	camGaraje enableSimulation false;
	
	camJoyeria = "pop_camara" createVehicleLocal (getMarkerPos "");
	camJoyeria setPosATL [8752.36,6818.2,13.6771];
	camJoyeria setdir 193;
	[camJoyeria, -22, 0] call BIS_fnc_setpitchbank;
	camJoyeria enableSimulation false;
	
	camAlmacen1 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camAlmacen1 setPosATL [5160.77,2908.28,28.6925];
	camAlmacen1 setdir 10;
	[camAlmacen1, -33, 0] call BIS_fnc_setpitchbank;
	camAlmacen1 enableSimulation false;
	
	camAlmacen2 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camAlmacen2 setPosATL [8659.97,8238.85,31.4266];
	camAlmacen2 setdir 268;
	[camAlmacen2, -38, 0] call BIS_fnc_setpitchbank;
	camAlmacen2 enableSimulation false;
	
	camConcesionario = "pop_camara" createVehicleLocal (getMarkerPos "");
	camConcesionario setPosATL [8589.17,6726.6,8.3266];
	camConcesionario setdir 284;
	[camConcesionario, -19, 0] call BIS_fnc_setpitchbank;
	camConcesionario enableSimulation false;
	
	camSubastalia1 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camSubastalia1 setPosATL [4105.67,4870.34,31.5343];
	camSubastalia1 setdir 208;
	[camSubastalia1, -41, 0] call BIS_fnc_setpitchbank;
	camSubastalia1 enableSimulation false;
	
	camSubastalia2 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camSubastalia2 setPosATL [4137.16,4792.31,17.3769];
	camSubastalia2 setdir 358;
	[camSubastalia2, -28, 0] call BIS_fnc_setpitchbank;
	camSubastalia2 enableSimulation false;
	
	camSubastalia3 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camSubastalia3 setPosATL [4162.1,5006.53,9.5583];
	camSubastalia3 setdir 238;
	[camSubastalia3, -26, 0] call BIS_fnc_setpitchbank;
	camSubastalia3 enableSimulation false;
	
	camPlataforma1 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camPlataforma1 enableSimulation false;
	camPlataforma1 = "camera" camCreate (getposATL camPlataforma1);
	camPlataforma1 setPosASL [6256.72,3656.01,31.5583];
	camPlataforma1 setdir 305;
	[camPlataforma1, -24, 0] call BIS_fnc_setpitchbank;

	camPlataforma2 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camPlataforma2 enableSimulation false;
	camPlataforma2 = "camera" camCreate (getposATL camPlataforma2);
	camPlataforma2 setPosASL [6168.93,3822.81,31.5583];
	camPlataforma2 setdir 235;
	[camPlataforma2, -29, 0] call BIS_fnc_setpitchbank;
	
	camCorazol1 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camCorazol1 setPosATL [8532.19,6765.19,11.1];
	camCorazol1 setdir 52;
	[camCorazol1, -17, 0] call BIS_fnc_setpitchbank;
	camCorazol1 enableSimulation false;
	
	camCorazol2 = "pop_camara" createVehicleLocal (getMarkerPos "");
	camCorazol2 enableSimulation false;	
	camCorazol2 = "camera" camCreate (getposATL camCorazol2);
	camCorazol2 setPosATL [8552.69,6684.75,7.2583];
	camCorazol2 setdir 173;
	[camCorazol2, -18, 0] call BIS_fnc_setpitchbank;
	
	
	systemChat "Cámaras cargadas";
};

if (_param isEqualTo "menu") exitWith {
	if (!isNil {DDoS}) exitWith {hint "Parece que no funciona..."};
	if !(("inf" call ica_fnc_expToLevel) >= 2) exitWith {hint "Si no sabes, no toques."};

	disableSerialization;
	createDialog "camaras";
	_ui = uiNameSpace getVariable "camaras";
	_lista = (_ui displayCtrl 5063);	
	_lista ctrlSetEventHandler ["LBSelChanged", "['sel', ((uiNameSpace getVariable 'camaras') displayCtrl 5063) lbData (lbCurSel 5063)] call ica_fnc_camaras; "];
	
	_nom = ["Comisaría 1", "Comisaría 2", "Comisaría 3", "Hospital", "Alcalde 1", "Alcalde 2", "Garaje", "Joyería", "Almacén 1", "Almacén 2", "Concesionario", "Subastalia 1", "Subastalia 2", "Subastalia 3", "Plataforma petrolífera 1", "Plataforma petrolífera 2", "Lakeside 1", "Lakeside 2", "Salir"];
	_data = ["camComisaria1", "camComisaria2", "camComisaria3", "camHospital", "camAlcalde1", "camAlcalde2", "camGaraje", "camJoyeria", "camAlmacen1", "camAlmacen2", "camConcesionario", "camSubastalia1", "camSubastalia2", "camSubastalia3", "camPlataforma1", "camPlataforma2", "camCorazol1", "camCorazol2", ""];
	
	lbClear _lista;
	_idx = 0;
	while {_idx < (count _nom)} do { // pongo en la lista las ramas
		_lista lbAdd (_nom select _idx);
		_lista lbSetData [_idx, _data select _idx];
		_idx = _idx + 1;
	};
	_lista lbSetColor [(count _nom) - 1, [1, 0.2, 0.2, 1]]; // rojo
};

if (_param isEqualTo "sel") exitWith {
	_obj = missionNamespace getVariable (_this select 1);
	
	if (!isNil {_obj}) then {
		[_obj] call ica_fnc_verCam;
		closeDialog 0;
	} else {
		closeDialog 0;
		closeDialog 0;
	};
};
