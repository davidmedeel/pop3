
/*class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Title : Life_RscTitle {			
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.324246 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.351508 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class balancebg: Life_RscText
		{
			idc = -1;
			x = 0.324246 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.160246 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class sendbg: Life_RscText
		{
			idc = -1;
			x = 0.489662 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.186092 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {

		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.329416 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.149908 * safezoneW;
			h = 0.088 * safezoneH;
		};		
				
		class WithdrawButton : Life_RscShopButton 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";			
			onButtonClick = "[] call life_fnc_bankWithdraw";
			
			x = 0.324246 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0775384 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class DepositButton : Life_RscShopButton 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";			
			onButtonClick = "[] call life_fnc_bankDeposit";
			
			x = 0.406954 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0775384 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class moneyEdit : Life_RscEdit {		
			idc = 2702;
			text = "1";
		
			x = 0.329416 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.149908 * safezoneW;
			h = 0.022 * safezoneH;
		
		};
		
		class PlayerList : Life_RscListBox 
		{
			idc = 2703;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
			x = 0.494831 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.175754 * safezoneW;
			h = 0.242 * safezoneH;
		};
		
		class TransferButton : Life_RscShopButton 
		{
			idc = -1;
			text = "$STR_ATM_Transfer";			
			onButtonClick = "[] call life_fnc_bankTransfer";
			x = 0.5672 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.103385 * safezoneW;
			h = 0.033 * safezoneH;
		};
        class retirarBanda: Life_RscShopButton
        {
	        idc = 2705;
	        text = "Retirar de la Mafia"; //--- ToDo: Localize;
	        onButtonClick = "[] call life_fnc_gangWithdraw";
	        x = 0.324275 * safezoneW + safezoneX;
	        y = 0.533 * safezoneH + safezoneY;
	        w = 0.160246 * safezoneW;
	        h = 0.044 * safezoneH;
       };
        class depositarBanda: Life_RscShopButton
        {
	        idc = 2706;
	        text = "Depositar en la Mafia"; //--- ToDo: Localize;
	        onButtonClick = "[] call life_fnc_gangDeposit";
	        x = 0.324275 * safezoneW + safezoneX;
	        y = 0.588 * safezoneH + safezoneY;
	        w = 0.160246 * safezoneW;
	        h = 0.044 * safezoneH;
       };
	};
};
*/

class Life_atm_management {
    idd = 2700;
    name= "Life_atm_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Title : Life_RscTitle {            
            idc = -1;
            text = "$STR_ATM_Title";
            x = 0.324246 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.351508 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class balancebg: Life_RscText
        {
            idc = -1;
            x = 0.324246 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.160246 * safezoneW;
            h = 0.143 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class sendbg: Life_RscText
        {
            idc = -1;
            x = 0.489662 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.186092 * safezoneW;
            h = 0.308 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
    };

    class controls {
        class CashTitle : Life_RscStructuredText
        {
            idc = 2701;
            text = "";
            
            x = 0.329416 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.149908 * safezoneW;
            h = 0.088 * safezoneH;
        };        
                
        class WithdrawButton : Life_RscShopButton 
        {
            idc = -1;
            text = "$STR_ATM_Withdraw";            
            onButtonClick = "[] call life_fnc_bankWithdraw";
            
            x = 0.324246 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.0775384 * safezoneW;
            h = 0.044 * safezoneH;
        };
        
        class DepositButton : Life_RscShopButton 
        {
            idc = -1;
            text = "$STR_ATM_Deposit";            
            onButtonClick = "[] call life_fnc_bankDeposit";
            
            x = 0.406954 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.0775384 * safezoneW;
            h = 0.044 * safezoneH;
        };
        
        class moneyEdit : Life_RscEdit {        
            idc = 2702;
            text = "1";
        
            x = 0.329416 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.149908 * safezoneW;
            h = 0.022 * safezoneH;
        
        };
        
        class PlayerList : Life_RscListBox 
        {
            idc = 2703;
            
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
            x = 0.494831 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.175754 * safezoneW;
            h = 0.242 * safezoneH;
        };
        
        class TransferButton : Life_RscShopButton 
        {
            idc = -1;
            text = "$STR_ATM_Transfer";            
            onButtonClick = "[] call life_fnc_bankTransfer";
            
            x = 0.608281 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class retirarBanda: Life_RscShopButton
        {
	        idc = 2705;
	        text = "Retirar de la Mafia"; //--- ToDo: Localize;
	        onButtonClick = "[] call life_fnc_gangWithdraw";
	        x = 0.324275 * safezoneW + safezoneX;
	        y = 0.533 * safezoneH + safezoneY;
	        w = 0.160246 * safezoneW;
	        h = 0.044 * safezoneH;
       };
        class depositarBanda: Life_RscShopButton
        {
	        idc = 2706;
	        text = "Depositar en la Mafia"; //--- ToDo: Localize;
	        onButtonClick = "[] call life_fnc_gangDeposit";
	        x = 0.324275 * safezoneW + safezoneX;
	        y = 0.588 * safezoneH + safezoneY;
	        w = 0.160246 * safezoneW;
	        h = 0.044 * safezoneH;
       };
        class find : Life_RscEdit {        
            idc = 2704;
            text = "";
        
            x = 0.5 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        
        };

    };
};