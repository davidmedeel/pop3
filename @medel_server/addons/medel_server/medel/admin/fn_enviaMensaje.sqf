
/*
por: Medel
*/

_param = param [0];

if (_param isEqualTo "envio") exitWith {

	_mensaje = param [1];

	//_mensaje = missionNamespace getVariable "mensaje_global";

	titleText [format ["<t color='#ffffff' size='3'>%1</t><br/>", _mensaje], "PLAIN", -1, true, true];
};
