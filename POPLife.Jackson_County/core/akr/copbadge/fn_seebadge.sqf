/*
	File: fn_showBadge.sqf
	Author: Akryllax
	Desc: Local see badge.
*/
disableSerialization;
private["_cop", "_badgeNumber"];

_cop = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_badgeNumber = [_this, 1, "", [""]] call BIS_fnc_param;

titleRsc ["BadgeDialogV2", "PLAIN DOWN", 1, true];
_d = uiNamespace getVariable ['BadgeDialogV2', displayNull];
(_d displayCtrl 656711) ctrlSetText (_cop getVariable["realname", "ERROR"]);
(_d displayCtrl 656711) ctrlSetTextColor [0,0,0,1];
(_d displayCtrl 656712) ctrlSetText (format["N?: %1", _badgeNumber]);
(_d displayCtrl 656712) ctrlSetTextColor [0,0,0,1];
//(_d displayCtrl 656713) ctrlSetText ("icons\badge.paa");