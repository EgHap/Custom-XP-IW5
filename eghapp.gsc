#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_hud_util;

init()
{
	level.directory = "scripts\\EgHap";
	if(!directoryExists(level.directory))
	{
		print("missing dir, creating new one...");
		createDirectory(level.directory);
	}	
	replacefunc(maps\mp\gametypes\_rank::getPrestigeLevel, ::customgetPrestigeLevel);
	replacefunc(maps\mp\gametypes\_rank::getRankXP, ::customgetRankXP);
	replacefunc(maps\mp\gametypes\_rank::giveRankXP, ::customgiveRankXP);
	level thread OnPlayerConnecting();
	level thread OnPlayerConnected();
}


OnPlayerConnecting()
{
    for (;;)
    {
        level waittill("connected", player);
		playerfile = "scripts\\EgHap\\" + player.guid + ".txt";
		if(!fileExists(playerfile))
		{
			writeFile(playerfile, "0");
			fclose(1);
		}
		file = fopen(playerfile, "r");
		player.pers["xp"] = fread(file);
		print(fread(file));
		fclose(file);	
	}
}

OnPlayerConnected()
{
    for (;;)
    {
        level waittill("connected", player);
		player iPrintLn("Custom XP made by eghapp");
		//customgetRankXP();
	}
}

customgetPrestigeLevel()
{
	return 0;
}
customgetRankXP()
{		
	return int(self.pers["xp"]);
}

giveXP(player, amount) 
{
    playerfile = "scripts\\EgHap\\" + player.guid + ".txt";
    file = fopen(playerfile, "r");
    self.pers["oldxp"] = fread(file);
    fclose(file);

    self.pers["xp"] = int(self.pers["oldxp"]) + int(amount);
    fremove(playerfile);
    writeFile(playerfile, str(self.pers["xp"]));
}

customgiveRankXP(type, value, weapon, sMeansOfDeath, challengeName) 
{
    self endon("disconnect");
    giveXP(self, 50);
}
