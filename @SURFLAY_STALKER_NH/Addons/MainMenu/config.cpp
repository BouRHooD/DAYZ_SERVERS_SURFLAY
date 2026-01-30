class CfgPatches
{
	class MainMenu
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1; 		
		requiredAddons[]={"DZ_Data", "DZ_Scripts", "DZ_Gear_Consumables", "DZ_Vehicles_Wheeled", "DZ_Structures_Residential", "DZ_Sounds_Effects", "DZ_Sounds_Weapons"};
	};
};
class CfgMods
{
	class MainMenu
	{
	    dir = "MainMenu";
	    picture = "";
	    action = "";
	    hideName = 1;
	    hidePicture = 1;
	    name = "MainMenu";
		logoSmall = "";
		logo = "";
		logoOver = "MainMenu";
		tooltip = "MainMenu";
		overview = "MainMenu";
	    credits = "BouRHooD";
	    author = "BouRHooD";
	    authorID = ;
	    version = "1.0";
	    extra = 0;
		
	    type = "mod";
		dependencies[]={"Mission","Game"}; 

	    class defs
	    {	
	    	class gameScriptModule
			{
				value="";
				files[]=
				{
					"MainMenu/scripts/3_Game"
				};
			};
			class missionScriptModule
			{
				value="";
				files[]={"MainMenu/scripts/5_Mission"};
			};			
        };
    };
};