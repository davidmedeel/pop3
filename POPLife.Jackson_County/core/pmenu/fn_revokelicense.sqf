/*
	File: fn_revokeLicense.sqf
	Author: Michael Francis

	Description:
	Allows cops to revoke individual licenses, or all licenses. Vehicle related only.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
createDialog "revokeLicense_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "objetivo erroneo!"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "No se puede realizar esta accion!"; closeDialog 0;}; //Bad side check?

_display = findDisplay 41000;
_Btn1 = _display displayCtrl 41002;
_Btn2 = _display displayCtrl 41003;
_Btn3 = _display displayCtrl 41004;
_Btn4 = _display displayCtrl 41005;
_Btn5 = _display DisplayCtrl 41006;
_Btn6 = _display DisplayCtrl 41007;

life_pInact_curTarget = _curTarget;

//Driver License
_Btn1 buttonSetAction "[10] remoteexeccall [""life_fnc_removeLicenses"",life_pInact_curTarget]; closeDialog 0;";

//Truck License
_Btn2 buttonSetAction "[11] remoteexeccall [""life_fnc_removeLicenses"",life_pInact_curTarget]; closeDialog 0;";

//Pilot License
_Btn3 buttonSetAction "[12] remoteexeccall [""life_fnc_removeLicenses"",life_pInact_curTarget]; closeDialog 0;";

//Boating License
_Btn4 buttonSetAction "[13] remoteexeccall [""life_fnc_removeLicenses"",life_pInact_curTarget]; closeDialog 0;";

//Diving License
_Btn5 buttonSetAction "[14] remoteexeccall [""life_fnc_removeLicenses"",life_pInact_curTarget]; closeDialog 0;";

//Firearm License
_Btn6 buttonSetAction "[17] remoteexeccall [""life_fnc_removeLicenses"",life_pInact_curTarget]; closeDialog 0;";