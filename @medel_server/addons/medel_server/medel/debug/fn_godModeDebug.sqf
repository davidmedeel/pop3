
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) > 0) exitWith {}; // Soy admin

for "_i" from 0 to 1 step 0 do {
    sleep 60;
    player allowDamage true;
};
