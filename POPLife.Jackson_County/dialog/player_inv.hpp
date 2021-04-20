class playerSettings {

	idd = 2001;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
	
		class padImage : life_RscPicture {
			idc = 2017;
			text = "";
			x = 0; 
			y = -0.1; 
			
			w = 1;
			h = 1.3;
		};
		
		//?????? ??????
		
		class PhoneImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-phone.paa";
			
			x = 0.15; 
			y = 0.29;
			
			w = 0.04;
			h = 0.055;
		};
		
		class PhoneButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [0] spawn ext_fnc_spawnPhone";
			tooltip = "???????? ????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.15; 
			y = 0.29;
			
			w = 0.04;
			h = 0.055;
		};
		
		class KeysImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-keys.paa";
			
			x = 0.23; 
			y = 0.29;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class KeysButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "createDialog ""Life_key_management""";
			tooltip = "?????????? ?????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.23; 
			y = 0.29;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class CraftImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-craft.paa";
			
			x = 0.15; 
			y = 0.38;
					
			w = 0.04;
			h = 0.055;
		};
		
		class CraftButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; createDialog ""Life_craft""";
			tooltip = "????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.15; 
			y = 0.38;
					
			w = 0.04;
			h = 0.055;
		};
		
		class HealImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-heal.paa";
			
			x = 0.23; 
			y = 0.38;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class HealButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn ext_fnc_healMenu";
			tooltip = "???????? ????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.23; 
			y = 0.38;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class CrimeImage : life_RscPicture {
			idc = 2013;
			text = "\ext_pack\icons\ui\icon-crime.paa";
			
			x = 0.15; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		class CrimeButton: Life_PictureButtonMenu
		{
			idc = 2012;
			text = "";	
			onButtonClick = "[] call ext_fnc_wantedMenu";
			tooltip = "??????? ??????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.15; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		
		class GangImage : life_RscPicture {
			idc = 2019;
			text = "\ext_pack\icons\ui\icon-gang.paa";
			
			x = 0.15; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		class GangButton: Life_PictureButtonMenu
		{
			idc = 2011;
			text = "";	
			onButtonClick = "if(!(life_action_gangInUse)) then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {closeDialog 0; [] spawn ext_fnc_gangMenu;};};";
			tooltip = "?????????? ????????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.15; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		
		class MedicImage : life_RscPicture {
			idc = 2025;
			text = "\ext_pack\icons\ui\icon-911.paa";
			
			x = 0.23; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		class MedicButton: Life_PictureButtonMenu
		{
			idc = 2026;
			text = "";	
			onButtonClick = "[] call ext_fnc_medicMenu";
			tooltip = "???? ?????????? ???";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.23; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		
		
		class InfoImage : life_RscPicture {
			idc = 2028;
			text = "\ext_pack\icons\ui\icon-info.paa";
			
			x = 0.23; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		
		class InfoButton: Life_PictureButtonMenu
		{
			idc = 2027;
			text = "";	
			onButtonClick = "[] call ext_fnc_openGovMenu";
			tooltip = "?????? ?????? ???????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.23; 
			y = 0.47;
					
			w = 0.04;
			h = 0.055;
		};
		

		
		
		
		
		class DonateImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-donate.paa";
			
			x = 0.15; 
			y = 0.66;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class DonateButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "createDialog ""w_donat""";
			tooltip = "?????????? ??????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.15; 
			y = 0.66;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class AdminImage : life_RscPicture {
			idc = 2020;
			text = "\ext_pack\icons\ui\icon-admin.paa";
			
			x = 0.23; 
			y = 0.66;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class AdminButton: Life_PictureButtonMenu
		{
			idc = 2021;
			text = "";	
			onButtonClick = "createDialog ""life_admin_menu""";
			tooltip = "????????????????? ???????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.23; 
			y = 0.66;		
			
			w = 0.04;
			h = 0.055;
		};
		
		
		
		
		
		
		class SettingsImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-settings.paa";
			
			x = 0.15; 
			y = 0.75;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class SettingButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn ext_fnc_settingsMenu";
			tooltip = "?????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.15; 
			y = 0.75;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class SaveImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-save.paa";
			
			x = 0.23; 
			y = 0.75;		
			
			w = 0.04;
			h = 0.055;
		};
		
		class SaveButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "[] call SOCK_fnc_syncData";
			tooltip = "??????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.23; 
			y = 0.75;		
			
			w = 0.04;
			h = 0.055;
		};
		
		
		
		
		//?????? ??????
		class UseImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-use.paa";
			
			x = 0.63; 
			y = 0.685;		
			
			w = 0.045;
			h = 0.055;
		};
		
		class UseButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "[] call ext_fnc_useItem";
			tooltip = "???????????? ???????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.63; 
			y = 0.685;		
			
			w = 0.045;
			h = 0.055;
		};
		
		class MoveImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-move.paa";
			
			x = 0.69; 
			y = 0.685;		
			
			w = 0.045;
			h = 0.055;
		};
		
		class MoveButton: Life_PictureButtonMenu
		{
			idc = 2002;
			text = "";	
			onButtonClick = "[] call ext_fnc_giveItem";
			tooltip = "???????? ???????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.69; 
			y = 0.685;		
			
			w = 0.045;
			h = 0.055;
		};
		
		class DelImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-delete.paa";
			
			x = 0.85; 
			y = 0.685;		
			
			w = 0.035;
			h = 0.045;
		};
		
		class DelButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "[] call ext_fnc_removeItem";
			tooltip = "??????? ???????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.85; 
			y = 0.685;		
			
			w = 0.035;
			h = 0.045;
		};
		
		
		
		/*class BackButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "";
			tooltip = "????????? ? ??????? ????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.405; 
			y = 0.84;		
			
			w = 0.032;
			h = 0.045;
		};*/
		
		class HomeButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "???????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.485; 
			y = 0.84;		
			
			w = 0.032;
			h = 0.045;
		};
		
		
	};
	
	class controls {
		
		class itemHeader : Life_RscText
		{
			idc = 2009;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.03;
			
			x = 0.62; 
			y = 0.26;
			
			w = 0.275; 
			h = 0.04;
		};
		
		class itemList : life_RscListBox 
		{
			idc = 2005;
			sizeEx = 0.027;
			
			x = 0.62; 
			y = 0.306;
			
			w = 0.275; 
			h = 0.295;
		};
		
		class itemEdit : Life_RscEdit {
		
			idc = 2010;			
			text = "1";
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.03;
			
			x = 0.62; 
			y = 0.6;
			
			w = 0.275;
			h = 0.035;
		
		};
		
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.62; 
			y = 0.64;
			w = 0.275; h = 0.03;
		};
		
		
		class eXpoints : Life_RscStructuredText
		{
			idc = 2016;			
			text = "";
			sizeEx = 0.03;
			
			x = 0.62; 
			y = 0.77;
			
			w = 0.275; 
			h = 0.04;
		};
		
		
		class MoneyHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "???????";
			sizeEx = 0.03;
			
			x = 0.335;
			y = 0.26;
			
			w = 0.275; 
			h = 0.04;
		};
		
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			
			x = 0.335;
			y = 0.315;
			
			w = 0.25; 
			h = 0.11;
		};		
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.03;
			colorBackground[] = {0,0,0,0.5};
			
			x = 0.335; 
			y = 0.435;
			
			w = 0.19; 
			h = 0.033;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = 0.335; 
			y = 0.475;
			
			w = 0.2; 
			h = 0.03;
		};
		
		class GiveMoneyImage : life_RscPicture {
			idc = -1;
			text = "\ext_pack\icons\ui\icon-gmoney.paa";
			
			x = 0.555; 
			y = 0.44;		
			
			w = 0.045;
			h = 0.055;
		};
		
		class GiveMoneyButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "[] call ext_fnc_giveMoney";
			tooltip = "???????? ??????????";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.555;
			y = 0.44;		
			
			w = 0.045;
			h = 0.055;
		};
		
		
		
		class licenseHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_Licenses";
			sizeEx = 0.03;
			
			x = 0.336; 
			y = 0.52;
			
			w = 0.275; 
			h = 0.04;
		};
		
		class LicenseList : life_RscListBox 
		{
			idc = 2014;
			sizeEx = 0.027;
			
			x = 0.336;
			y = 0.566;
			
			w = 0.275;
			h = 0.25;
		};
				
	};
};