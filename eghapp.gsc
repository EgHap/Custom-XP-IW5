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
	level thread OnPlayerConnected();
}


OnPlayerConnected()
{
    for (;;)
    {
        level waittill("connected", player);
		playerfile = "scripts\\EgHap\\" + player.guid + ".txt";
		if(!fileExists(playerfile))
		{
			writeFile(playerfile, "0");
			fclose(playerfile);
		}
		file = fopen(playerfile, "r");
		player.pers["xp"] = fread(file);
		print(fread(file));
		fclose(file);	
		player iPrintLn("Custom XP made by eghapp");
	}
}


customgetPrestigeLevel()
{
	return 0;
}
customgetRankXP()
{		
	if(isDefined(self.pers["xp"]))
		return int(self.pers["xp"]);
	
	return 0;
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
	self giveXP(50);
	
	self customgetRankXP();
	
	playerfile = "scripts\\EgHap\\" + self.guid + ".txt";

	file = fopen(playerfile, "r");
	self.pers["xp"] = fread(file);
	print(fread(file));
	fclose(file);	
	
}