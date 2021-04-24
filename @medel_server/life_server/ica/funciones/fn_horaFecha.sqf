
//////////////////////////////////////////////////////////////////////////////
//																			//
//		           		  		DESOLATION						     		//
//                 		    by Icaruk & nerkaid								//
//		                                                      			    //
//		   If you want to use our code or part of it contact us at:         //
//	 	Si quieres usar nuestro código o parte del mismo contáctanos en:	//
//                    Email: support@desolationmod.com						//
//                    Web: http://www.desolationmod.com						//
//															                //
//////////////////////////////////////////////////////////////////////////////

/*
por: Icaruk

Params: 
	0: STRING - Modo:
		"pre" 	- Pregunta horaFecha actual en la DB, devuelve [2016,5,11,19,49]. El cliente lo tiene en la variable horaFecha.
		"coms" 	- Compara horaFecha actual con la de ref1, devuelve segundos. Puede ser negativo.
		"com" 	- Compara ref1 con ref2: devuelve cuánto se ha pasado (en positivo) ref1 respecto a ref2, o cuánto queda (en negativo).
			1: STRING - Submodo:
				"hm": Devuelve en [horas, minutos]
				"dh": Devuelve en [dias, horas]
			2: ARRAY		- Primera referencia.
			3: ARRAY (opc) 	- Segunda referencia. Default horaFecha.
			
		"con" 	- Convierte ref1 a dateTime STRING, devuelve "2016-5-11 19:49". Los minutos del param1 son omitibles.
		"con2" 	- Lo mismo que "con" pero con el orden cambiado, devuelve "19:49 11-5-2016". Los minutos del param1 son omitibles.
		"con3"	- Convierte [1,1,1,1,1] a "1a 1mes 1d 1h 1min".
		"ope" 	- Suma 2 fechas: ref1 y ref2. Ref2 debe tener 5 elementos, y pueden ser negativos para restar.
		
	1: ARRAY (opcional) - array horaFecha de referencia1.
	2: ARRAY (opcional) - array horaFecha de referencia2.
	
Ejemplos:
	["coms", [2017,8,21,12,51]] call ica_fnc_horaFecha; 							// -2520
	["com", "hm", [2017,8,21,12,51]] call ica_fnc_horaFecha;						// [0,-42]
	["com", "hm", [2017,8,21,13,51], [2017,8,21,12,51]] call ica_fnc_horaFecha;		// [1,0]
	["com", "dh", [2017,8,25,12,51], [2017,8,20,12,51]] call ica_fnc_horaFecha;		// [5,0]
		["com", "dh", fecha_3_dias_en_el_pasado] call ica_fnc_horaFecha; // [-3, 0]
		["com", "dh", fecha_3_dias_en_el_futuro] call ica_fnc_horaFecha; // [3, 0]
	["con", [2017,8,21,12,51]] call ica_fnc_horaFecha;								// "21-8-2017 12:51"
	["con2", [2017,8,21,12,51]] call ica_fnc_horaFecha;								// "12:51  21-8-2017"
	["con3", [0, 0, 1, 12, 32]] call ica_fnc_horaFecha;								// "1d 12h 32min"
	["con4", [0, 0, 1, 12, 32]] call ica_fnc_horaFecha;								// "21-8-2017"
	["ope", [2017,8,21,5,51], [0,0,0,3,0]] call ica_fnc_horaFecha;					// [2017,8,21,8,51]
	
	["iniSer"] spawn ica_fnc_horaFecha;
	
*/

_param = param [0];


private ["_ano", "_mes", "_dia", "_hor", "_min", "_res"];



_fnc_diasMax = {
	private _mes = param [0];
	private _ano = param [1];
	
	
	if ((isNil "_mes") OR (isNil "_ano")) exitWith {[format ["_mes es %1 y _ano es %2", _mes, _ano]] call bis_fnc_error}; // DEBUG
	
	
	if (_mes > 12) then {
		while {_mes > 12} do {
			_mes = _mes - 12;
			_ano = _ano + 1;
		};
	};
	
	
	private _diasMax = switch (_mes) do {
		case 1: {31};
		case 2: {28};
		case 3: {31};
		case 4: {30};
		case 5: {31};
		case 6: {30};
		case 7: {31};
		case 8: {31};
		case 9: {30};
		case 10: {31};
		case 11: {30};
		case 12: {31};
		
		default {100};
	};
	
	
	if (_mes isEqualTo 2) then { // si estoy en febrero
		if ((_ano % 4) isEqualTo 0) then { // y el año es bisiesto
			_diasMax = _diasMax + 1; // sumo 1
		};
	};
	
	_diasMax
	
};



if (_param isEqualTo "con") exitWith { // convierto ARRAY horaFecha en STRING dateTime
	
	_min = param [1] param [4, 0];
	if (_min < 10) then {_min = format ["0%1", _min]};
	
	format ["%1-%2-%3 %4:%5", 
		param [1] select 2, // día
		param [1] select 1, // mes
		param [1] select 0, // año
		param [1] select 3, // hor
		_min
	]
};



if (_param isEqualTo "con2") exitWith {
	
	_min = param [1] param [4, 0];
	if (_min < 10) then {_min = format ["0%1", _min]};
	
	format ["%1:%2  %3-%4-%5", 
		param [1] select 3, // hor
		_min,
		param [1] select 2, // día
		param [1] select 1, // mes
		param [1] select 0	// año
	]
};



if (_param isEqualTo "con3") exitWith {
	
	// Esto es el tiempo restante, no una fecha
	_ano = param [1] select 0;
	_mes = param [1] select 1;
	_dia = param [1] select 2;
	_hor = param [1] select 3;
	_min = param [1] select 4;
	
	
	
	// ****************
	// Limito valores
	// ****************
	
	while {_min >= 60} do {
		_min = _min - 60;
		_hor = _hor + 1;
	};
	
	while {_hor >= 24} do {
		_hor = _hor - 24;
		_dia = _dia + 1;
	};
	
	
	_diasMax = [_mes, _ano] call _fnc_diasMax;
	
	while {_dia > _diasMax} do {
		_dia = _dia - _diasMax;
		_mes = _mes + 1;
	};
	
	while {_mes >= 12} do {
		_mes = _mes - 12;
		_ano = _ano + 1;
	};
	
	
	
	// ******************
	// Construyo string
	// ******************
	
	_strAno = if (_ano isEqualTo 0) then {""} else {format ["%1a ", _ano]};
	_strMes = if (_mes isEqualTo 0) then {""} else {format ["%1mes ", _mes]};
	_strDia = if (_dia isEqualTo 0) then {""} else {format ["%1d ", _dia]};
	_strHor = if (_hor isEqualTo 0) then {""} else {format ["%1h ", _hor]};
	_strMin = if (_min isEqualTo 0) then {""} else {format ["%1min", _min]};
	
	
	_strFin = toArray (_strAno + _strMes + _strDia + _strHor + _strMin);
	
	_idxFin = count _strFin -1;
	if ((_strFin select _idxFin) isEqualTo 23) then { // " "
		_strFin deleteAt _idxFin;
	};
	
	toString _strFin
	
};



if (_param isEqualTo "con4") exitWith {
	
	format ["%1-%2-%3", 
		param [1] select 2, // día
		param [1] select 1, // mes
		param [1] select 0	// año
	]
};



if (!isNil "horaFecha") then {
	
	_res = horaFecha;
	
	if (isNil "_res") exitWith {["_res con los datos de horaFecha es nil."] call BIS_fnc_error};
	if !((_res select 0) isEqualType 0) exitWith {
		_str = format ["_res no es un número, es un %1 con valor %2.", typeName _res, _res];
		[_str] call BIS_fnc_error;
	};
	
	_ano = 		_res param [0]; // 2016
	_mes = 		_res param [1]; // 12
	_dia = 		_res param [2]; // 30
	_hor = 		_res param [3]; // 24
	_min = 		_res param [4]; // 59
	
};



if (_param isEqualTo "ope") exitWith {
	
	_horaFecha = param [1, horaFecha]; // [2017,7,27,12,34];
	_opera = param [2]; // [0,0,0,1,0];
	
	
	if (count _opera < 5) exitWith {["_opera tiene menos de 5 elementos."] call BIS_fnc_error};
	
	
	private _fechaFin = [_horaFecha, _opera] call des_fnc_uneArr; // no uso vectorAdd, el número de ambos arrays es diferente
	
	_ano = _fechaFin select 0;
	_mes = _fechaFin select 1;
	_dia = _fechaFin select 2;
	_hor = _fechaFin select 3;
	_min = _fechaFin select 4;
	
	
	if ((isNil "_mes") OR (isNil "_ano")) exitWith {[format ["_fechaFin es %1", _fechaFin]] call bis_fnc_error}; // DEBUG
	
	
	// MINUTOS
	// ***************************************
	while {(_min < 0) OR (_min >= 60)} do {
		
		if (_min >= 60) then {
			_min = _min - 60;
			_hor = _hor + 1;
		};
		
		if (_min < 0) then {
			_min = _min + 60;
			_hor = _hor - 1;		
		};
	};
	
	// HORAS
	// ***************************************	
	while {(_hor < 0) OR (_hor >= 24)} do {
		
		if (_hor >= 24) then {
			_hor = _hor - 24;
			_dia = _dia + 1;
		};
		
		if (_hor < 0) then {
			_hor = _hor + 24;
			_dia = _dia - 1;
		};
	};
	
	// DÍAS
	// ***************************************	
	while {true} do {
		
		_diasMax = [_mes, _ano] call _fnc_diasMax; // 31
		
		if ((_dia > 0) AND (_dia <= _diasMax)) exitWith {};
		
		
		if (_dia > _diasMax) then {
			_dia = _dia - _diasMax;
			_mes = _mes + 1;
		};
		
		if (_dia <= 0) then {
			_mes = _mes - 1;
			_dia = _dia + ([_mes, _ano] call _fnc_diasMax);
		};
		
	};
	
	// MESES
	// ***************************************		
	while {_mes > 12} do {
		if (_mes > 12) then {
			_mes = _mes - 12;
			_ano = _ano + 1;
		};
	};	
	
	
	[_ano, _mes, _dia, _hor, _min]
	
};



if (_param isEqualTo "coms") exitWith {
	
	_horaFecha = param [1];
	
	(
		((_ano	- 	(_horaFecha select 0))	* 31536000)  +
		((_mes	- 	(_horaFecha select 1)) 	* 2592000)   +
		((_dia	- 	(_horaFecha select 2)) 	* 86400)  	 +
		((_hor	-	(_horaFecha select 3)) 	* 3600) 	 +
		((_min	- 	(_horaFecha select 4)) 	* 60)
	) * -1
	
};



if (_param isEqualTo "com") exitWith {
	
	private ["_ref1", "_ref2", "_modo", "_mayor", "_horFin", "_minFin"];
	
	
	_modo = param [1];
	_ref1 = param [2];
	_ref2 = param [3, horaFecha];
	
	
	if (isNil "_modo") exitWith {["_modo es nil"] call BIS_fnc_error};
	if (isNil "_ref1") exitWith {["_ref1 es nil"] call BIS_fnc_error};
	
	
	
	_ano1 = 		_ref1 param [0]; // 2016
	_mes1 = 		_ref1 param [1]; // 12
	_dia1 = 		_ref1 param [2]; // 30
	_hor1 = 		_ref1 param [3]; // 24
	_min1 = 		_ref1 param [4]; // 59		
	
	
	private ["_ano2", "_mes2", "_dia2", "_hor2", "_min2"];
	
	if (!isNil "_ref2") then { // pillo de la referencia2
	
		_ano2 = 		_ref2 param [0]; // 2016
		_mes2 = 		_ref2 param [1]; // 12
		_dia2 = 		_ref2 param [2]; // 30
		_hor2 = 		_ref2 param [3]; // 24
		_min2 = 		_ref2 param [4]; // 59
		
	} else { // pillo de horaFecha
	
		_ano2 = 		_ano; // 2016
		_mes2 = 		_mes; // 12
		_dia2 = 		_dia; // 30
		_hor2 = 		_hor; // 24
		_min2 = 		_min; // 59		
		
	};
	
	
	
	// ¿ (ref2 > ref1) ?	
	_mayor = if (_ano2 > _ano1) then {
		true
	} else {
		if ((_ano2 >= _ano1) AND (_mes2 > _mes1)) then {
			true
		} else {
			if ((_ano2 >= _ano1) AND (_mes2 >= _mes1) AND (_dia2 > _dia1)) then {
				true
			} else {
				if ((_ano2 >= _ano1) AND (_mes2 >= _mes1) AND (_dia2 >= _dia1) AND (_hor2 > _hor1)) then {
					true
				} else {
					if ((_ano2 >= _ano1) AND (_mes2 >= _mes1) AND (_dia2 >= _dia1) AND (_hor2 >= _hor1) AND (_min2 > _min1)) then {
						true
					} else {
						false
					};
				};
			};
		};
	};
	
	
	
	/* ---> s
	
		ano 31536000
		mes 2592000
		dia 86400
		hor 3600
		min 60
	*/
	
	
	_minTot = if (_mayor) then { // ref2 > ref1
		
		((_ano1	- 	_ano2)	* 525600)	+
		((_mes1	- 	_mes2) 	* 43200)	+
		((_dia1	- 	_dia2) 	* 1440)  	+
		((_hor1	-	_hor2) 	* 60) 	 	+
		(_min1	- 	_min2)
		
	} else {
		
		((_ano2	- 	_ano1)	* 525600)	+
		((_mes2	- 	_mes1) 	* 43200)	+
		((_dia2	- 	_dia1) 	* 1440)  	+
		((_hor2	-	_hor1) 	* 60) 	 	+
		(_min2	- 	_min1)
		
	};
	
	
	
	_minTot = abs _minTot; // diferencia total en minutos
	_finGra = 0; // días u horas
	_finPeq = 0; // horas o minutos
	
	
	
	switch (_modo) do {
		
		case "hm": { // horas y minutos
			
			while {_minTot > 0} do {
				if (_minTot >= 60) then { // tengo más de 60 minutos
					_minTot = _minTot - 60; // los resto
					_finGra = _finGra + 1; // sumo 1 hora
				} else { // tengo menos de 60 minutos
					_finPeq = _minTot; // minutos restantes
					_minTot = 0;
				};
			};
		};
		
		case "dh": { // días y horas
			
			_horTot = round (_minTot / 60); // paso a horas
			
			
			while {_horTot > 0} do {
				if (_horTot >= 24) then { // tengo más de 24h
					_horTot = _horTot - 24; // las resto
					_finGra = _finGra + 1; // sumo 1 día
				} else { // tengo menos de 24h
					_finPeq = _horTot; // horas restantes
					_horTot = 0;
				};
			};
			
		};
		
	}; // switch
	
	
	
	if (_mayor) then {
		[- _finGra, - _finPeq]
	} else {
		[_finGra, _finPeq]
	};
	
	
}; // if param



if (_param isEqualTo "iniSer") exitWith {
	
	// Fnc para llamada
	_fnc_dateTime = {
		
		// Pido datos
		_res = (["dateTime", 2] call des_fnc_DB) param [0, []]; // esto da [año, mes, dia, hor, min, sec]
		
		
		// Comprobador de errores
		if (_res isEqualTo []) exitWith {
			_str = "_res con los datos de horaFecha es nil.";
			[_str] call BIS_fnc_error;
		};
		
		
		// Elimino segundos
		_res deleteAt (count _res -1);
		
		
		// Return
		_res
		
	};
	
	
	// Declaro por primera vez
	horaFecha = call _fnc_dateTime;
	
	
	// Loop
	while {true} do {
		
		// Pido datos
		private _res = call _fnc_dateTime; // esto da [año, mes, dia, hor, min]
		
		
		// Sumo 1h de offset
		// _res = ["ope", _res, [0,0,0,1,0]] call ica_fnc_horaFecha;
		
		
		// Publico
		horaFecha = _res;
		publicVariable "horaFecha";
		
		
		sleep 30;
		
	};
};



