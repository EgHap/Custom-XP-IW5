#include maps\mp\gametypes\_rank;

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
		player.isBot = 0;
		
		if(isSubStr(player.guid, "bot"))
		{
			player.isBot = 1;
		}
		else
		{
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
}

OnPlayerConnected()
{
    for (;;)
    {
        level waittill("connected", player);
		player iPrintLn("Custom XP made by eghapp");
	}
}

customgetPrestigeLevel()
{
	if(self.isBot != 1)
		return 0;
	return 20;
}
customgetRankXP()
{		
	if(self.isBot != 1)
		return int(self.pers["xp"]);
	return 80000;
}

giveXP(amount) 
{
    playerfile = "scripts\\EgHap\\" + self.guid + ".txt";
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
	if(self.isBot != 1)
	{
		self giveXP(50);
		self customgetRankXP();
	
		playerfile = "scripts\\EgHap\\" + self.guid + ".txt";

		file = fopen(playerfile, "r");
		self.pers["xp"] = fread(file);
		print(fread(file));
		fclose(file);	
	}
}
