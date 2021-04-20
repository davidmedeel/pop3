/*
  Confiscar objetos

*/




_player = life_pInact_curTarget;
_cosa = [];
_cosa pushBack (uiNamespace getVariable "cacheo" displayCtrl 7090 lbData lbCurSel 7090);
_cosa pushBack (uiNamespace getVariable "cacheo" displayCtrl 7091 lbData lbCurSel 7091);
_cosa pushBack (uiNamespace getVariable "cacheo" displayCtrl 7092 lbData lbCurSel 7092);
_cantidad = [];
_cantidad pushBack (uiNamespace getVariable "cacheo" displayCtrl 7090 lbValue lbCurSel 7090);
_cantidad pushBack (uiNamespace getVariable "cacheo" displayCtrl 7091 lbValue lbCurSel 7091);
_cantidad pushBack (uiNamespace getVariable "cacheo" displayCtrl 7092 lbValue lbCurSel 7092);
closeDialog 0;
hint format ["Has confiscado:\n%1\n%2\n%3",[_cosa select 0] call ica_fnc_classToName,[_cosa select 1] call ica_fnc_classToName,[_cosa select 2] call ica_fnc_classToName];
[player,_cosa,_cantidad] remoteExec ["life_fnc_removeWeapons",_player];
