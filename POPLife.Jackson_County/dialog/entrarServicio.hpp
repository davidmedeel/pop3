
#define ST_CENTER 0x02

class entrarServicio {
   idd = 8000;
   name = "entrarServicio";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
       class Fond: life_RscPicture
       {
           x = 0.254166666666667 * safezoneW + safezoneX;
           y = 0.0960914454277286 * safezoneH + safezoneY;
           w = 0.5 * safezoneW;
           h = 0.85 * safezoneH;
           idc = 8001;
           text = "";
       };
   };

   class controls {

       class Prendre: Life_RscButtonMenu
       {
           idc = 8002;
           x = 0.362083333333333 * safezoneW + safezoneX;
           y = 0.789311701081612 * safezoneH + safezoneY;
           w = 0.143 * safezoneW;
           h = 0.043 * safezoneH;
           animtexturenormal = "";
           animtexturedisabled = "";
           animtextureover = "";
           animtexturefocused = "";
           animtexturepressed = "";
           animtexturedefault = "";
       };
       class Arreter: Life_RscButtonMenu
       {
           idc = 8003;
           x = 0.504791666666666 * safezoneW + safezoneX;
           y = 0.789311701081612 * safezoneH + safezoneY;
           w = 0.143 * safezoneW;
           h = 0.043 * safezoneH;
           animtexturenormal = "";
           animtexturedisabled = "";
           animtextureover = "";
           animtexturefocused = "";
           animtexturepressed = "";
           animtexturedefault = "";
       };
       class Liste: Life_RscListBox
       {
           idc = 8004;
           w = 0.21 * safezoneW;
           h = 0.4 * safezoneH;
           colorbackground[] = {1,1,1,0};
           sizeex = 0.0465;
           x = 0.403645833333334 * safezoneW + safezoneX;
           y = 0.344768928220256 * safezoneH + safezoneY;
           style = ST_CENTER + 16;
           colorSelectBackground[] = {1, 1, 1, 0};
           colorSelectBackground2[] = {1, 1, 1, 0};

       };
       class Texte: Life_RscStructuredText
       {
           idc = 1000;
           x = 0.362083333333333 * safezoneW + safezoneX;
           y = 0.2757 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.285 * safezoneW;
       };
   };
};
