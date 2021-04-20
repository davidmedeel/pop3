
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Atropello",6500]};
	case "187": {_type = ["Asesinato",30500]};
	case "901": {_type = ["Fuga de la carcel",6500]};
	case "261": {_type = ["Violacion",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Exceso de velocidad",3000]};
	case "215": {_type = ["Intento de robo",2000]};
	case "213": {_type = ["Uso de explosivos ilegales",50000]};
	case "211": {_type = ["Robo",5000]};
	case "207": {_type = ["Secuestro",10500]};
	case "207A": {_type = ["Intento de secuestro",5000]};
	case "487": {_type = ["Hurto mayor",3500]};
	case "488": {_type = ["Hurto menor",700]};
	case "480": {_type = ["Golpear y correr",1300]};
	case "481": {_type = ["Posesi?n de objetos ilegales",5000]};
	case "482": {_type = ["Intención de distribuir",7000]};
	case "483": {_type = ["Narcotrafico",11500]};
	case "459": {_type = ["Robo con fractura",6500]};
	case "485": {_type = ["Intento de liberar a un preso",2500]};
	case "486": {_type = ["Ganzuar esposas",5000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {};
if(_customBounty != -1) then {_type set[1,_customBounty];};
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};

/*
private _query = format ["SELECT wantedID FROM wanted WHERE wantedID='%1'",_uid];
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
private _val = [_type select 1] call DB_fnc_numberSafe;
private _number = _type select 0;

if !(count _queryResult isEqualTo 0) then {
    _query = format ["SELECT wantedCrimes, wantedBounty FROM wanted WHERE wantedID='%1'",_uid];
    _queryResult = [_query,2] call DB_fnc_asyncCall;
    _pastCrimes = [_queryResult select 0] call DB_fnc_mresToArray;

    if (_pastCrimes isEqualType "") then {_pastCrimes = call compile format ["%1", _pastCrimes];};
    _pastCrimes pushBack _number;
    _pastCrimes = [_pastCrimes] call DB_fnc_mresArray;
    _query = format ["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
    [_query,1] call DB_fnc_asyncCall;
} else {
    _crime = [_type select 0];
    _crime = [_crime] call DB_fnc_mresArray;
    _query = format ["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1', '%2', '%3', '%4', '1')",_uid,_name,_crime,_val];
    [_query,1] call DB_fnc_asyncCall;
};
*/