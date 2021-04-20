waitUntil {!isNull player};

_din = 50000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent

if (sin_droga) exitWith {hint "Ya no te queda nada"};
sin_droga = true;

//vendo cocaina

player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
//x10
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
//x20
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
player  removeItem "pop_coca_t"; 
//x30
// pago y lanzo el mensaje
medel_din = medel_din+_din;
llevo_droga = false;
hint "GRACIAS POR LA DROGA ¡Realy!";
//doy EXP
[5] call ica_fnc_ganoExp;
