class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class acciones {};
		class setupEVH {};
		class inicio {};
	};
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminMenu {};
		class adminQuery {};
		class debug {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicMarkers {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
	};

	class Actions
	{
		file = "core\actions";
		class arrestAction {};
		class buyLicense {};
		class pushVehicle {};
		class serviceChopper {};
		class serviceTruck {};
		class postBail {};
		class escortAction {};
		class impoundAction {};
		class impoundActionCiv {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupMoney {};
		class ticketAction {};
		class storeVehicle {};
		class robAction {};
		class surrender {};
		class civRestrainAction {};
		class playSound {};
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class alarmHouse {};
		class lockHouse {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class varToStr {};
		class impoundPrice {};
		class taxRate {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class opDefault {};

		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_militar {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {};
		class clothing_ems {};

	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveMoney {};
		class p_updateMenu {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class revokeLicense {};
		class wantedadd2 {};
		class wanted2 {};
	};

	class Functions
	{
		file = "core\functions";
		class fetchCfgDetails {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveMoney {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class showProgress {};
		class stripDownPlayer {};
		class enablecollisionwith {};
  		class disablecollisionwith {};
		class fadeSound {};
		class purge {};
		// tienda 3d
		class hideObj {};
		class searchPosEmpty {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class jumpFnc {};
	};

	class Civilian
	{
		file = "core\civilian";
		class AAN {};
		class pubAAN {};
        class civInteractionMenu {};
		class jailMe {};
		class jail {};
		class tazed {};
		class freezePlayer {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class civLoadout {};
		class civRestrain {};
		class civMarkers {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class lockVehicle {};
		class vehicleOwners {};
		class vInteractionMenu {};
		class insurance {};
		class addVehicle2Chain {};
		class civVInteractionMenu {};
        class medVInteractionMenu {};
		// TIENDA 3D
		class vehicleColor3DRefresh {};
	};

	class Cop
	{
		file = "core\cop";
		class copOpener {};
		class copMarkers {};
		class copLights {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class Sirenas {};
		class spikeStripEffect {};
		class radar {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
	//	class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class fastRope {};
		class removeWeaponAction {};
		class removeWeapons {};
		class copEnter {};
		class confiscardinero {};
	};
	
		class ChalecoBomba
	{
		file = "quickskill\terroristas";
		class comprarChalecoBomba {};
	};


	class op
	{
		file = "core\op";
		class loadGearop {};
		class saveGearop {};
	};

	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		//class weaponShopMenuSP {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		// TIENDA COCHES 3D
		class vehicleShop3DPreview {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
	};

	class Items
	{
		file = "core\items";
		class lockpick {};
		class storagebox {};

	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
		class gangWithdraw {};
	};

	class Tonterias {
		file = "rosen\tonterias";
		class sentarse {};
		class levantarse {};
		class borracho {};
	};
};


class BWLoadCalc
{
    class BW_Functions
    {
        file = "Neoxan\BW_LoadCalc\functions";
        class MotherLoad_Display {};
		class GEARMONITOR {};
		class WEIGHTMONITOR {};
		class Init {postInit = 1;};

    };
};

class Akryllax {
	tag = "life";

	class CopBadge
	{
		file = "core\AKR\CopBadge";
		class seeBadge {};
		class showBadge {};
	};

	class DNI
	{
		file = "core\AKR\DNI";
		class seeDNI {};
		class showDNI {};
		class seedniFalso {};
		class showdniFalso {};
	};

	class Racing
	{
		file = "core\akr\racing";
		class extras {};
		class initRacing {};
		class loadTrack {};
		class loadVehicle {};
		class raceAskSession {};
		class raceCheckStatus {};
		class raceConf {};
		class racingEnded {};
		class racingResponse {};
		class startRace {};
		class startTrackAction{};
		class testing {};

	};

	class EventHandlers
	{
		file = "core\AKR\EventHandlers";
		class onIngameKilled {};
		class onIngameReborn {};
	};

	class EMP_Grenade
	{
		file = "core\AKR\EMP_Grenade";
		class asyncInit {};
		class castEMP {};
		class dropMP {};
		class EMPEH {};
		class HandleDamage {};
		class recieveEMP {};
		class say3DMP {};
		class shutdownCar {};
	};

	class EMP_EH
	{
		file = "core\AKR\EMP_Grenade\EH";
		class stallEngine {};
		class stallEngineNoSound {};
	};
};

class Blakord
{
	tag = "bk";
	class FrameWork_Dialogs_Functions
	{
		file = "BK_FrameWork\BlackFeameWorkDIalogs\BlackFeameWorkDIalogsScripts";
		class ActionMenuAdd {};	
		class ActionMenuCreate {};
	};
	class FrameWork_Dialogs_Scripts
	{
		file = "BK_FrameWork\BlackFeameWorkDIalogsScripts";
		class Actions_Arrest {};
		class Actions_House {};
		class Actions_Vehicles {};	
	};
};

class Apecengo
{
	tag = "ape";
	class DGT
	{
		file = "ape\dgt";
		class controlvelocidad {};
		class sancion {};
		class calcmulta {};
	}
};

class Medel
{
	tag = "medel";
	class raiz {
		file = "medel";
		class restarts {};
		class anuncioMenu {};
		class anuncioAnonimo {};
	};
};
