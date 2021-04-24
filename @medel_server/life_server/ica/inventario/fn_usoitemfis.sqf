
/*
por: Icaruk

*/

private "_item";

_class = toLower (_this select 0);
_visual = toLower (_this select 1);

_item = if (_class == "") then {_visual} else {_class};
if (isNil {_item}) exitWith {};

// hint format ["%1 (%2) \n\n %3 (%4)", _class, typeName _class, _visual, typeName _visual];
// hint str _item;

switch (_item) do {
	case "pop_pociondeparkour": {closeDialog 0; 0 spawn ica_fnc_hab_pocionDeParkour; _item spawn {sleep 0.1; player removeItem _this};};
	case "pop_pociondeinvis": {closeDialog 0; puedodisparar = nil; ["preparo"] call ica_fnc_hab_pocionDeInvis; _item spawn {sleep 0.1; player removeItem _this};};
	case "pop_molotov": {closeDialog 0; 0 spawn ica_fnc_hab_molotov; _item spawn {sleep 0.1; player removeItem _this};};

	case "pop_note": {closeDialog 0; ["menu"] call ica_fnc_mensajesica};
	case "pop_nokia": {closeDialog 0; ["menu"] call ica_fnc_mensajesica};
	case "pop_iphone": {closeDialog 0; ["menu"] call ica_fnc_mensajesica};
	case "pop_portatil": {
		closeDialog 0;
		if !(("inf" call ica_fnc_expTolevel) >= 4) exitWith {hint "Si no sabes, no toques"};
		if (!isNil {accHacker}) then {player removeAction accHacker};
		if (!isNil {accHacker2}) then {player removeAction accHacker2};

		accHacker = player addAction ["Cámaras de seguridad", "
			player removeAction accHacker; player removeAction accHacker2; ['menu'] call ica_fnc_camaras;
		"];
		accHacker2 = player addAction ["Contactar con el hacker", "
			player removeAction accHacker; player removeAction accHacker2; ['menu', true] call ica_fnc_hacker;
		"];
	};

	// comida
	case "pop_p_barbacoa": {["como",40,_item] call ica_fnc_comoBebo};   // antes 20
	case "pop_p_clasica": {["como",40,_item] call ica_fnc_comoBebo};    // antes 20
	case "pop_p_oliva": {["como",40,_item] call ica_fnc_comoBebo};      // antes 20
	case "pop_p_originales": {["como",40,_item] call ica_fnc_comoBebo}; // antes 20
	case "pop_p_queso": {["como",40,_item] call ica_fnc_comoBebo};      // antes 20
	case "pop_g_ahoy": {["como",30,_item] call ica_fnc_comoBebo};       // antes 15
	case "pop_g_chocolate": {["como",50,_item] call ica_fnc_comoBebo};  // antes 15
	case "pop_g_oreo": {["como",30,_item] call ica_fnc_comoBebo};       // antes 15
	case "pop_pringles": {["como",30,_item] call ica_fnc_comoBebo};     // antes 15
	case "pop_h_fresa": {["todo",15,_item] call ica_fnc_comoBebo};      // antes 10
	case "pop_h_vainilla": {["todo",15,_item] call ica_fnc_comoBebo};   // antes 10
	case "pop_h_napolitana": {["como",20,_item] call ica_fnc_comoBebo}; // antes 10
	case "pop_r_pepsi": {["bebo",30,_item] call ica_fnc_comoBebo};      // antes 15
	case "pop_r_naranja": {["bebo",30,_item] call ica_fnc_comoBebo};    // antes 15
	case "pop_r_7up": {["bebo",30,_item] call ica_fnc_comoBebo};        // antes 15
	case "pop_r_superstar": {["bebo",40,_item] call ica_fnc_comoBebo};  // antes 20
	case "pop_r_monster": {["bebo",40,_item] call ica_fnc_comoBebo};    // antes 20
	case "pop_r_pepper": {["bebo",40,_item] call ica_fnc_comoBebo};     // antes 20
	case "pop_apple": {["todo",20,_item] call ica_fnc_comoBebo};        // antes 15
	case "pop_banana": {["todo",20,_item] call ica_fnc_comoBebo};       // antes 15
	case "pop_kiwi": {["todo",25,_item] call ica_fnc_comoBebo; };         // antes 15
	case "pop_tostada": {["como",15,_item] call ica_fnc_comoBebo};      // antes 20
	case "pop_pizza": {["como",60,_item] call ica_fnc_comoBebo};        // antes 30
	case "pop_cheseburge": {["como",60,_item] call ica_fnc_comoBebo};   // antes 30
	case "pop_pistacho": {["como",30,_item] call ica_fnc_comoBebo};     // antes 15

	// semillas
	case "pop_rabano_s": {estoyPlantando = "rabano"};
	case "pop_bamboo_s": {estoyPlantando = "bamboo"};
	case "pop_algodon_s": {estoyPlantando = "algodon"};
	case "pop_maiz_s": {estoyPlantando = "maiz"};
	case "pop_trigo_s": {estoyPlantando = "trigo"};
	case "pop_cannabis_s": {estoyPlantando = "cannabis"};
	case "pop_girasol_s": {estoyPlantando = "girasol"};

	case "pop_combustible":{_coche = (nearestObjects [player,["car"],3] select 0);_coche setfuel ((fuel _coche) + 0.25);["pop_combustible", -1] call ica_fnc_item};

	// armarios
	case "pop_armariop": {[_item] call life_fnc_storageBox;};
	case "pop_armariog": {[_item] call life_fnc_storageBox;};
	
	case "pop_taladro": {[] spawn ica_fnc_bancoheist;};

	// objetos controles
	case "pop_tetrapodo_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_tetrapodo"] spawn ica_fnc_objetos_poner;};};
	case "pop_tetrapodo_x3_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_tetrapodo_x3"] spawn ica_fnc_objetos_poner;};};
	case "pop_tetrapodo_x5_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_tetrapodo_x5"] spawn ica_fnc_objetos_poner;};};
	case "pop_tetrapodo_x7_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_tetrapodo_x7"] spawn ica_fnc_objetos_poner;};};
	case "pop_electroflare_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_electroflare"] spawn ica_fnc_objetos_poner;};};
	case "pop_banda_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_banda"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_alcoholemiagc_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_alcoholemiagc"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_control_policia_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_control_policia"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_izquierda_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_izquierda"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_derecha_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_derecha"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_stop_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_stop"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_estrechamiento_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_estrechamiento"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_velocidad20_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_velocidad20"] spawn ica_fnc_objetos_poner;};};
	case "pop_senal_velocidad40_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_senal_velocidad40"] spawn ica_fnc_objetos_poner;};};
	case "pop_bandaclavos_i": {if (isNil {war_colocar_objeto}) exitWith {closeDialog 0;["POP_BandaClavos"] spawn ica_fnc_objetos_poner;};};

};
