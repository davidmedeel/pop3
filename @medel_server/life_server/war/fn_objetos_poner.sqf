private["_position","_objeto","_param","_objetoitem"];
_param = _this select 0;
_objeto = _param createVehicle [0,0,0];
_objeto attachTo[player,[0,5.5,0.3]];
_objeto enableSimulation false;
_objeto setVariable["war_objeto","war_objeto_colocado",true];

if (isnil {war_objetos_colocados}) then {
	war_objetos_colocados = 0;
};

if (war_objetos_colocados < 100) then {
    war_colocar_objeto = player addAction[
	"Poner objeto",
	{
		if(!isNull war_colocado) then {
			detach war_colocado;
			war_colocado = ObjNull;
		};
		player removeAction war_colocar_objeto;
		war_colocar_objeto = nil;
    },
    "",
    999,
    false,
    false,
    "",
    '!isNull war_colocado'
    ];
war_colocado = _objeto;
};
waitUntil {isNull war_colocado};
war_objetos_colocados = war_objetos_colocados + 1;
publicVariable "war_objetos_colocados";
_objeto enableSimulation true;
if(!isNil "war_colocar_objeto") then {player removeAction war_colocar_objeto;};
if(isNull _objeto) exitWith {war_colocado = ObjNull;};
_objeto setPos [(getPos _objeto select 0),(getPos _objeto select 1),0];
if !((typeof _objeto) == "POP_electroflare") then {
_objeto setDamage 1;
};

if (typeof _objeto == "POP_BandaClavos") then {
	[[_objeto], {
	
		private["_nearVehicles","_spikeStrip"];
		_spikeStrip = _this select 0;
		if(isNull _spikeStrip) exitWith {}; 

		while {true} do {
			_nearVehicles = nearestObjects[_spikeStrip, ["Car"], 5];
			
			if ((count _nearVehicles) > 0 OR isnull _spikeStrip) exitwith {

				_vehicle = _nearVehicles select 0;

				[_vehicle] remoteexeccall ["life_fnc_spikeStripEffect",_vehicle];

				deleteVehicle _spikeStrip;
			};
			
			sleep 0.1;
		};
	
	}] remoteexec ["bis_fnc_spawn",2];
};

_objetoitem = format ["%1_i", typeOf _objeto];
[_objetoitem, -1] call ica_fnc_item;


