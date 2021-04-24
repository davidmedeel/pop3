
/*
Anuncio para los niveles de alerta de la policia
*/

if (playerSide != west) exitWith {hint "Solo hago caso a la policia. ¡Fuera de aqui muerto de hambre!"};

_cosa = param [0];

switch (_cosa) do {
	case 0: {
		[10, "Nivel de alerta 0", [1,0,0], 1.6, "No existe ningún riesgo .Las patrullas saldrán normalmente y llevarán su arma reglamentaria en la mochila y el taser en la funda.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",0,true];
	};
	case 1: {
		[10, "Nivel de alerta 1", [1,0,0], 1.6, "Existe algún riesgo medio de que ocurra un incidente.Las patrullas saldrán normalmente equipadas con un chaleco antibalas y el arma reglamentaria en la funda.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",1,true];
	};
	case 2: {
		[10, "Nivel de alerta 2", [1,0,0], 1.6, "Existe amenaza conocida. Se habilita el chaleco antibalas. Las patrullas podrán llevar las armas desenfundadas.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",2,true];
	};
	case 3: {
		[10, "Nivel de alerta 3", [1,0,0], 1.6, "Existe amenaza conocida. Se habilita el uso de un único Subfusil por patrulla. Las patrullas podrán llevar las armas desenfundadas.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",3,true];
	};
	case 4: {
		[10, "Nivel de alerta 4", [1,0,0], 1.6, "Amenazas inminentes y de manera casi continuada. Las patrullas podrán llevar un subfusil por cada agente que la integra.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",4,true];
	};
	case 5: {
		[10, "Nivel de alerta 5", [1,0,0], 1.6, "Amenazas de manera continuada .Los Geos toman el mando de la policía hasta que la amenaza concluya .La policía podrá identificar a la gente por la calle.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",5,true];
	};
	case 6: {
		[10, "Nivel de alerta 6", [1,0,0], 1.6, "Amenazas muy continuadas. Se activa la FUDRA, los G.E.O. tienen 2 vidas y podrán volver a la zona del conflicto.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",6,true];
	};
	case 7: {
		[10, "Nivel de alerta 7", [1,0,0], 1.6, "Amenazas muy continuadas. Se activa Toque de Queda, los militares salen a la calle, ciudadano que no esté en hospital podrá ser fusilado.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
		missionNamespace setVariable ["nivelAlerta",7,true];
	};
};
