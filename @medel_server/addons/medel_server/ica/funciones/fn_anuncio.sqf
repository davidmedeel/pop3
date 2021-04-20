
/*
por: Icaruk

Params:
	0 - SCALAR 	// tiempo del anuncio
	1 - STRING 	// texto 1
	2 - ARRAY 	// RGB del texto 1
	3 SCALAR 	// tamaño texto 1
	4 - STRING 	// texto 2
	5 - ARRAY 	// RGB del texto 2
	6 SCALAR 	// tamaño texto 2
	
[10, "Aviso", [1,0,0], 1.6], "Texto de aviso", [1,1,1], 1] spawn ica_fnc_anuncio;
[10, "Aviso", [1,0,0], 1.5, "Texto de anuncio", [1,1,1], 1] remoteexec ["ica_fnc_anuncio",a quien]
*/


if (!isNil {anunciado}) then {
	waitUntil {isNil {anunciado}};
};
anunciado = true;
publicVariable "anunciado";
_duracion = _this select 0;
_texto = _this select 1;
_RGB = (_this select 2) call BIS_fnc_colorRGBtoHTML;
_tam = _this select 3;
_texto2 = _this select 4;
_RGB2 = (_this select 5) call BIS_fnc_colorRGBtoHTML;
_tam2 = _this select 6;

disableSerialization;
("icapa0" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
("icapa0" call BIS_fnc_rscLayer) cutRsc ["anuncio","PLAIN"];
_ui = uiNameSpace getVariable "anuncio";
_anuncio1 = _ui displayCtrl 5050;
_anuncio2 = _ui displayCtrl 5051;

_str1 = parseText format [
	"<t align='center' size='%1'><t color='%2'>
	%3
	</t>", _tam, _RGB, _texto
];
_str2 = parseText format [
	"<t align='center' size='%1'><t color='%2'>
	%3
	</t>", _tam2, _RGB2, _texto2
];
_anuncio1 ctrlSetStructuredText _str1;
_anuncio2 ctrlSetStructuredText _str2;

sleep _duracion;
("icapa0" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
anunciado = nil;
publicVariable "anunciado";
