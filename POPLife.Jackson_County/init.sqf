enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};

//enableSaving[false,false];


// TFR Variables API
/*
tf_no_auto_long_range_radio = true;
tf_west_radio_code = "60";
tf_east_radio_code = "60";
tf_guer_radio_code = "60";
tf_civ_radio_code = "60";

tf_range = -1;

tf_radio_channel_name = "";
tf_radio_channel_password = "";
*/
profilenamespace setvariable ['GUI_BCG_RGB_R',0.0];
profilenamespace setvariable ['GUI_BCG_RGB_G',0.84];
profilenamespace setvariable ['GUI_BCG_RGB_B',0.0];
profilenamespace setvariable ['GUI_BCG_RGB_A',1.0];

KRON_StrToArray = {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};

StartProgress = true;
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};


life_fnc_curar = {

	if (!isNil {ocupado}) exitwith {titleText ["Ya te estoy curando...", "PLAIN"];};

	_medico = cursortarget; 
	 
	if ({side _x == INDEPENDENT} count playableUnits >= 3)  exitWith {titleText ["Lo siento, no estoy de servicio ahora mismo. Acude a un compañero...", "PLAIN"];}; 
	 
	if (medel_din < 500) exitwith {titleText ["Mis servicios cuestan 500€", "PLAIN"];}; 
	 
	_numeroemscerca = 0; 
	{ 
	 if(isPlayer _x) then { 
	  if( _x != player && side _x == INDEPENDENT) then { 
	   _numeroemscerca = _numeroemscerca + 1;
	  }; 
	 }; 
	} forEach ((position _medico) nearObjects["Man", 50]); 
	 
	if (_numeroemscerca > 1) exitwith 
	{ 
	 titleText ["Estoy ocupado ahora mismo... Tengo compañeros que te pueden ayudar por aqui cerca.", "PLAIN"]; 
	}; 
	 
	medel_din = medel_din - 500; 
	["- 500€"] call ica_fnc_infolog; 

	sefuedelems = false;

	_t = (round (random 30) + 15); 
	[_t + 1, "Recibiendo tratamiento médico. No te alejes!"] spawn ica_fnc_barrita; 
	 
	while {_t > 0} do 
	{ 
	 if (player distance _medico > 5) exitwith {titleText ["Te has ido muy lejos y no puedo seguir curandote... TE LO DIJE!", "PLAIN"]; [1, "Cancelando tratamiento..."] spawn ica_fnc_barrita; sefuedelems = true;}; 
	  //titleText ["Recibiendo tratamiento...", "PLAIN"]; 
	 _t = _t - 1; 
	 ocupado = true;
	 sleep 1; 
	}; 
	if (sefuedelems) exitwith {sefuedelems = nil; ocupado = nil; titleText ["Te has ido muy lejos y no puedo seguir curandote... TE LO DIJE!", "PLAIN"]; [1, "Cancelando tratamiento..."] spawn ica_fnc_barrita;}; 
	 
	_victima = player; 
	{_victima setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"]; 
	_victima setVariable ["sangrando", [0, 0, 0, 0], true]; 
	_victima setVariable ["inconsciente", false, true]; 
	_victima setVariable ["cegado", false, true]; 
	_victima setVariable ["toxicidad", 0, true]; 
	_victima setVariable ["dolor", false]; 
	_victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true]; 
	_victima setVariable ["organos", [true, true, true], true];
	_victima setVariable ["enfermedad", nil, true];
	{profileNamespace setVariable ["enfermedad",nil]} remoteExec ["BIS_fnc_spawn",_victima];
	_victima setVariable ["drogado",false,true];
	_victima setVariable ["tengoMono",false,true];
	player setDamage 0; 

	ocupado = nil;
	titleText ["Ya estás curado, vuelve cuando quieras!", "PLAIN"];

};
