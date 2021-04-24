//////////////////////////////////////////////////////////////////////////////
//																			//
//		           		  		DESOLATION						     		//
//                 		    by Icaruk & nerkaid								//
//		                                                      			    //
//		   If you want to use our code or part of it coctact us at:         //
//	 	Si quieres usar nuestro código o parte del mismo contáctanos en:	//
//                    Email: desolation@nerkaid.com							//
//                    Web: http://www.npgclan.com							//
//															                //
//////////////////////////////////////////////////////////////////////////////

/*
Script de la misión Desolation creado por Icaruk

Función:
En el server:
	[] execVM "ica\spawner\creaRegalo.sqf";
Spawnear caja de forma personalizada:
	["todo", "randompos", 50, true] execVM "ica\spawner\creaRegalo.sqf";
*/
_tipo = _this select 0; // "municion", "armas", "equipamiento" o "todo"

if (isNil {_tipo}) exitWith {
	while {true} do {
		sleep (60 * 45);
		["todo", "randompos", 600, true] spawn ica_fnc_crearegalo;
	};
};

_posicion = _this select 1; // "randompos" o manual, manual tiene que ser getPos
_altura = _this select 2; // numero, si es > 20 crea paraca
_humo = _this select 3; // bool

private ["_tipo", "_posicion"];


if ((typeName _posicion) == "ARRAY") then {
	_str = format ["Caja de suministros detectada en %1", mapGridPosition _posicion];
	[10, "Aviso", [1,0,0], 1.5, _str, [1,1,1], 1] remoteexec ["ica_fnc_anuncio",Civilian];

} else {
	if (_posicion == "randompos") then {

		_posicion = [
			[7213.75,5319.67,0.00192595],[7213.75,5319.67,0.00321674],[5677.12,4481.23,0.0018158],[5906.74,4741.8,0.0014801],
			[776.156,5285.96,0.00201416],[499.727,7030.55,0.00192261],[587.692,7662.19,0.00157166],[1140.06,9336.37,0.00216675],
			[664.766,9826.52,0.0010376],[2567.81,8938.82,0.00230408]
		] call BIS_fnc_selectRandom;

		// _posicion = [[8569.62,6653.39,0.00144196], [8569.62,6653.39,0.00144196]] call BIS_fnc_selectRandom;

		_str = format ["Caja de suministros detectada en %1", mapGridPosition _posicion];
		[10, "Aviso", [1,0,0], 1.5, _str, [1,1,1], 1] remoteexec ["ica_fnc_anuncio",Civilian];
	};
};


/*
	Helicoptero dropea by nerkaid
*/

_md = 0;			// Menu de desarrollador
_altura = 600; 		// Altura de vuelo
_vel = 160;			// Velocidad de vuelo
_existencia = 100; 	// Tiempo de existencia

// Creamos helicóptero inmune a 10000 metros al norte de la base, con rumbo sur y el motor encendido (no tiene piloto si quiera)
_pos = _posicion;
_temphel = createVehicle ["I_Heli_Transport_02_F", [_pos select 0, (_pos select 1) + 4000, _altura], [], 0, "FLY"];
_temphel setDir 180;
_temphel allowDamage false;

// Spawneamos para manejo independiente
[_temphel,_altura, _existencia,_vel,_md, _pos] spawn {

	// Recogemos variables
	_temphel = _this select 0;
	_altura = _this select 1;
	_existencia = _this select 2;
	_vel = _this select 3;
	_md = _this select 4;
	_pos = _this select 5;

	// Generamos variables
	_dir = direction _temphel;
	_velveh = velocity _temphel;

	// Establecemos velocidad del helicóptero según su direcicón.
	_temphel setVelocity [(_velveh select 0)+(sin _dir*_vel),(_velveh select 1)+(cos _dir*_vel),0];


	// Debug
	if (_md == 1) then {
		hinteaDrop = _temphel;
	};

	// Mientras no se hayan completado los segundos de existencia
	_cont = 0;
	while {_cont < (_existencia)} do {

		// Debug
		if (_md == 1) then {
			if (hinteaDrop == _temphel) then {
				hint format ["DROP\n\nDistancia hasta objetivo: %1\n\nAltura de vuelo: %2", (_temphel distance _pos), (getPos _temphel) select 2];
			};
		};

		// Mientras el helicóptero vuela, si su altura es menor a la establecida lo impulsamos 6 hacia arriba manteniendo la velocidad inicial.
		if ((getPos _temphel select 2) < _altura) then {
			_temphel setVelocity [(_velveh select 0)+(sin _dir*_vel),(_velveh select 1)+(cos _dir*_vel),6];
		};

		// Si va muy bajo a tope parriba!
		if ((getPos _temphel select 2) < 100) then {
			_temphel setVelocity [(_velveh select 0)+(sin _dir*_vel),(_velveh select 1)+(cos _dir*_vel),30];
		};

		sleep 1;
		_cont = _cont + 1;

	};

	// Cuando se acaban borramos el helicóptero
	deleteVehicle _temphel;

};

// Establecemos distancia a la que se soltará el objeto y esperamos a que la distancia sea menor
_randomDistancia = 150 + (random 100);
waitUntil {((_temphel distance _pos) < (_altura + _randomDistancia))};

// Creamos la caja
_poscaja = getPos _temphel;
_caja = "B_CargoNet_01_ammo_F" createVehicle _poscaja;
// [[_caja, ["<t color=""#FFBF00"" size='1' shadow='1'>" +"Buscar componentes electrónicos",'call FNC_Mineria;', "", 7,false,true,"",""]], "ica_fnc_meteAccion", true, true] spawn BIS_fnc_MP;

[_caja, ["<t color=""#FFBF00"" size='1' shadow='1'>" +"Buscar componentes electrónicos",' ["componentes"] execVM "ica\spawner\busca.sqf"; ', "", 7,false,true,"",""]] remoteexeccall ["ica_fnc_meteAccion",-2,true];
_caja setPos _poscaja;
_caja setVariable ["componentes", 3, true];

// Generamos variables
_dir = direction _temphel;
_velveh = velocity _temphel;
_vel = 10;
sleep 0.1;

// Aceleramos la caja a 10 km/h durante 2.6 segundos
_caja setVelocity [(_velveh select 0)+(sin _dir*_vel),(_velveh select 1)+(cos _dir*_vel),1];
sleep 2;

// Creamos paracaidas y lo attacheamos a la caja
_para = createvehicle ["B_Parachute_02_F", (getPos _caja), [], 0, "NONE"];
_para attachTo [_caja, [0, 0, -3]];
sleep 2.5;

// Una vez se despliega atacheamos la caja
detach _para;
_caja attachTo [_para, [0, 0, -3]];

/*
	Fin Script Nerk
*/



waitUntil {((getPosATL _caja select 2) <= 10)};
detach _caja;

[_caja, (60*15)] call ica_fnc_borrame;
[_para, (60*15)] call ica_fnc_borrame;

if (!isNil {_humo}) then { // si quieres humo, pues sale humo

	while {true} do { // espero a que está cerca del suelo
		if ((getPos _caja select 2) < 20) exitWith {};
		sleep 1;
	};

	_smoke = "SmokeShellGreen" createVehicle [(getPos _caja select 0) + 1, getPos _caja select 1, (getPos _caja select 2) + 0.5];

};

clearWeaponCargoGlobal _caja; // vacío la caja
clearMagazineCargoGlobal _caja;
clearBackpackCargoGlobal _caja;
clearItemCargoGlobal _caja;


if (_tipo == "todo") then {


	// Relleno armas
	_arma = [
		"RH_m9"
	];

	_Aespecial = [
		"RH_fnp45t",
		"RH_gsh18"
	];
	_Amilitar = [
		"hgun_Pistol_heavy_02_F"
	];

	_caja addWeaponCargoGlobal [_arma select (round (random (count _arma))), 0 + (floor (random 2))];
	_caja addWeaponCargoGlobal [_arma select (round (random (count _arma))), 0 + (floor (random 2))];
	_caja addWeaponCargoGlobal [_Aespecial select (round (random (count _Aespecial))), 0 + (floor (random 2))];
	_caja addWeaponCargoGlobal [_Amilitar select (round (random (count _Amilitar))), 0 + (floor (random 2))];

	_armasCaja = ((getWeaponCargo _caja) select 0);
	{
		_muni = getArray (configFile >> "CfgWeapons" >> _x >> "Magazines");
		if ((floor (random 100)) < 10) then {
			_caja addMagazineCargoGlobal [_muni select (round (random (count _muni))), 1];
		};
	} forEach _armasCaja;

	// Relleno equipamiento
	_mochila = [
		"B_Carryall_ocamo",
		"B_Carryall_oucamo",
		"B_Carryall_mcamo",
		"B_Carryall_oli",
		"B_Carryall_khk",
		"B_Carryall_cbr"
	];
	_chaleco = [
		"V_Rangemaster_belt",
		"V_Rangemaster_belt",
		"V_Rangemaster_belt",
		"V_Rangemaster_belt",
		"V_TacVest_camo",
		"V_TacVest_camo",
		"V_TacVest_camo",
		"V_TacVest_camo"
	];
	_ropa = [
		"Trixie_Ghillie_Uniform_01",
		"cl3_Suit_white_black_black",
		"cl3_Suit_white_black_black",
		"cl3_Suit_white_black_black",
		"cl3_Wetsuit_skin_camo",
		"cl3_Wetsuit_skin_camo",
		"cl3_Wetsuit_skin_camo",
		"U_I_G_resistanceLeader_F",
		"U_I_G_resistanceLeader_F",
		"U_I_G_resistanceLeader_F",
		"U_BG_Guerilla1_1",
		"U_BG_Guerilla1_1",
		"U_BG_Guerilla1_1"
	];
	_casco = [
		"H_ShemagOpen_khk",
		"H_Shemag_olive",
		"H_ShemagOpen_tan",
		"H_Booniehat_dgtl",
		"H_HelmetB_camo",
		"H_CrewHelmetHeli_B",
		"A3L_gangster_hat",
		"A3L_Balaclava",
		"G_Balaclava_blk",
		"G_Balaclava_combat",
		"A3L_PaintBallHelmet_red"
	];
	_item = ["ToolKit"];

	_caja addItemCargoGlobal [_mochila select (round (random (count _mochila))), 1 + (floor (random 1))];
	_caja addItemCargoGlobal [_chaleco select (round (random (count _chaleco))), 1 + (floor (random 1))];
	_caja addItemCargoGlobal [_ropa select (round (random (count _ropa))), 2 + (floor (random 2))];
	_caja addItemCargoGlobal [_casco select (round (random (count _casco))), 2 + (floor (random 2))];
	_caja addItemCargoGlobal [_item select (round (random (count _item))), 2 + (floor (random 4))];
};

