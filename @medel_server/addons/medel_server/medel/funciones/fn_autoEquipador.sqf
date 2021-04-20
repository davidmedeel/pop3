
/*
por: Medel
*/

_param = param [0];

_precio = 5000;

_mensaje = "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente dinero.</t>";

if (_param isEqualTo "menu") exitWith {

	if (playerSide != west) exitWith {hint "Solo hago caso a la policia. ¡Fuera de aqui muerto de hambre!"};

	createDialog "autoEquipador";

	disableSerialization;
};

if (_param isEqualTo "comisarioPrincipalGC") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC3";
	player addVest "PGS_chaleco_antibalas_gc_1";
	player addBackpack "mochila_grande";
	player addHeadgear "H_Beret_Colonel";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "comisarioPrincipalCNP") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_3";
	player addVest "PGS_chaleco_antibalas_cnp_1";
	player addBackpack "mochila_grande";
	player addHeadgear "H_Beret_Colonel";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "comisarioCNP") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_3";
	player addVest "PGS_chaleco_antibalas_cnp_1";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_CNP2";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "comisarioGC") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC3";
	player addVest "PGS_chaleco_antibalas_gc_1";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_GC3";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "jefeSuperior") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_3";
	player addVest "PGS_chaleco_antibalas_cnp_2";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_GC3";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "inspector") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_3";
	player addVest "PGS_chaleco_antibalas_cnp_1";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_GC3";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "subInspector") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_3";
	player addVest "PGS_chaleco_antibalas_cnp_2";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_CNP";
	player addGoggles "G_Aviator";


	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "oficial") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_3";
	player addVest "PGS_chaleco_antibalas_cnp_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_CNP";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "agentesCNP") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_2";
	player addVest "PGS_chaleco_antibalas_cnp_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_CNP";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "agente") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_1";
	player addVest "PGS_chaleco_antibalas_cnp_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_CNP";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "recluta") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "CNP_1";
	player addVest "PGS_chaleco_antibalas_cnp_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_CNP";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "pilotoCNP") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "Ropa_GAP";
	player addVest "GAP_CNP";
	player addBackpack "mochila_grande";
	player addHeadgear "ffaa_casco_famet_crew";
	player addGoggles "TRYK_kio_balaclava_BLK_ear";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "geo") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GEO";
	player addVest "GEO_CHALECO";
	player addBackpack "mochila_grande";
	player addGoggles "TRYK_kio_balaclava_BLK";
	player addHeadgear "H_Orel_Swat";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "uip") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "UIP2";
	//player addVest "v_chaleco_uip";
	player addVest "PGS_chaleco_antibalas_cnp_1";
	player addBackpack "mochila_grande";
	player addHeadgear "CASCO_ANTIDISTURBIOS";
	player addGoggles "TRYK_kio_balaclava_BLK";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "capitan") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC3";
	player addVest "PGS_chaleco_antibalas_gc_1";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "teniente") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC3";
	player addVest "PGS_chaleco_antibalas_gc_2";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "sargento") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC3";
	player addVest "PGS_chaleco_antibalas_gc_2";
	player addBackpack "mochila_grande";
	player addHeadgear "BOINA_GC2";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "cabo") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC3";
	player addVest "PGS_chaleco_antibalas_gc_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "guardias") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC2";
	player addVest "PGS_chaleco_antibalas_gc_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "guardia") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC2";
	player addVest "PGS_chaleco_antibalas_gc_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "cadete") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GC1";
	player addVest "PGS_chaleco_antibalas_gc_2";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";
	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "pilotoGC") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "GAR";
	player addVest "GAP_GC";
	player addBackpack "mochila_grande";
	player addHeadgear "ffaa_casco_famet_crew";
	player addGoggles "TRYK_kio_balaclava_BLK_ear";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";
	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "jefaturaATGC") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "ATGC2";
	player addVest "pop_chaleco_gcreflectante";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};

if (_param isEqualTo "atgc") exitWith {
	if (medel_din < _precio) exitWith {hint parsetext _mensaje};
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addItemToBackpack "Taser_26";
	["26_cartridge", 4] spawn ica_fnc_item;
	player forceAddUniform "ATGC";
	player addVest "pop_chaleco_gcreflectante";
	player addBackpack "mochila_grande";
	player addHeadgear "GORRA_GC";
	player addGoggles "G_Aviator";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "Itemwatch";
	player linkItem "ItemGPS";

	["pop_vendas_c", 15] spawn ica_fnc_item;
	["pop_esposas", 6] spawn ica_fnc_item;
	["pop_llaves", 1] spawn ica_fnc_item;
	["pop_kiwi", 7] spawn ica_fnc_item;
	["pop_note", 1] spawn ica_fnc_item;
	["pop_ganzua", 5] spawn ica_fnc_item;
	["ToolKit", 2] spawn ica_fnc_item;
	0 spawn ica_fnc_cierraTodo;
};
