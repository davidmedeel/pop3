/*
	File: fn_showBadge.sqf
	Author: Akryllax
	Desc: Local see badge.
*/
disableSerialization;
private["_player", "_badgeNumber"];

_player = param[0];
_dniNumber = param[1];

	titleRsc ["DNI_dialog", "PLAIN DOWN", 1, true];
	_d = uiNamespace getVariable ['DNI_dialog', displayNull];
	(_d displayCtrl 656721) ctrlSetText (_player getVariable["nombreFake", "ERROR"]);
	(_d displayCtrl 656722) ctrlSetText (format["%1", _dniNumber]);