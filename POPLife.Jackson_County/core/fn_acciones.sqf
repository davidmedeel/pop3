
//NPC_POP_2 addAction ["La Empresa -> Entregar Drogas <-",' ["entregar"] call ica_fnc_FarmeoDrogas;', "", 9,false,true,"",""];
//NPC_POP_2 addAction ["La Empresa -> Entregar Armas <-",' ["entregar"] call ica_fnc_FarmeoArmas;', "", 9,false,true,"",""];
//NPC_POP_2 addAction ["La Empresa -> Entregar Organos <-",' ["entregar"] call ica_fnc_FarmeoOrganos;', "", 9,false,true,"",""];

//NPC_POP_3 addAction ["La Empresa -> Recoger Drogas <-",' ["recojer"] spawn ica_fnc_FarmeoDrogas;', "", 9,false,true,"",""];
//NPC_POP_4 addAction ["La Empresa -> Recoger Armas <-",' ["recojer"] call ica_fnc_FarmeoArmas;', "", 9,false,true,"",""];
//NPC_POP_7 addAction ["La Empresa -> Recoger Organos <-",' ["recojer"] call ica_fnc_FarmeoOrganos;', "", 9,false,true,"",""];

//NPC_POP_5 addAction ["Solicitar trabajo en Fumigaciones Gato Volador", { ["solicito"] spawn ica_fnc_FarmeoFumigador;}];
//NPC_POP_5 addAction ["Devolver avioneta a Fumigaciones Gato Volador", { ["fianza"] spawn ica_fnc_FarmeoFumigador;}];
//NPC_POP_5 addAction ["Cobrar paga de fumigador", { ["cobrarTrabajo"] spawn ica_fnc_FarmeoFumigador;}];

//NPC_POP_6 addAction ["Solicitar tractor al ayuntamiento", { ["solicito"] spawn ica_fnc_FarmeoTractor;}];
//NPC_POP_6 addAction ["Devolver tractor al ayuntamiento", { ["fianza"] spawn ica_fnc_FarmeoTractor;}];
//NPC_POP_6 addAction ["Cobrar paga de trabajador", { ["cobrarTrabajo"] spawn ica_fnc_FarmeoTractor;}];
zonas_mafia addaction [format ["Atacar mafia %1",

										"Ralomni A Yov Em" //NOMBRE DE LA MAFIA MORRISON
										],{[
										1,		//MAFIA MORRISON
										358		//ID MAFIA MORRISON
										
										] spawn ica_fnc_zonamafia}]; //Mafia 1
										
zonas_mafia addaction [format ["Atacar mafia %1",

										"Bratva" //NOMBRE DE LA MAFIA JEFFERSON
										],{[
										2,		//MAFIA JEFFERSON
										313		//ID MAFIA JEFFERSON
										
										] spawn ica_fnc_zonamafia}]; //Mafia 2
zonas_mafia addaction [format ["Atacar mafia %1",

										"Cartel de los Diablos" //NOMBRE DE LA MAFIA NEW HAVEN
										],{[
										3,		//MAFIA NEW HAVEN
										325		//ID MAFIA NEW HAVEN
										
										] spawn ica_fnc_zonamafia}]; //Mafia 3
										
zonas_mafia addaction [format ["Atacar mafia %1",

										"Campesinos" //NOMBRE DE LA MAFIA OJUELA
										],{[
										4,		//MAFIA OJUELA
										365		//ID MAFIA OJUELA
										] spawn ica_fnc_zonamafia}]; //Mafia 4
										
zonas_mafia addaction [format ["Atacar mafia %1",

										"Costello" //NOMBRE DE LA MAFIA DIABLO
										],{[
										5,		//MAFIA DIABLO
										349		//ID MAFIA DIABLO
										
										] spawn ica_fnc_zonamafia}]; //Mafia 5
										
NPC_POP_10 addAction ["Comprar caña de pescar (3000$)", {if(isNil(primaryWeapon player)AND medel_din >= 3000) then{medel_din=medel_din-3000;player addWeapon "cl_fishing_rod";}else{hint"Necesitas tener las manos desocupadas y tener dinero suficiente";}}];
/*

NPC_POP_ROBO1 addAction ["Robar banco central",' ["abrir"] call ica_fnc_robobanco;', "", 9,false,true,"",""];
NPC_POP_ROBO2 addAction ["Cojer dinero",' ["cojedinero"] call ica_fnc_robobanco;', "", 9,false,true,"",""];


NPC_POP_CURAME addAction ["Curame EMS PorFavor",' ["ini"] call ica_fnc_curame;', "", 9,false,true,"",""];
NPC_POP_CURAME1 addAction ["Curame EMS PorFavor",' ["ini"] call ica_fnc_curame;', "", 9,false,true,"",""];
NPC_POP_CURAME2 addAction ["Curame EMS PorFavor",' ["ini"] call ica_fnc_curame;', "", 9,false,true,"",""];
*/
//NPC_POP_11 addAction ["Recoger Paquetes",' ["recojer"] spawn ica_fnc_FarmeoCorreos;', "", 9,false,true,"",""];
//NPC_POP_12 addAction ["Entregar Paquetes",' ["entregar"] spawn ica_fnc_FarmeoCorreos;', "", 9,false,true,"",""];

///NPC_POP_8 addAction["Solitar taxi al ayuntamiento 5000€ - Ganancia: 15000€",ica_fnc_FarmeoTaxi];

//NPC_POP_9 addAction["Solitar autobus al ayuntamiento 10000€ - Ganancia: 20000€",ica_fnc_FarmeoBus];

//NPC_POP_DONADOR addAction ["Tienda de armas donadores",' ["menu"] call ica_fnc_tiendaDonador;', "", 9,false,true,"",""];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////