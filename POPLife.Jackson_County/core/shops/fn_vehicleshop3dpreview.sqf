private ["_clase_a_visualizar", "_objeto", "_posicion_attach"];

if (isNil "Life_Preview_3D_Vehicle_cam") then
{
	[] call life_fnc_vehicleShopInit3DPreview;
};

_clase_a_visualizar = _this select 0;
_colorIndex = lbValue[2304,(lbCurSel 2304)];
// ignoro lo que no este en el cfg
if (_clase_a_visualizar != "" && {isClass (configFile >> "CfgVehicles" >> _clase_a_visualizar) && {getNumber (configFile >> "CfgVehicles" >> _clase_a_visualizar >> "scope") > 0}}) then
{
	// Ignoro si el coche a visualizar es el que ya estoy visualizando
	if (isNull Life_Preview_3D_Vehicle_object || {_clase_a_visualizar != typeOf Life_Preview_3D_Vehicle_object}) then
	{
		// Creo y coloco el objeto en el cielo.
		_posicion_attach = [[5000, 5000, 0]] call life_fnc_SearchPosEmpty;
		/*_objeto = _clase_a_visualizar createVehicleLocal [4925.28,3006.17,0.00143814];
		_objeto attachTo [axe_punto_attach, [4925.28,3006.17,0.00143814]];*/
		_objeto = _clase_a_visualizar createVehicleLocal [9386.46,9152.02,0.00143814];
		//_objeto setDir [9386.46,9152.02,0.00143814]; //Set the vehicles direction the same as the marker.
		_objeto attachTo [axe_punto_attach, [9386.46,9152.02,0.00143814]];
		if !(_colorIndex isEqualto 0) then {[_objeto,_colorIndex] spawn life_fnc_colorVehicle};
		_objeto enableSimulation false;

		if (!isNull Life_Preview_3D_Vehicle_object) then {detach Life_Preview_3D_Vehicle_object; deleteVehicle Life_Preview_3D_Vehicle_object;};
		Life_Preview_3D_Vehicle_object = _objeto;
	};
};