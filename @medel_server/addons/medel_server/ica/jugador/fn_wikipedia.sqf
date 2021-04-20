
/*
por: Icaruk
	["menu"] call ica_fnc_wikipedia;
*/

_param = _this select 0;

_temas = [
	"Controles", // 0
	"¿Cómo empiezo?", // 1
	"Farmeos básicos", // 2
	"Experiencia",  // 3
	"Sistema de transportes", // 4
	"Drogas", // 5
	"Subastas", // 6
	"Ortografía básica" // 7
];

_respuesta0 = parseText "<t size='0.97' font='PuristaMedium'>
	Y --- Menú del jugador <br/>
	U --- Abrir / cerrar vehículo <br/>
	T --- Abrir maletero del vehículo <br/>
	F1 --- Tapones <br/>
	º (arriba del TAB) --- Mostrar DNI <br/>
	Tecla Windows inzquierda --- Interactuar <br/>
	Tecla Windows derecha --- Interactuar <br/>
	Tecla F5 --- Rendirse <br/>
	shift + G --- Puñetazo / golpear con arma <br/>
	shift + H --- Guardar arma <br/>
	ctrl + H --- Sacar el arma <br/>
	ALT + F4 --- Perder todo el dinero del personaje <br/>
	ctrl + alt + supr --- Perder todo el dinero del personaje <br/>
</t>";

_respuesta1 = parseText "<t size='0.97' font='PuristaMedium'>
	Primero tienes que ir a la autoescuela para sacarte el carnet B, cada intento cuesta 2500€.<br/><br/>
	
	Después te compras una 'Pickup' en el concesionario y una mochila en Zara.<br/><br/>
	
	Ahora estás preparado para empezar con los farmeos básicos.
</t>";

_respuesta2 = parseText "<t size='0.92' font='PuristaMedium'>
	Transporte de medicamentos :<br/>
	Deberás transportar con tu pickup los medicamentos que te da el npc desde la farmacia que hay cerca de la refinería hasta la del hospital de lakeside<br/> <br/>
	
	Petróleo:<br/>
	Puedes coger petróleo  y venderlo en la refinería <br/><br/>
	
	Agua:<br/>
	Puedes ir a coger agua y luego venderla en el punto venta más cercano <br/><br/>
	
	Pesca:<br/>
	Deberás de comprar la licencia de barcos, ir  al puerto  de Lakeside y comprar un 'Old fishing boat' que tendrá un coste de 10.500€, tendrás que ir a la zona designada para pescar, tu captura se quedará en la cubierta del barco por un tiempo máximo de 30 minutos o hasta que se la vendas en la pescadería del puerto.<br/><br/>
	
	Agricultura:<br/>
	Deberás ir a la  tienda de semillas para comprar, plantarlas y recogerlas. Después deberás ir a los puntos de venta más cercanos para vender.<br/><br/>
	
	Para plantar se hace mediante la acción y estando de pie.<br/>
	Para recolectar se hace mediante la tecla de windows y estando agachado.<br/>
	Para regar se hace mediante la tecla de windows y estando tumbado.<br/><br/>
	
	Cada producto necesita un tipo de tierra:<br/><br/>
	- pH ácido: girasoles, maíz y coca.<br/>
	- pH neutro: trigo, algodón y cannabis<br/>
	- pH básico: oliva y opio.<br/>
</t>";

_respuesta3 = parseText "<t size='0.97' font='PuristaMedium'>
	Haciendo trabajos puedes conseguir experiencia en diferentes ramas, o bien puedes ir a la universidad para adquirir más conocimientos y acceder a los desbloqueos de cada rama.
</t>";	

_respuesta4 = parseText "<t size='0.97' font='PuristaMedium'>
	Cada vez que se venda algún suministro básico, aumentarán las existencias de ese suministro en su zona de carga <br/><br/>
	
	Para transportar esos suministros hasta Lakeside, necesitarás la licencia C y un camión de la tienda de transportes.<br/>
	Una vez conseguido esto, deberás consultar la demanda en la zona de descarga en Lakeside y acudir al almacén que desees para cargar la mercancía y traerla de vuelta a Lakeside. <br/><br/>
	
	La barrita verde es alimento, la azul agua, la amarilla combustible y la roja son medicamentos.<br/><br/>
	
	La carga máxima puede ser de 50, 100 o 150 dependiendo del camión.<br/><br/>
</t>";	

_respuesta5 = parseText "<t size='0.97' font='PuristaMedium'>
	Las drogas son la forma más rápida de ganar dinero pero de una forma ilegal, tendrás que ir al mercado negro a comprar las semillas de hoja coca, opio o cannabis. <br/><br/>
	
	Luego tendrás  que ir a las zonas acotadas en el mapa para plantar, dejar que maduren y luego recogerlas.<br/><br/>
	
	Con la experiencia en química podrás procesarlo a un producto más valioso, luego tendrás que llevar la mercancía al narcotraficante que según la demanda que tenga te pagará más o menos.
</t>";	

_respuesta6 = parseText "<t size='0.97' font='PuristaMedium'>
	El ganador de una subasta, será el dueño de ese sector económico durante 1h. <br/><br/>
	
	Eso quiere decir todos los beneficios de los ciudadanos que trabajen en ese sector también irán para el dueño del sector.<br/><br/>
	
	Cada sector tiene su punto de recogida de beneficios.
</t>";	

_respuesta7 = parseText "<t size='0.97' font='PuristaMedium'>
	A tomar por culo las normas ortográficas, no hacen falta para escribir bien, hostia puta ya. <br/><br/>
	
	Hola, he visto una ola en el mar de 7 metros. <br/>
	Vaya, te has roto el pantalón saltando una valla. <br/>
	A ver, has llegado 10 minutos tarde y te has quedado sin comida, así que haber venido antes. <br/>
	Ayuda, por favor. <br/>
	Ahí hay un pincho, ¡ay! <br/>
</t>";	


if (_param == "menu") exitWith {
	createDialog "wikipedia";
	_ui = uiNameSpace getVariable "wikipedia";
	_lista = (_ui displayCtrl 5056);
	["actualiza"] call ica_fnc_wikipedia;
	
	_idx = 0;
	while {_idx < (count _temas)} do { // pongo en la lista los temas
		_lista lbAdd (_temas select _idx);
		_lista lbSetData [_idx, (_temas select _idx)];
		_idx = _idx + 1;
	};
	_lista lbSetCurSel 0;
	
};

if (_param == "actualiza") exitWith {
	_ui = uiNameSpace getVariable "wikipedia";
	_txt = (_ui displayCtrl 5055);
	_lista = (_ui displayCtrl 5056);
	_idxLista = lbCurSel 5056;
	
	switch (_idxLista) do {
		case 0: {	_txt ctrlSetStructuredText _respuesta0;	};
		case 1: {	_txt ctrlSetStructuredText _respuesta1;	};
		case 2: {	_txt ctrlSetStructuredText _respuesta2;	};
		case 3: {	_txt ctrlSetStructuredText _respuesta3;	};
		case 4: {	_txt ctrlSetStructuredText _respuesta4;	};
		case 5: {	_txt ctrlSetStructuredText _respuesta5;	};
		case 6: {	_txt ctrlSetStructuredText _respuesta6;	};
		case 7: {	_txt ctrlSetStructuredText _respuesta7;	};
		case 8: {	_txt ctrlSetStructuredText _respuesta8;	};
	};
};

