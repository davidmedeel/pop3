
/*
Sistema de experiencia
by: Icaruk

experiencia = [1234,12,1000,0,0,0,0,0,0,0,0,0,0,0]
["menu"] call ica_fnc_exp;
*/

_param = _this select 0;

if (_param == "menu") exitWith {
	_idxRama = _this select 1;
	
	disableSerialization;
	createDialog "experiencia";
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_listaHab = (_ui displayCtrl 6044);
	_info = (_ui displayCtrl 6045);
	_sp = (_ui displayCtrl 6046);
	_energ = (_ui displayCtrl 6047);
	_boton = (_ui displayCtrl 6048);
	_listaRamas ctrlSetEventHandler ["LBSelChanged", "['rellena'] call ica_fnc_exp; "];	
	_listaHab ctrlSetEventHandler ["LBSelChanged", "['informa'] call ica_fnc_exp; "];	
	_boton ctrlEnable false;
	
	_ramas = ["Medicina", "Conducción", "Fortaleza", "Minería", "Pesca", "Agricultura", "Logística", "Artesanía", "Informática", "Tiro", "Las Sombras"];
	_data = ["med", "con", "for", "min", "pes", "agr", "log", "art", "inf", "tir", "maf"];
	_value = [experiencia select 3, experiencia select 4, experiencia select 5, experiencia select 6, experiencia select 7, experiencia select 8,
			experiencia select 9, experiencia select 10, experiencia select 11, experiencia select 12, experiencia select 13];
	_maxLvl = [7, 6, 7, 7, 4, 3, 4, 9, 7, 7, 8];
	_ruta = "\pop_icons\ico\";
	_icono = ["med", "cond", "for", "min", "pes", "agr", "log", "art", "inf", "tir", "maf"];

	_idx = 0;
	lbClear _listaRamas;
	while {_idx < (count _ramas)} do {
		_listaRamas lbAdd format ["%1  (%2/%3)", _ramas select _idx, _value select _idx, _maxLvl select _idx];
		_listaRamas lbSetData [_idx, _data select _idx];
		_listaRamas lbSetValue [_idx, (_value select _idx)];
		_listaRamas lbSetPicture [_idx, _ruta + (_icono select _idx)];
		
		if ((_value select _idx) == (_maxLvl select _idx)) then {
			_listaRamas lbSetColor [_idx, [1, 0.7, 0.05, 1]];
		};
		
		_idx = _idx + 1;
	};
	if (!isNil {_idxRama}) then {
		_listaRamas lbSetCurSel _idxRama;
	} else {
		_listaRamas lbSetCurSel -1;
	};
};

if (_param == "rellena") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_listaHab = (_ui displayCtrl 6044);
	_info = (_ui displayCtrl 6045);
	_sp = (_ui displayCtrl 6046);
	_energ = (_ui displayCtrl 6047);
	_boton = (_ui displayCtrl 6048);

	_idxLista = lbCurSel 6043;
	_rama = _listaRamas lbData _idxLista;
	_miNivelRama = _listaRamas lbValue _idxLista;
	
	if (_rama == "") exitWith {};

	_habilidades = switch (_rama) do {
		case "med": {["Vendaje básico", "Vendaje avanzado", "Analgésico", "Anestésico", "Nigromancia", "Regeneración", "Diagnóstico rápido"]};
		case "con": {["Consumo reducido", "Efectividad mecánica", "Consumo óptimo", "Mecánica implacable", "2Fast2Furious", "Desde arriba"]};
		case "for": {["Maratón", "Parkour", "Metabolismo efectivo", "Golpe de suerte", "Máscara poderosa", "Mula de carga", "Houdini"]};
		case "min": {["Arena", "Carbón", "Forjador", "Hierro", "Oro", "Platino", "Puños de titanio"]};
		case "pes": {["Hilo fuerte", "Doble anzuelo", "Sireno", "Neopreno"]};
		case "agr": {["Efectividad agrícola", "Verde de la risa", "Transgénicos"]};
		case "log": {["Permiso", "Carga expandida", "Evasión de impuestos", "Carga expandidísima"]};
		case "art": {["Carga media", "Carga pesada", "Chaleco de carga", "Disturbio líquido", "Polvo explosivo", "Parkour líquido", "Tela de arbusto", "Vacío líquido", "Rifle de caza"]};
		case "inf": {["Explosivos", "Ojos en las paredes", "Hacker", "Free-WiFi", "PEM", "Ojos de gato", "Anuncio Anónimo"]};
		case "tir": {["Subfusiles", "Carabinas", "Fusiles de asalto", "Visor corto", "Francotiradores", "Visor medio", "Visor largo"]};
		case "maf": {["Con clase", "Por si acaso", "Pistolas", "Subfusiles 1", "Subfusiles 2", "Vehículo con clase", "Carabinas", "Rifles de asalto"]};
	};
	_dataHab = switch (_rama) do {
		case "med": {["med1", "med2", "med3", "med4", "med5", "med6", "med7"]};
		case "con": {["con1", "con2", "con3", "con4", "con5", "con6"]};
		case "for": {["for1", "for2", "for3", "for4", "for5", "for6", "for7"]};
		case "min": {["min1", "min2", "min3", "min4", "min5", "min6", "min7"]};
		case "pes": {["pes1", "pes2", "pes3", "pes4"]};
		case "agr": {["agr1", "agr2", "agr3"]};
		case "log": {["log1", "log2", "log3", "log4"]};
		case "art": {["art1", "art2", "art3", "art4", "art5", "art6", "art7", "art8", "art9"]};
		case "inf": {["inf1", "inf2", "inf3", "inf4", "inf5", "inf6", "inf7"]};
		case "tir": {["tir1", "tir2", "tir3", "tir4", "tir5", "tir6", "tir7"]};
		case "maf": {["maf1", "maf2", "maf3", "maf4", "maf5", "maf6", "maf7", "maf8"]};
	};
	
	_idx = 0;
	lbClear _listaHab;
	while {_idx < (count _habilidades)} do {
		_listaHab lbAdd format [(_habilidades select _idx)];
		_listaHab lbSetData [_idx, (_dataHab select _idx)];
		if (_miNivelRama < _idx + 1) then {
			_listaHab lbSetColor [_idx, [0.7,0.7,0.7,0.6]];
		} else {
			_listaHab lbSetColor [_idx, [0,0.9,0.1,1]];
		};
		
		_idx = _idx + 1;
	};
	_listaHab lbSetCurSel -1;
	_info ctrlSetStructuredText parseText "";
	_sp ctrlSetStructuredText parseText "";
	_energ ctrlSetStructuredText parseText "";
};

if (_param == "informa") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_listaHab = (_ui displayCtrl 6044);
	_info = (_ui displayCtrl 6045);
	_sp = (_ui displayCtrl 6046);
	_energ = (_ui displayCtrl 6047);
	_boton = (_ui displayCtrl 6048);

	_idxLista = lbCurSel 6044;
	_habilidad = _listaHab lbData _idxLista;
    _rama = _listaRamas lbData (lbCurSel 6043); // pillo el data de listaRamas
	
	if ((lbCurSel 6044) == -1) exitWith {};
	
	private ["_txt", "_spReq", "_energReq"];
	_txt = switch (_habilidad) do {
		case "med1": {"Puedes usar vendas. Para daños y fracturas en brazos y piernas."};
		case "med2": {"Puedes usar vendas compresivas. Para hemorragias."};
		case "med3": {"Puedes usar tramadol. Para daños en general. Diez veces menos potente que la morfina."};
		case "med4": {"Puedes usar morfina. Para daños en general."};
		case "med5": {"Puedes usar epinefrina y el desfibrilador. Ahora eres nigromante."};
		case "med6": {"Regeneras 1% de sangre cada minuto y puedes usar la bolsa de sangre."};
		case "med7": {"Ahora diagnosticas en un segundo, puedes usar el kit forense y crear un bisturi. ¡Puedes dar malas noticias más rápido!"};
		
		case "con1": {"Gastas un 25% menos de combustible. Que la cosa está cara."};
		case "con2": {"Tienes un 35% de no gastar el kit de reparación."};
		case "con3": {"Gastas un 50% menos de combustible. "};
		case "con4": {"Tienes un 70% de no gastar el kit de reparación."};
		case "con5": {"Obtienes turbo pulsando la tecla WIN. Tienes que ir a más de 40 km/h y tiene 1 min de reutilización. Hazte responsable de las consecuencias."};
		case "con6": {"Puedes pilotar vehículos aéreos."};
		
		case "for1": {"La comida y la bebida te llenan un 33% más."};
		case "for2": {"Sufres menos daño de caída. ¡Parkour!"};
		case "for3": {"Te cansas menos. Estás rocoso."};
		case "for4": {"Tienes un 10% de ignorar cualquier daño sufrido."};
		case "for5": {"Máscara con placebo."};
		case "for6": {"Ahora tu carga no afecta a tu fatiga."};
		case "for7": {"Ahora sabes quitarte las esposas con el músculo T."};
		
		case "min1": {"Puedes extraer arena."};
		case "min2": {"Puedes extraer carbón."};
		case "min3": {"Puedes extraer cobre y usar la forja. ¡Lingotes para todos!"};
		case "min4": {"Puedes extraer  hierro."};
		case "min5": {"Puedes extraer  oro."};
		case "min6": {"Puedes extraer  platino."};
		case "min7": {"Tus puños son tan fuertes y molan tanto, que no necesitas herramientas para extraer minerales."};
		
		case "pes1": {"Tienes un 20% de pescar un tiburón."};
		case "pes2": {"Tienes un 33% de pescar doble."};
		case "pes3": {"No te transformas en un sireno, pero eres infatigable bajo el agua. Sigues siendo mortal y todo eso."};
		case "pes4": {"Puedes fabricar un equipo de buzo. Así no tendrás frío ni te mojarás. No te mees en el neopreno, sé que da calorcito pero es una guarrada."};
		
		case "agr1": {"Le cantas a tus plantas, así que crecen el doble de rápido. Pero si les cantas reggaetón mueren lentamente entre inmensos sufrimientos. Yatusabeh quién baila dembow,  morena perreando derrochando mi flow."};
		case "agr2": {"Puedes cultivar cannabis. Dicen que es ilegal, yo no sé nada."};		
		case "agr3": {"Manipulando el ADN de tus plantas tienes un 20% de que den el doble de cosas."};		
		
		case "log1": {"Puedes trabajar de transportista. Necesitarás el impreso LR-0175 con fotocopia compulsada del DNI. Burocracia y tal."};
		case "log2": {"Puedes cargar 10 suministros más en tu camión."};
		case "log3": {"Has desarrollado una técnica ancestral que trata básicamente de no pagar. Así que el sablazo del IVA por la mercancía se reduce un 33%. Pero eh, la seguridad social y educación gratis."};
		case "log4": {"Puedes cargar 20 suministros más en tu camión."};
		
		case "art1": {"Puedes fabricar una mochila mediana. Aquí cabe medio cadáver."};
		case "art2": {"Puedes fabricar una mochila grande. Aquí cabe un cadáver entero."};
		case "art3": {"Puedes fabricar un chaleco de carga. Ojo que esto no protege."};
		case "art4": {"Puedes fabricar un cóctel molotov. Y con vodka del bueno."};
		case "art5": {"Puedes fabricar pólvora. Para las fallas de Valencia."};
		case "art6": {"Puedes fabricar una poción de Parkour. No te flipes que no dura para siempre."};
		case "art7": {"Puedes fabricar un ghillie suit. Para que el arbusto y tú seáis uno solo."};
		case "art8": {"Puedes fabricar una poción de invisibilidad. Como Harry Potter, pero sin capa. Efectos secundarios: acortamiento de pene, esterilidad y muerte."};
		case "art9": {"Puedes fabricar una M1 Garand y su munición. También sirve para cazar animales."};

		case "inf1": {"Puedes construir un C4-OP."};
		case "inf2": {"Puedes acceder a las cámaras de seguridad de la policía. No hay cámaras en los baños."};
		case "inf3": {"Puedes contactar con el hacker desde cualquier PC."};
		case "inf4": {"Puedes usar el portátil hacker. Tranqui, hay Wi-Fi gratuíto por todo Sahrani."};
		case "inf5": {"Puedes construir una granada PEM y una granada IR."};
		case "inf6": {"Puedes construir un taladro."};
		case "inf7": {"Puedes cenviar un mensaje de POP TV anónimo."};

		case "tir1": {"Puedes usar subfusiles. Son como fusiles, pero más cortos."};
		case "tir2": {"Puedes usar carabinas."};
		case "tir3": {"Puedes usar fusiles de asalto. Ahora puedes asaltar cosas."};
		case "tir4": {"Puedes usar visores de corta distancia."};
		case "tir5": {"Puedes usar francotiradores. Donde pongo el ojo, pongo la bala."};
		case "tir6": {"Puedes usar visores de media distancia."};
		case "tir7": {"Puedes usar visores de larga distancia."};
		
		case "maf1": {"Puedes comprar trajes muy muy elegantes. La gente te tratará de usted, aunque seas un pringao."};
		case "maf2": {"Puedes comprar chalecos blindados. No tienen mucha capacidad, pero proteger, protegen."};
		case "maf3": {"Puedes comprar pistolas automáticas."};
		case "maf4": {"Puedes comprar subfusiles de nivel 1."};
		case "maf5": {"Puedes comprar subfusiles de nivel 2. Estos son mejores que los anteriores."};
		case "maf6": {"Puedes comprar un vehículo elegante, con cristales tintados y todo. Todo el mundo sabrá que planeas algo."};
		case "maf7": {"Puedes comprar carabinas."};				
		case "maf8": {"Puedes comprar rifles de asalto y explosivos. Espero que sepas lo que estás haciendo."};
	};
	_spReq = ["sp", _habilidad] call ica_fnc_costeSP;
	_energReq = ["ene", _habilidad] call ica_fnc_costeSP;
	
	puedoAprender = true;
	_varSP = experiencia select 1;
	_varEnergia = experiencia select 2;
	_norm = "<t size='0.8' color='#FFFF00'>%1</t>";
	_roj = "<t size='1' color='#FF0000' align='center'>%1</t>";
	_ver = "<t size='1' color='#2EFE2E' align='center'>%1</t>";
	_txt1 = format [_norm, _txt];
	_txt2 = if (_spReq > _varSP) then {puedoAprender = false; format [_roj, format ["SP %1/%2", _varSP, _spReq]]} else {format [_ver, format ["SP %1/%2", _varSP, _spReq]]};
	_txt3 = if (_energReq > _varEnergia) then {puedoAprender = false; format [_roj, format ["Energía %1/%2", _varEnergia, _energReq]]} else {format [_ver, format ["Energía %1/%2", _varEnergia, _energReq]]};
	
	_info ctrlSetStructuredText parseText _txt1;
	_sp ctrlSetStructuredText parseText _txt2;
	_energ ctrlSetStructuredText parseText _txt3;

	rama = _rama;	
	spReq = _spReq;
	energReq = _energReq;
	
	_boton ctrlEnable true;
	_boton buttonSetAction '
		["aprende", rama, spReq, energReq] call ica_fnc_exp;
	';
};

if (_param isEqualTo "aprende") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_boton = (_ui displayCtrl 6048);
	
	_idxLista = lbCurSel 6044;
	_miNivelRama = _listaRamas lbValue (lbCurSel 6043); // pillo valor de mi nivel en el idx de listaRamas
	_rama = param[1];
	_spReq = param[2];
	_energReq = param[3];
	_din = 2000 * _spReq;
	
	// comprobador distancia universidad
	if (_idxLista > _miNivelRama) exitWith {hint "Tienes que aprender todas las habilidades anteriores para poder aprender esta."};
	if (_idxLista < _miNivelRama) exitWith {hint "Ya has aprendido eso"};
	if !(puedoAprender) exitWith {hint "No reúnes los requisitos."};
	if (medel_din < _din) exitWith {hint format ["Por cada SP que gastes tienes que pagar 2.000€ \nAhora necesitas %1€", _din]};
	
	medel_din = medel_din - _din;
	
	["sp", - _spReq] call ica_fnc_arrayExp;
	["ene", - _energReq] call ica_fnc_arrayExp;
	[_rama, 1] call ica_fnc_arrayExp;
	[format ["- %1 SP", _spReq]] call ica_fnc_infolog;
	[format ["- %1 energía", _energReq]] call ica_fnc_infolog;
	["+ ¡Nueva habilidad!"] call ica_fnc_infolog;
	
	closeDialog 0;
	["menu", lbCurSel 6043] call ica_fnc_exp;
};


