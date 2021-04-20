	
class autoEquipador
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['autoEquipador', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['autoEquipador', nil]; ";

	class controls {
		class fondo: RscPicture
		{
			idc = 1200;
			text = "medel\imagenes\autoEquipador.paa";
			x = 0.247343 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.748 * safezoneH;
		};
		class comisarioPrincipalCNP: RscButton
		{
			idc = 1600;
			text = "Comisario Principal CNP"; //--- ToDo: Localize;
			onButtonClick = "['comisarioPrincipalCNP'] spawn ica_fnc_autoEquipador;";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class comisarioPrincipalGC: RscButton
		{
			idc = 1601;
			text = "Comisario Principal GC"; //--- ToDo: Localize;
			onButtonClick = "['comisarioPrincipalGC'] spawn ica_fnc_autoEquipador;";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class comisarioCNP: RscButton
		{
			idc = 1602;
			text = "Comisario"; //--- ToDo: Localize;
			onButtonClick = "['comisarioCNP'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class comisarioGC: RscButton
		{
			idc = 1603;
			text = "Comisario"; //--- ToDo: Localize;
			onButtonClick = "['comisarioGC'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class jefeSuperiorCNP: RscButton
		{
			idc = 1604;
			text = "Jefe Superior"; //--- ToDo: Localize;
			onButtonClick = "['jefeSuperior'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class capitanGC: RscButton
		{
			idc = 1605;
			text = "Capitán"; //--- ToDo: Localize;
			onButtonClick = "['capitan'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class inspectorCNP: RscButton
		{
			idc = 1606;
			text = "Inspector / Ins. Jefe"; //--- ToDo: Localize;
			onButtonClick = "['inspector'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class tenienteGC: RscButton
		{
			idc = 1607;
			text = "Sub Teniente / Teniente"; //--- ToDo: Localize;
			onButtonClick = "['teniente'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SubInspectorCNP: RscButton
		{
			idc = 1608;
			text = "Sub Ins. / Sub Ins. Jefe"; //--- ToDo: Localize;
			onButtonClick = "['subInspector'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class oficialCNP: RscButton
		{
			idc = 1609;
			text = "Sub Oficial / Oficial"; //--- ToDo: Localize;
			onButtonClick = "['oficial'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class agentesCNP: RscButton
		{
			idc = 1610;
			text = "Agente 1ª / Agente 2ª"; //--- ToDo: Localize;
			onButtonClick = "['agentesCNP'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class agenteCNP: RscButton
		{
			idc = 1611;
			text = "Agente"; //--- ToDo: Localize;
			onButtonClick = "['agente'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class reclutaCNP: RscButton
		{
			idc = 1613;
			text = "Recluta"; //--- ToDo: Localize;
			onButtonClick = "['recluta'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class sargentoGC: RscButton
		{
			idc = 1612;
			text = "Sargento / Sarg. Mayor"; //--- ToDo: Localize;
			onButtonClick = "['sargento'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class caboGC: RscButton
		{
			idc = 1614;
			text = "Cabo / Cabo Mayor"; //--- ToDo: Localize;
			onButtonClick = "['cabo'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class guardiasGC: RscButton
		{
			idc = 1615;
			text = "Guardia 1ª / Guardia 2ª"; //--- ToDo: Localize;
			onButtonClick = "['guardias'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class guardiaGC: RscButton
		{
			idc = 1616;
			text = "Guardia"; //--- ToDo: Localize;
			onButtonClick = "['guardia'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class cadeteGC: RscButton
		{
			idc = 1617;
			text = "Cadete"; //--- ToDo: Localize;
			onButtonClick = "['cadete'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class geo: RscButton
		{
			idc = 1618;
			text = "GEO"; //--- ToDo: Localize;
			onButtonClick = "['geo'] spawn ica_fnc_autoEquipador;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pilotoGC: RscButton
		{
			idc = 1619;
			text = "Piloto GC"; //--- ToDo: Localize;
			onButtonClick = "['pilotoGC'] spawn ica_fnc_autoEquipador;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pilotoCNP: RscButton
		{
			idc = 1620;
			text = "Piloto CNP"; //--- ToDo: Localize;
			onButtonClick = "['pilotoCNP'] spawn ica_fnc_autoEquipador;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class atgc: RscButton
		{
			idc = 1621;
			text = "ATGC"; //--- ToDo: Localize;
			onButtonClick = "['atgc'] spawn ica_fnc_autoEquipador;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class jefaturaATGC: RscButton
		{
			idc = 1623;
			text = "Jefatura ATGC"; //--- ToDo: Localize;
			onButtonClick = "['jefaturaATGC'] spawn ica_fnc_autoEquipador;";
			x = 0.407158 * safezoneW + safezoneX;
			y = 0.642947 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class uip: RscButton
		{
			idc = 1622;
			text = "UIP"; //--- ToDo: Localize;
			onButtonClick = "['uip'] spawn ica_fnc_autoEquipador;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
