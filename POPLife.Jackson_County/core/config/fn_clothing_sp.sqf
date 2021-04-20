#include <macro.h>
/*
	File: fn_clothing_sp.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Seguridad Privada"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
        if (call mafia >= 1) then {
            _ret set [count _ret, ["SP_Pop", "Agente", 150]];
        };
		
		if(__GETC__(mafia) >= 2) then
        {
            _ret set[count _ret,["U_B_GEN_Commander_F","Mando",150]];
			_ret set[count _ret,["SP_Pop",150]];
        };
		

    };

	//Hats
	case 1:
	{

		_ret set[count _ret,["TRYK_H_headsetcap_blk",nil,15]];
		if(__GETC__(mafia) > 2) then
		{
            _ret set[count _ret,["mgsr_beret","Boina Mando",15]];
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["TAC_PMC_ID_W2",nil,25]
					
		];
	};

	//Vest
	case 3:
	{
		_ret set[count _ret,["TAC_V_Sheriff_BA_TBL3_BK","Chaleco Intervención",80]];
		_ret set[count _ret,["EF_BS","Chaleco Mando",80]];     
		_ret set[count _ret,["EF_BLT_F1B","Chaleco Agente",80]];
		_ret set[count _ret,["S_VHO_PB_2","Chaleco Recluta",80]];
		_ret set[count _ret,["pop_cinturon_p1","Chaleco de Guardia",80]];
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute",nil,100],
			["mochila_mediana",nil,100]
			//["B_TacticalPack_blk",nil,1000],
			//["B_Carryall_cbr",nil,1000]
		];
	};
};

_ret;