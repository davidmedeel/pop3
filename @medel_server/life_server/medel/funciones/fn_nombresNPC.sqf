
/*
por: Medel
*/

_param = param [0];

if (_param isEqualTo "Init") exitWith {

	addMissionEventHandler ["Draw3D", 
	{
	if (Tractores distance player > 10) exitWith {};
	if ([Tractores, "VIEW", player] checkVisibility [eyePos Tractores, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Tractores vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRACTORES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Basuras_Morrison distance player > 10) exitWith {};
	if ([Basuras_Morrison, "VIEW", player] checkVisibility [eyePos Basuras_Morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Basuras_Morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FARMEO DE BASURERO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mcdonalds_morrison distance player > 10) exitWith {};
	if ([mcdonalds_morrison, "VIEW", player] checkVisibility [eyePos mcdonalds_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mcdonalds_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MC DONALDS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (verizon_morrison distance player > 10) exitWith {};
	if ([verizon_morrison, "VIEW", player] checkVisibility [eyePos verizon_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition verizon_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VERIZON", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (atm_1 distance player > 10) exitWith {};
	if ([atm_1, "VIEW", player] checkVisibility [eyePos atm_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (camiones_morrison distance player > 10) exitWith {};
	if ([camiones_morrison, "VIEW", player] checkVisibility [eyePos camiones_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition camiones_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE CAMIONES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (concesionario_morrison distance player > 10) exitWith {};
	if ([concesionario_morrison, "VIEW", player] checkVisibility [eyePos concesionario_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition concesionario_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CONCESIONARIO DE LUJO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (obras2 distance player > 10) exitWith {};
	if ([obras2, "VIEW", player] checkVisibility [eyePos obras2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition obras2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "OBRAS PÚBLICAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (zara_morrison distance player > 10) exitWith {};
	if ([zara_morrison, "VIEW", player] checkVisibility [eyePos zara_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition zara_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZARA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (medico_1_morrison distance player > 10) exitWith {};
	if ([medico_1_morrison, "VIEW", player] checkVisibility [eyePos medico_1_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition medico_1_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MÉDICO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (medico_2_morrison distance player > 10) exitWith {};
	if ([medico_2_morrison, "VIEW", player] checkVisibility [eyePos medico_2_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition medico_2_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MÉDICO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (medico_3_morrison distance player > 10) exitWith {};
	if ([medico_3_morrison, "VIEW", player] checkVisibility [eyePos medico_3_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition medico_3_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MÉDICO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_2 distance player > 10) exitWith {};
	if ([atm_2, "VIEW", player] checkVisibility [eyePos atm_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_3 distance player > 10) exitWith {};
	if ([atm_3, "VIEW", player] checkVisibility [eyePos atm_3, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_morrison distance player > 10) exitWith {};
	if ([garaje_morrison, "VIEW", player] checkVisibility [eyePos garaje_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (licencias_morrison distance player > 10) exitWith {};
	if ([licencias_morrison, "VIEW", player] checkVisibility [eyePos licencias_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition licencias_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "REGISTRO DE LICENCIAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_morrison distance player > 10) exitWith {};
	if ([gasolinera_morrison, "VIEW", player] checkVisibility [eyePos gasolinera_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (marcos distance player > 10) exitWith {};
	if ([marcos, "VIEW", player] checkVisibility [eyePos marcos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition marcos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MARCOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (campolicia4 distance player > 10) exitWith {};
	if ([campolicia4, "VIEW", player] checkVisibility [eyePos campolicia4, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition campolicia4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_1_morrison distance player > 10) exitWith {};
	if ([policia_1_morrison, "VIEW", player] checkVisibility [eyePos policia_1_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_1_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_4 distance player > 10) exitWith {};
	if ([atm_4, "VIEW", player] checkVisibility [eyePos atm_4, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_2_morrison distance player > 10) exitWith {};
	if ([policia_2_morrison, "VIEW", player] checkVisibility [eyePos policia_2_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_2_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA POLICIAL", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_3_morrison distance player > 10) exitWith {};
	if ([policia_3_morrison, "VIEW", player] checkVisibility [eyePos policia_3_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_3_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS POLICIALES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_4_morrison distance player > 10) exitWith {};
	if ([policia_4_morrison, "VIEW", player] checkVisibility [eyePos policia_4_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_4_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "HELICÓPTEROS POLICIALES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_5 distance player > 10) exitWith {};
	if ([atm_5, "VIEW", player] checkVisibility [eyePos atm_5, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_5 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (carshop1_1_1_2 distance player > 10) exitWith {};
	if ([carshop1_1_1_2, "VIEW", player] checkVisibility [eyePos carshop1_1_1_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition carshop1_1_1_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "DESGUACE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_GASOLINA distance player > 10) exitWith {};
	if ([NPC_GASOLINA, "VIEW", player] checkVisibility [eyePos NPC_GASOLINA, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_GASOLINA vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COMBUSTIBLE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (tioa1 distance player > 10) exitWith {};
	if ([tioa1, "VIEW", player] checkVisibility [eyePos tioa1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tioa1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ALMACÉN", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (semillas_morrison distance player > 10) exitWith {};
	if ([semillas_morrison, "VIEW", player] checkVisibility [eyePos semillas_morrison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition semillas_morrison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE SEMILLAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (camello distance player > 10) exitWith {};
	if ([camello, "VIEW", player] checkVisibility [eyePos camello, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition camello vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CAMELLO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Sucursal distance player > 10) exitWith {};
	if ([Sucursal, "VIEW", player] checkVisibility [eyePos Sucursal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Sucursal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SUCURSAL BANCARIA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (karts_morison distance player > 10) exitWith {};
	if ([karts_morison, "VIEW", player] checkVisibility [eyePos karts_morison, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition karts_morison vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE KARTS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_6 distance player > 10) exitWith {};
	if ([atm_6, "VIEW", player] checkVisibility [eyePos atm_6, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_6 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (descarga_sancristobal distance player > 10) exitWith {};
	if ([descarga_sancristobal, "VIEW", player] checkVisibility [eyePos descarga_sancristobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition descarga_sancristobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "DESCARGA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (licencias_sancristobal distance player > 10) exitWith {};
	if ([licencias_sancristobal, "VIEW", player] checkVisibility [eyePos licencias_sancristobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition licencias_sancristobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "REGISTRO DE LICENCIAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (alimentos_sancristobal distance player > 10) exitWith {};
	if ([alimentos_sancristobal, "VIEW", player] checkVisibility [eyePos alimentos_sancristobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition alimentos_sancristobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ALIMENTOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_sancristobal distance player > 10) exitWith {};
	if ([garaje_sancristobal, "VIEW", player] checkVisibility [eyePos garaje_sancristobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_sancristobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (zara_sancirstobal distance player > 10) exitWith {};
	if ([zara_sancirstobal, "VIEW", player] checkVisibility [eyePos zara_sancirstobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition zara_sancirstobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZARA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (verizon_sancristobal distance player > 10) exitWith {};
	if ([verizon_sancristobal, "VIEW", player] checkVisibility [eyePos verizon_sancristobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition verizon_sancristobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VERIZON", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_7 distance player > 10) exitWith {};
	if ([atm_7, "VIEW", player] checkVisibility [eyePos atm_7, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_7 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Nuclear distance player > 10) exitWith {};
	if ([Nuclear, "VIEW", player] checkVisibility [eyePos Nuclear, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Nuclear vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CENTRAL NUCLEAR", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_sancristobal distance player > 10) exitWith {};
	if ([gasolinera_sancristobal, "VIEW", player] checkVisibility [eyePos gasolinera_sancristobal, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_sancristobal vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (antonio distance player > 10) exitWith {};
	if ([antonio, "VIEW", player] checkVisibility [eyePos antonio, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition antonio vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ANTONIO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_EMPRESA_COBROS distance player > 10) exitWith {};
	if ([NPC_EMPRESA_COBROS, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_COBROS, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_COBROS vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMPRESA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_1 distance player > 10) exitWith {};
	if ([gasolinera_1, "VIEW", player] checkVisibility [eyePos gasolinera_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (eustaquio distance player > 10) exitWith {};
	if ([eustaquio, "VIEW", player] checkVisibility [eyePos eustaquio, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition eustaquio vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EUSTAQUIO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (traficanteDeDroga1 distance player > 10) exitWith {};
	if ([traficanteDeDroga1, "VIEW", player] checkVisibility [eyePos traficanteDeDroga1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition traficanteDeDroga1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRAFICANTE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mafioso distance player > 10) exitWith {};
	if ([mafioso, "VIEW", player] checkVisibility [eyePos mafioso, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafioso vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MAFIOSO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_8 distance player > 10) exitWith {};
	if ([atm_8, "VIEW", player] checkVisibility [eyePos atm_8, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_8 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Zona_2 distance player > 10) exitWith {};
	if ([Zona_2, "VIEW", player] checkVisibility [eyePos Zona_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Zona_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZONA DE CAPTURA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (descarga_cerros distance player > 10) exitWith {};
	if ([descarga_cerros, "VIEW", player] checkVisibility [eyePos descarga_cerros, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition descarga_cerros vectorAdd [0,0,2.1], 0.2, 0.2, 45, "DESCARGA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_9 distance player > 10) exitWith {};
	if ([atm_9, "VIEW", player] checkVisibility [eyePos atm_9, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_9 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (bruno distance player > 10) exitWith {};
	if ([bruno, "VIEW", player] checkVisibility [eyePos bruno, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition bruno vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BRUNO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Lezo distance player > 10) exitWith {};
	if ([Lezo, "VIEW", player] checkVisibility [eyePos Lezo, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Lezo vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BLAS DE LEZO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (terrorista distance player > 10) exitWith {};
	if ([terrorista, "VIEW", player] checkVisibility [eyePos terrorista, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition terrorista vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TERRORISTA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_10 distance player > 10) exitWith {};
	if ([atm_10, "VIEW", player] checkVisibility [eyePos atm_10, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_10 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_2 distance player > 10) exitWith {};
	if ([gasolinera_2, "VIEW", player] checkVisibility [eyePos gasolinera_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (david distance player > 10) exitWith {};
	if ([david, "VIEW", player] checkVisibility [eyePos david, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition david vectorAdd [0,0,2.1], 0.2, 0.2, 45, "DAVID", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mineria distance player > 10) exitWith {};
	if ([mineria, "VIEW", player] checkVisibility [eyePos mineria, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mineria vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MINERÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (donadores_vehiculos distance player > 10) exitWith {};
	if ([donadores_vehiculos, "VIEW", player] checkVisibility [eyePos ems2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS DONADORES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (npc_pop_donador distance player > 10) exitWith {};
	if ([npc_pop_donador, "VIEW", player] checkVisibility [eyePos npc_pop_donador, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition npc_pop_donador vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE DONADORES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_11 distance player > 10) exitWith {};
	if ([atm_11, "VIEW", player] checkVisibility [eyePos atm_11, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_11 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_donadores distance player > 10) exitWith {};
	if ([garaje_donadores, "VIEW", player] checkVisibility [eyePos garaje_donadores, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_donadores vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Banco distance player > 10) exitWith {};
	if ([Banco, "VIEW", player] checkVisibility [eyePos Banco, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Banco vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BANCO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_barcos distance player > 10) exitWith {};
	if ([garaje_barcos, "VIEW", player] checkVisibility [eyePos garaje_barcos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_barcos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE DE BARCOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Club7 distance player > 10) exitWith {};
	if ([Club7, "VIEW", player] checkVisibility [eyePos Club7, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Club7 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "Club 7", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Manolo distance player > 10) exitWith {};
	if ([Manolo, "VIEW", player] checkVisibility [eyePos Manolo, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Manolo vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MANOLO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (armeria distance player > 10) exitWith {};
	if ([armeria, "VIEW", player] checkVisibility [eyePos armeria, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition armeria vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (pescaderia distance player > 10) exitWith {};
	if ([pescaderia, "VIEW", player] checkVisibility [eyePos pescaderia, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition pescaderia vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PESCADERÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (obras1 distance player > 10) exitWith {};
	if ([obras1, "VIEW", player] checkVisibility [eyePos obras1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition obras1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "OBRAS PÚBLICAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (barcos_policia distance player > 10) exitWith {};
	if ([barcos_policia, "VIEW", player] checkVisibility [eyePos barcos_policia, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition barcos_policia vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BARCOS POLICIALES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (barcos_ems distance player > 10) exitWith {};
	if ([barcos_ems, "VIEW", player] checkVisibility [eyePos barcos_ems, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition barcos_ems vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BARCOS_EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (tienda_barcos distance player > 10) exitWith {};
	if ([tienda_barcos, "VIEW", player] checkVisibility [eyePos tienda_barcos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tienda_barcos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE BARCOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (alimentos distance player > 10) exitWith {};
	if ([alimentos, "VIEW", player] checkVisibility [eyePos alimentos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition alimentos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PROCESADOR DE ALIMENTOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_12 distance player > 10) exitWith {};
	if ([atm_12, "VIEW", player] checkVisibility [eyePos atm_12, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_12 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_POP_10 distance player > 10) exitWith {};
	if ([NPC_POP_10, "VIEW", player] checkVisibility [eyePos NPC_POP_10, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_POP_10 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PESCA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (TiendadeCamiones distance player > 10) exitWith {};
	if ([TiendadeCamiones, "VIEW", player] checkVisibility [eyePos TiendadeCamiones, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition TiendadeCamiones vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE CAMIONES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Farmacia distance player > 10) exitWith {};
	if ([Farmacia, "VIEW", player] checkVisibility [eyePos Farmacia, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Farmacia vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FARMACIA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (semillas_lakeside distance player > 10) exitWith {};
	if ([semillas_lakeside, "VIEW", player] checkVisibility [eyePos semillas_lakeside, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition semillas_lakeside vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE SEMILLAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_POP_9 distance player > 10) exitWith {};
	if ([NPC_POP_9, "VIEW", player] checkVisibility [eyePos NPC_POP_9, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_POP_9 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE AUTOBUSES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (tiendamotos distance player > 10) exitWith {};
	if ([tiendamotos, "VIEW", player] checkVisibility [eyePos tiendamotos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tiendamotos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE MOTOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_POP_8 distance player > 10) exitWith {};
	if ([NPC_POP_8, "VIEW", player] checkVisibility [eyePos NPC_POP_8, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_POP_8 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CONCESIONARIO TAXISTA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (procesador_agua distance player > 10) exitWith {};
	if ([procesador_agua, "VIEW", player] checkVisibility [eyePos procesador_agua, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition procesador_agua vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PROCESADOR DE AGUA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (basuras_lakeside distance player > 10) exitWith {};
	if ([basuras_lakeside, "VIEW", player] checkVisibility [eyePos basuras_lakeside, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition basuras_lakeside vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FARMEO DE BASURERO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (comprador_diamantes distance player > 10) exitWith {};
	if ([comprador_diamantes, "VIEW", player] checkVisibility [eyePos comprador_diamantes, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition comprador_diamantes vectorAdd [0,0,2.1], 0.2, 0.2, 45, "COMPRADOR DE DIAMANTES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_GARAJE_SM distance player > 10) exitWith {};
	if ([NPC_GARAJE_SM, "VIEW", player] checkVisibility [eyePos NPC_GARAJE_SM, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_GARAJE_SM vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_13 distance player > 10) exitWith {};
	if ([atm_13, "VIEW", player] checkVisibility [eyePos atm_13, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_13 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (ems_lakeside_1 distance player > 10) exitWith {};
	if ([ems_lakeside_1, "VIEW", player] checkVisibility [eyePos ems_lakeside_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems_lakeside_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (ems_lakeside_2 distance player > 10) exitWith {};
	if ([ems_lakeside_2, "VIEW", player] checkVisibility [eyePos ems_lakeside_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems_lakeside_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (ems_lakeside_3 distance player > 10) exitWith {};
	if ([ems_lakeside_3, "VIEW", player] checkVisibility [eyePos ems_lakeside_3, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems_lakeside_3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_POP_11 distance player > 10) exitWith {};
	if ([NPC_POP_11, "VIEW", player] checkVisibility [eyePos NPC_POP_11, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_POP_11 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRABAJO CORREOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_4 distance player > 10) exitWith {};
	if ([gasolinera_4, "VIEW", player] checkVisibility [eyePos gasolinera_4, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_14 distance player > 10) exitWith {};
	if ([atm_14, "VIEW", player] checkVisibility [eyePos atm_14, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_14 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (loteria distance player > 10) exitWith {};
	if ([loteria, "VIEW", player] checkVisibility [eyePos loteria, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition loteria vectorAdd [0,0,2.1], 0.2, 0.2, 45, "LOTERÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (concesionario_lujo distance player > 10) exitWith {};
	if ([concesionario_lujo, "VIEW", player] checkVisibility [eyePos concesionario_lujo, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition concesionario_lujo vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CONCESIONARIO DE LUJO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (licencias_lakeside_1 distance player > 10) exitWith {};
	if ([licencias_lakeside_1, "VIEW", player] checkVisibility [eyePos licencias_lakeside_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition licencias_lakeside_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "REGISTRO DE LICENCIAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_lakeside_1 distance player > 10) exitWith {};
	if ([garaje_lakeside_1, "VIEW", player] checkVisibility [eyePos garaje_lakeside_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_lakeside_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_lakeside_2 distance player > 10) exitWith {};
	if ([garaje_lakeside_2, "VIEW", player] checkVisibility [eyePos garaje_lakeside_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_lakeside_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D",
	{
	if (pablo_iglesias distance player > 10) exitWith {};
	if ([pablo_iglesias, "VIEW", player] checkVisibility [eyePos pablo_iglesias, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition pablo_iglesias vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PABLO IGLESIAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_15 distance player > 10) exitWith {};
	if ([atm_15, "VIEW", player] checkVisibility [eyePos atm_15, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_15 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (POPTV distance player > 10) exitWith {};
	if ([POPTV, "VIEW", player] checkVisibility [eyePos POPTV, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition POPTV vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POP TV", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (periodista distance player > 10) exitWith {};
	if ([periodista, "VIEW", player] checkVisibility [eyePos periodista, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition periodista vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PERIODISTA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mc_donalds_1 distance player > 10) exitWith {};
	if ([mc_donalds_1, "VIEW", player] checkVisibility [eyePos mc_donalds_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mc_donalds_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MC DONALDS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Ropa distance player > 10) exitWith {};
	if ([Ropa, "VIEW", player] checkVisibility [eyePos Ropa, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Ropa vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE ROPA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (zara_8 distance player > 10) exitWith {};
	if ([zara_8, "VIEW", player] checkVisibility [eyePos zara_8, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition zara_8 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZARA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (helicopteros_policia distance player > 10) exitWith {};
	if ([helicopteros_policia, "VIEW", player] checkVisibility [eyePos helicopteros_policia, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition helicopteros_policia vectorAdd [0,0,2.1], 0.2, 0.2, 45, "HELICÓPTEROS POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_policia distance player > 10) exitWith {};
	if ([gasolinera_policia, "VIEW", player] checkVisibility [eyePos gasolinera_policia, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_policia vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (vehiculos_policiales distance player > 10) exitWith {};
	if ([vehiculos_policiales, "VIEW", player] checkVisibility [eyePos vehiculos_policiales, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition vehiculos_policiales vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS POLICIALES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_policial distance player > 10) exitWith {};
	if ([garaje_policial, "VIEW", player] checkVisibility [eyePos garaje_policial, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_policial vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_lakeside_1 distance player > 10) exitWith {};
	if ([policia_lakeside_1, "VIEW", player] checkVisibility [eyePos policia_lakeside_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_lakeside_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_lakeside_2 distance player > 10) exitWith {};
	if ([policia_lakeside_2, "VIEW", player] checkVisibility [eyePos policia_lakeside_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_lakeside_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_16 distance player > 10) exitWith {};
	if ([atm_16, "VIEW", player] checkVisibility [eyePos atm_16, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_16 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_lakeside_3 distance player > 10) exitWith {};
	if ([policia_lakeside_3, "VIEW", player] checkVisibility [eyePos policia_lakeside_3, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_lakeside_3 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA POLICIAL", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Autoescuela distance player > 10) exitWith {};
	if ([Autoescuela, "VIEW", player] checkVisibility [eyePos Autoescuela, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Autoescuela vectorAdd [0,0,2.1], 0.2, 0.2, 45, "AUTOESCUELA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_17 distance player > 10) exitWith {};
	if ([atm_17, "VIEW", player] checkVisibility [eyePos atm_17, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_17 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (npcavionetas distance player > 10) exitWith {};
	if ([npcavionetas, "VIEW", player] checkVisibility [eyePos npcavionetas, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition npcavionetas vectorAdd [0,0,2.1], 0.2, 0.2, 45, "FARMEO AVIONETAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (tienda_helicopteros distance player > 10) exitWith {};
	if ([tienda_helicopteros, "VIEW", player] checkVisibility [eyePos tienda_helicopteros, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tienda_helicopteros vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE HELICÓPTEROS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (helicopteros_policiales distance player > 10) exitWith {};
	if ([helicopteros_policiales, "VIEW", player] checkVisibility [eyePos helicopteros_policiales, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition helicopteros_policiales vectorAdd [0,0,2.1], 0.2, 0.2, 45, "HELICÓPTEROS POLICIALES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_helis distance player > 10) exitWith {};
	if ([garaje_helis, "VIEW", player] checkVisibility [eyePos garaje_helis, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_helis vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE DE HELICÓPTEROS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_5 distance player > 10) exitWith {};
	if ([gasolinera_5, "VIEW", player] checkVisibility [eyePos gasolinera_5, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_5 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Paco distance player > 10) exitWith {};
	if ([Paco, "VIEW", player] checkVisibility [eyePos Paco, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Paco vectorAdd [0,0,2.1], 0.2, 0.2, 45, "PACO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mafia4 distance player > 10) exitWith {};
	if ([mafia4, "VIEW", player] checkVisibility [eyePos mafia4, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafia4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA MAFIOSA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_carcel distance player > 10) exitWith {};
	if ([policia_carcel, "VIEW", player] checkVisibility [eyePos policia_carcel, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_carcel vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_19 distance player > 10) exitWith {};
	if ([atm_19, "VIEW", player] checkVisibility [eyePos atm_19, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_19 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_carcel_1 distance player > 10) exitWith {};
	if ([policia_carcel_1, "VIEW", player] checkVisibility [eyePos policia_carcel_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_carcel_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (organos distance player > 10) exitWith {};
	if ([organos, "VIEW", player] checkVisibility [eyePos organos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition organos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CIRUJANO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (traficanteDeDroga2 distance player > 10) exitWith {};
	if ([traficanteDeDroga2, "VIEW", player] checkVisibility [eyePos traficanteDeDroga2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition traficanteDeDroga2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TRAFICANTE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_EMPRESA_1 distance player > 10) exitWith {};
	if ([NPC_EMPRESA_1, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMPRESA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_20 distance player > 10) exitWith {};
	if ([atm_20, "VIEW", player] checkVisibility [eyePos atm_20, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_20 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mafioso_12 distance player > 10) exitWith {};
	if ([mafioso_12, "VIEW", player] checkVisibility [eyePos mafioso_12, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafioso_12 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MAFIOSO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_6 distance player > 10) exitWith {};
	if ([gasolinera_6, "VIEW", player] checkVisibility [eyePos gasolinera_6, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_6 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gustavo distance player > 10) exitWith {};
	if ([gustavo, "VIEW", player] checkVisibility [eyePos camello_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition camello_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GUSTAVO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (venta_organos distance player > 10) exitWith {};
	if ([venta_organos, "VIEW", player] checkVisibility [eyePos venta_organos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition venta_organos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VENTA DE ORGANOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_17 distance player > 10) exitWith {};
	if ([gasolinera_17, "VIEW", player] checkVisibility [eyePos gasolinera_17, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_17 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (concesionario_4x4 distance player > 10) exitWith {};
	if ([concesionario_4x4, "VIEW", player] checkVisibility [eyePos concesionario_4x4, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition concesionario_4x4 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CONCESIONARIO 4x4", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (armeria_diablos distance player > 10) exitWith {};
	if ([armeria_diablos, "VIEW", player] checkVisibility [eyePos armeria_diablos, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition armeria_diablos vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA DIABLOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_12 distance player > 10) exitWith {};
	if ([garaje_12, "VIEW", player] checkVisibility [eyePos garaje_12, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_12 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (blanqueador distance player > 10) exitWith {};
	if ([blanqueador, "VIEW", player] checkVisibility [eyePos blanqueador, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition blanqueador vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BLANQUEADOR", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mario distance player > 10) exitWith {};
	if ([mario, "VIEW", player] checkVisibility [eyePos mario, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mario vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MARIO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_19 distance player > 10) exitWith {};
	if ([gasolinera_19, "VIEW", player] checkVisibility [eyePos gasolinera_19, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_19 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (NPC_EMPRESA_2 distance player > 10) exitWith {};
	if ([NPC_EMPRESA_2, "VIEW", player] checkVisibility [eyePos NPC_EMPRESA_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition NPC_EMPRESA_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMPRESA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (chino distance player > 10) exitWith {};
	if ([chino, "VIEW", player] checkVisibility [eyePos chino, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition chino vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CHINO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (zara_9 distance player > 10) exitWith {};
	if ([zara_9, "VIEW", player] checkVisibility [eyePos zara_9, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition zara_9 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZARA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm9 distance player > 10) exitWith {};
	if ([atm9, "VIEW", player] checkVisibility [eyePos atm9, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm9 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mateo distance player > 10) exitWith {};
	if ([mateo, "VIEW", player] checkVisibility [eyePos mateo, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mateo vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MATEO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (garaje_65 distance player > 10) exitWith {};
	if ([garaje_65, "VIEW", player] checkVisibility [eyePos garaje_65, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition garaje_65 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_43 distance player > 10) exitWith {};
	if ([policia_43, "VIEW", player] checkVisibility [eyePos policia_43, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_43 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "POLICÍA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm43 distance player > 10) exitWith {};
	if ([atm43, "VIEW", player] checkVisibility [eyePos atm43, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm43 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (policia_554 distance player > 10) exitWith {};
	if ([policia_554, "VIEW", player] checkVisibility [eyePos policia_554, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition policia_554 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ARMERIA POLICIAL", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_5435 distance player > 10) exitWith {};
	if ([gasolinera_5435, "VIEW", player] checkVisibility [eyePos gasolinera_5435, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_5435 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Putas distance player > 10) exitWith {};
	if ([Putas, "VIEW", player] checkVisibility [eyePos Putas, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Putas vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CASA DE PUTAS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (ems_55433 distance player > 10) exitWith {};
	if ([ems_55433, "VIEW", player] checkVisibility [eyePos ems_55433, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems_55433 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm64 distance player > 10) exitWith {};
	if ([atm64, "VIEW", player] checkVisibility [eyePos atm64, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm64 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (ems46436 distance player > 10) exitWith {};
	if ([ems46436, "VIEW", player] checkVisibility [eyePos ems46436, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems46436 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (ems4643654 distance player > 10) exitWith {};
	if ([ems4643654, "VIEW", player] checkVisibility [eyePos ems4643654, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition ems4643654 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "EMS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_6465 distance player > 10) exitWith {};
	if ([gasolinera_6465, "VIEW", player] checkVisibility [eyePos gasolinera_6465, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_6465 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm6656 distance player > 10) exitWith {};
	if ([atm6656, "VIEW", player] checkVisibility [eyePos atm6656, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm6656 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (helicopteros_garaje distance player > 10) exitWith {};
	if ([helicopteros_garaje, "VIEW", player] checkVisibility [eyePos helicopteros_garaje, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition helicopteros_garaje vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GARAJE DE HELICÓPTEROS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (tienda_helis_12 distance player > 10) exitWith {};
	if ([tienda_helis_12, "VIEW", player] checkVisibility [eyePos tienda_helis_12, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition tienda_helis_12 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "TIENDA DE HELICÓPTEROS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mafioso_5453 distance player > 10) exitWith {};
	if ([mafioso_5453, "VIEW", player] checkVisibility [eyePos mafioso_5453, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafioso_5453 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MAFIOSO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm545 distance player > 10) exitWith {};
	if ([atm545, "VIEW", player] checkVisibility [eyePos atm545, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm545 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm545544 distance player > 10) exitWith {};
	if ([atm545544, "VIEW", player] checkVisibility [eyePos atm545544, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm545544 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mafioso_4343 distance player > 10) exitWith {};
	if ([mafioso_4343, "VIEW", player] checkVisibility [eyePos mafioso_4343, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafioso_4343 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MAFIOSO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Zona_1 distance player > 10) exitWith {};
	if ([Zona_1, "VIEW", player] checkVisibility [eyePos Zona_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Zona_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ZONA DE CAPTURA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (subastalia_beneficios distance player > 10) exitWith {};
	if ([subastalia_beneficios, "VIEW", player] checkVisibility [eyePos subastalia_beneficios, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition subastalia_beneficios vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BENEFICIOS SUBASTALIA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (subasta_minerales distance player > 10) exitWith {};
	if ([subasta_minerales, "VIEW", player] checkVisibility [eyePos subasta_minerales, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition subasta_minerales vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SUBASTA DE MINERALES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (subasta_almacen2 distance player > 10) exitWith {};
	if ([subasta_almacen2, "VIEW", player] checkVisibility [eyePos subasta_almacen2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition subasta_almacen2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SUBASTA DE ALMACÉN 2", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (subasta_comercios distance player > 10) exitWith {};
	if ([subasta_comercios, "VIEW", player] checkVisibility [eyePos subasta_comercios, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition subasta_comercios vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SUBASTA DE COMERCIOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (subasta_almacen1 distance player > 10) exitWith {};
	if ([subasta_almacen1, "VIEW", player] checkVisibility [eyePos subasta_almacen1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition subasta_almacen1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SUBASTA DE ALMACÉN 1", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (subasta_transportes distance player > 10) exitWith {};
	if ([subasta_transportes, "VIEW", player] checkVisibility [eyePos subasta_transportes, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition subasta_transportes vectorAdd [0,0,2.1], 0.2, 0.2, 45, "SUBASTA DE TRANSPORTES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm54354645 distance player > 10) exitWith {};
	if ([atm54354645, "VIEW", player] checkVisibility [eyePos atm54354645, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm54354645 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (descarga_subastalia distance player > 10) exitWith {};
	if ([descarga_subastalia, "VIEW", player] checkVisibility [eyePos descarga_subastalia, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition descarga_subastalia vectorAdd [0,0,2.1], 0.2, 0.2, 45, "DESCARGA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (manuel distance player > 10) exitWith {};
	if ([manuel, "VIEW", player] checkVisibility [eyePos manuel, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition manuel vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MANUEL", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_64783 distance player > 10) exitWith {};
	if ([gasolinera_64783, "VIEW", player] checkVisibility [eyePos gasolinera_64783, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_64783 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (mafioso_64 distance player > 10) exitWith {};
	if ([mafioso_64, "VIEW", player] checkVisibility [eyePos mafioso_64, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition mafioso_64 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MAFIOSO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm453346 distance player > 10) exitWith {};
	if ([atm453346, "VIEW", player] checkVisibility [eyePos atm453346, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm453346 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (Militar distance player > 10) exitWith {};
	if ([Militar, "VIEW", player] checkVisibility [eyePos Militar, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition Militar vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MILITAR", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (verizon_lakeside distance player > 10) exitWith {};
	if ([verizon_lakeside, "VIEW", player] checkVisibility [eyePos verizon_lakeside, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition verizon_lakeside vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VERIZON", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (concesionario distance player > 10) exitWith {};
	if ([concesionario, "VIEW", player] checkVisibility [eyePos concesionario, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition concesionario vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CONCESIONARIO", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (universidad distance player > 10) exitWith {};
	if ([universidad, "VIEW", player] checkVisibility [eyePos UNIVERSIDAD, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition UNIVERSIDAD vectorAdd [0,0,2.1], 0.2, 0.2, 45, "UNIVERSIDAD", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (militar12 distance player > 10) exitWith {};
	if ([militar12, "VIEW", player] checkVisibility [eyePos militar12, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition militar12 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MILITAR", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (militar12_1 distance player > 10) exitWith {};
	if ([militar12_1, "VIEW", player] checkVisibility [eyePos militar12_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition militar12_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS MILITARES AÉREOS", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (gasolinera_militar distance player > 10) exitWith {};
	if ([gasolinera_militar, "VIEW", player] checkVisibility [eyePos gasolinera_militar, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition gasolinera_militar vectorAdd [0,0,2.1], 0.2, 0.2, 45, "GASOLINERA", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (militar_554 distance player > 10) exitWith {};
	if ([militar_554, "VIEW", player] checkVisibility [eyePos militar_554, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition militar_554 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS MILITARES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (militar12_2 distance player > 10) exitWith {};
	if ([militar12_2, "VIEW", player] checkVisibility [eyePos militar12_2, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition militar12_2 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "VEHÍCULOS MILITARES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (atm_18 distance player > 10) exitWith {};
	if ([atm_18, "VIEW", player] checkVisibility [eyePos atm_18, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition atm_18 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "ATM", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (militar12_354 distance player > 10) exitWith {};
	if ([militar12_354, "VIEW", player] checkVisibility [eyePos militar12_354, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition militar12_354 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "CAZAS MILITARES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (barcos_militar_1 distance player > 10) exitWith {};
	if ([barcos_militar_1, "VIEW", player] checkVisibility [eyePos barcos_militar_1, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition barcos_militar_1 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "BARCOS MILITARES", 2, 0.07, "PuristaMedium"];
	}];

	addMissionEventHandler ["Draw3D", 
	{
	if (militar_555 distance player > 10) exitWith {};
	if ([militar_555, "VIEW", player] checkVisibility [eyePos militar_555, eyePos player] < 0.3) exitWith {};
	drawIcon3D ["", [0.957,0.922,0.259,1], visiblePosition militar_555 vectorAdd [0,0,2.1], 0.2, 0.2, 45, "MILITAR", 2, 0.07, "PuristaMedium"];
	}];
};
