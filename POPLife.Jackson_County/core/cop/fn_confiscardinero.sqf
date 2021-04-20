
private["_prcn"];
_prcn = parsenumber (ctrlText 2652);
if (_prcn > 100 || _prcn < 0) exitWith {hint "No puedes hacer eso..."};
[player,_prcn] remoteexec ["life_fnc_robPerson",life_dinero_unit];
