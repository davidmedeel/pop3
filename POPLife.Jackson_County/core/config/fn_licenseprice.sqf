/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {50}; //Drivers License cost
	case "boat": {100}; //Boating license cost
	case "pilot": {2500}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {200}; //Diving license cost
	case "oil": {1000}; //Oil processing license cost
	case "cair": {1500}; //Cop Pilot License cost
	case "swat": {3500}; //Swat License cost
	case "cg": {800}; //Coast guard license cost
	case "heroin": {2500}; //Heroin processing license cost
	case "uranium": {2500}; //Uranium processing license cost	
	case "marijuana": {1950}; //Marijuana processing license cost
	case "medmarijuana": {150}; //Medical Marijuana processing license cost
	case "gang": {1000}; //Gang license cost
	case "rebel": {15000}; //Rebel license cost
	case "truck": {2000}; //Truck license cost
	case "depan": {99999}; // EASY-DEPAN	
	case "diamond": {3500};
	case "salt": {1200};
	case "cocaine": {3000};
	case "sand": {1450};
	case "iron": {950};
	case "copper": {800};
	case "cement": {650};
	case "mair": {1500};
	case "home": {30000};
	case "periodista": {1050}; // Licencia de Periodista
	case "bus": {1650}; // Licencia de bus
	case "taxita": {1650}; // Licencia de taxita
	case "transporte": {1550}; // Licencia de transporte
	case "donator": {100000};
	case "alcalde": {100000};
	case "terro": {0};
};