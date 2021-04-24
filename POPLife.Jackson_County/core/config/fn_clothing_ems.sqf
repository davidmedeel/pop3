
private["_filter"];

_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Departamento Medico - PoPLife"];

switch (_filter) do
{
	//Uniformes
	case 0:
	{
		[
			["","----- Uniformes -----",0],		
			["POP_EMS2","Uniforme de EMS 1",1000],
			["POP_EMS3","Uniforme de EMS 2",1000],
			["POP_EMS4","Uniforme de EMS 3",1000],
			["POP_EMS5","Uniforme de EMS 4",1000],
			["POP_EMS6","Uniforme de EMS 5",1000],
			["POP_EMS8","Uniforme de EMS 6",1000],
			["POP_EMS7","Uniforme de EMS 7",1000],
			["POP_EMS1","Uniforme de GAR",1000],
			["","----- Otros -----",0],
			["RDS_UNIFORM_DOCTOR","Uniforme de Cirujano",1000],
			["medel_uniforme_bombero","Uniforme de Bombero",1000],
			["POP_EMS9","Uniforme de Buzo",1000]
		];
	};
	
	//Sombreros
	case 1:
	{
		[
			["","----- Otros -----",0],
			["Kio_Santa_Hat","Gorro de Santa",300],
			["H_CrewHelmetHeli_O","Casco de Piloto [1]",300],
			["H_PilotHelmetHeli_O","Casco de Piloto [2]",300],
			["H_Orel_FireFighter","Casco de Bombero [1]",300],
			["H_Orel_FireFighter_Gaz","Casco de Bombero [2]",300]
		];
	};

	//Gafas
	case 2:
	{
		[
			["G_Shades_Black",nil,100],
			["G_Shades_Blue",nil,100],
			["G_Sport_Blackred",nil,100],
			["G_Sport_Checkered",nil,100],
			["G_Sport_Blackyellow",nil,100],
			["G_Sport_BlackWhite",nil,100],
			["G_Squares",nil,100],
			["G_Aviator",nil,100],
			["G_Diving", nil,100],
			["","----- Jefatura -----",0],	
			["Masque_Chirurgical",nil,100],			
			["G_Respirator_blue_F","Mascarilla azul",1000],				
			["G_Respirator_white_F","Mascarilla blanca",1000],				
			["G_Respirator_yellow_F","Mascarilla amarilla",1000]			
			
		];
	};
	
	//Chalecos
	case 3:
	{
		[
			["","----- Chalecos -----",0],
			["PGS_chaleco_tela_ems_1","Chaleco de EMS 1",2000],
			["PGS_chaleco_tela_ems_2","Chaleco de EMS 2",2000],
			["PGS_chaleco_tela_ems_3","Chaleco de EMS 3",2000],
			["PGS_chaleco_tela_ems_4","Chaleco de EMS 4",2000],
			["","----- Otros -----",0],
			["SAMUR_CHALECO","Chaleco de EMS",2000],			
			["pop_chaleco_samurrefl","Chaleco de EMS [2]",2000],
			["pop_chaleco_samurrefl2","Chaleco de Jefatura",2000],
			["V_RebreatherB","Respirador",3000]
		];
	};
	
	//Mochilas
	case 4:
	{
		[
			["B_Parachute",nil,3000],
			["mochila_grande",nil,1000]
		];
	};
};
