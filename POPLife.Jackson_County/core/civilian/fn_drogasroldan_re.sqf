waitUntil {!isNull player};

_din = 30000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar + nivel?¿
if (llevo_droga) exitWith {hint "Ya tienes un pedido"};
if(medel_din - _din < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

//vars
_time = 60 * 35;
//_ruta_random = round (random 4);
//_veh = nearestObject [player, "C_Plane_Civil_01_F"];  
//_finTrayecto = 0;
_entregadrogas = "ENTREGADROGAS";
llevo_droga = true;	 
medel_din = medel_din - _din;
//equipar clase cocaina
for "_i" from 1 to 10 do {_unit addItemToUniform "pop_coca_t";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "pop_coca_t";};
for "_i" from 1 to 10 do {_unit addItemToVest "pop_coca_t";};

// lanzo mensaje
hint "KR LE DIO LA DROGA LLEVASELA AL VIEJO";
// no mas

// si muere paramos el contador
if !(alive player) then {   _time = 0;     };
