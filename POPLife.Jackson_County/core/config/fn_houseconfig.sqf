/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for buyable houses?
*/
private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
switch (true) do {

	case (_house in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"]): {[700000,3]};
	case (_house in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"]): {[900000,4]};
	case (_house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]): {[100000,0]};
	case (_house in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]): {[300000,1]};
	case (_house in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]): {[500000,2]};
	case (_house in ["Land_i_House_Small_03_V1_F"]): {[700000,3]};
	case (_house in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]): {[500000,2]};
	case (_house in ["Land_HouseB"]): {[1000000,4]};
	case (_house in ["Land_HouseA"]): {[1000000,4]};
	case (_house in ["land_pop_chalet"]): {[900000,4]};
	case (_house in ["Land_HouseC1_L"]): {[900000,4]};
	case (_house in ["Land_Home6b_DED_Home6b_01_F"]): {[900000,4]};
	case (_house in ["Land_Home3r_DED_Home3r_01_F"]): {[900000,4]};
	//case (_house in ["Land_HouseDoubleAL"]): {[4850000,4]};
	//case (_house in ["Land_HouseDoubleAL2"]): {[4850000,4]};
	case (_house in ["Land_Ranch_DED_Ranch_01_F"]): {[500000,2]};
	case (_house in ["Land_Ranch_DED_Ranch_02_F"]): {[500000,2]};
	
	default {[]};
};
