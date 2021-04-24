/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/


createDialog "electricidad_dialog";

disableSerialization;
_ui = uiNamespace getVariable "electricidad_dialog";

while {!isNil {abierto}} do {
	
	(_ui displayCtrl 9260) ctrlSetText format ["Energia actual: %1%2", round electricidad, "%"];

sleep 1;
};
