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
	replacefunc(maps\mp\gametypes\_rank::giveRankXP, ::customgiveRankXP);
	level thread OnPlayerConnected();
}


OnPlayerConnected()
{
	self endon("disconnect");
    for (;;)
    {
        level waittill("connected", player);
		playerfile = "scripts\\EgHap\\" + player.guid + ".txt";
		if(!fileExists(playerfile))
		{
			writeFile(playerfile, "0");
		}
		file = fopen(playerfile, "r");
		player.pers["xp"] = fread(file);
		print(fread(file));
		fclose(file);	

		player iPrintLn("Custom XP made by eghapp");
		player thread yaya();
		
		player thread CurrentLevel();
	}
}

yaya()
{
	self endon("disconnect");
    for(;;)
    {
        rank = levelForXpThreshold(int(self.pers["xp"]));
        self setRank(rank, 0);
        wait 0.05;
    }
}

levelForXpThreshold(threshold) 
{
    if (threshold >= 140000) return 80;
    if (threshold >= 137500) return 79;
    if (threshold >= 135000) return 78;
    if (threshold >= 132500) return 77;
    if (threshold >= 130000) return 76;
    if (threshold >= 127500) return 75;
    if (threshold >= 125000) return 74;
    if (threshold >= 122500) return 73;
    if (threshold >= 120000) return 72;
    if (threshold >= 117500) return 71;
    if (threshold >= 115000) return 70;
    if (threshold >= 112500) return 69;
    if (threshold >= 110000) return 68;
    if (threshold >= 107500) return 67;
    if (threshold >= 105000) return 66;
    if (threshold >= 102500) return 65;
    if (threshold >= 100000) return 64;
    if (threshold >= 97500) return 63;
    if (threshold >= 95000) return 62;
    if (threshold >= 92500) return 61;
    if (threshold >= 90000) return 60;
    if (threshold >= 87500) return 59;
    if (threshold >= 85000) return 58;
    if (threshold >= 82500) return 57;
    if (threshold >= 80000) return 56;
    if (threshold >= 77500) return 55;
    if (threshold >= 75000) return 54;
    if (threshold >= 72500) return 53;
    if (threshold >= 70000) return 52;
    if (threshold >= 67500) return 51;
    if (threshold >= 65000) return 50;
    if (threshold >= 62500) return 49;
    if (threshold >= 60000) return 48;
    if (threshold >= 57500) return 47;
    if (threshold >= 55000) return 46;
    if (threshold >= 52500) return 45;
    if (threshold >= 50000) return 44;
    if (threshold >= 47500) return 43;
    if (threshold >= 45000) return 42;
    if (threshold >= 42500) return 41;
    if (threshold >= 40000) return 40;
    if (threshold >= 37500) return 39;
    if (threshold >= 35000) return 38;
    if (threshold >= 32500) return 37;
    if (threshold >= 30000) return 36;
    if (threshold >= 27500) return 35;
    if (threshold >= 25000) return 34;
    if (threshold >= 22500) return 33;
    if (threshold >= 20000) return 32;
    if (threshold >= 17500) return 31;
    if (threshold >= 15000) return 30;
    if (threshold >= 12500) return 29;
    if (threshold >= 10000) return 28;
    if (threshold >= 9750) return 27;
    if (threshold >= 9500) return 26;
    if (threshold >= 9250) return 25;
    if (threshold >= 9000) return 24;
    if (threshold >= 8750) return 23;
    if (threshold >= 8500) return 22;
    if (threshold >= 8250) return 21;
    if (threshold >= 8000) return 20;
    if (threshold >= 7750) return 19;
    if (threshold >= 7500) return 18;
    if (threshold >= 7250) return 17;
    if (threshold >= 7000) return 16;
    if (threshold >= 6750) return 15;
    if (threshold >= 6500) return 14;
    if (threshold >= 6250) return 13;
    if (threshold >= 6000) return 12;
    if (threshold >= 5750) return 11;
    if (threshold >= 5500) return 10;
    if (threshold >= 5250) return 9;
    if (threshold >= 5000) return 8;
    if (threshold >= 4750) return 7;
    if (threshold >= 4500) return 6;
    if (threshold >= 4250) return 5;
    if (threshold >= 4000) return 4;
    if (threshold >= 3750) return 3;
    if (threshold >= 2500) return 2;
    if (threshold >= 1000) return 1;
    if (threshold >= 0) return 0;
}

checkLevelProgress()
{
    self endon("disconnect");

    currentLevel = levelForXpThreshold(int(self.pers["oldxp"]));
    newLevel = levelForXpThreshold(int(self.pers["xp"]));
	
	currentLevel_int = int(currentLevel) + 1;
	newLevel_int = int(newLevel) + 1;

    if (newLevel_int > currentLevel_int)
    {

        self iPrintLnBold("Congratulations! You have reached level " + newLevel_int + "!");

        self PlayLocalSound("mp_level_up");
    }
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
	
	self thread checkLevelProgress();
}

CurrentLevel()
{
	self endon ("disconnect");
	level endon("game_ended");
	self.hudkillstreak = createFontString ("Objective", 0.75f);
	self.hudkillstreak setPoint ("TOPCENTER", "TOPCENTER", 0, 0);
	self.hudkillstreak.label = &"^4 Current Level: ^7";
	
	while(true)
	{
		currentLevel = levelForXpThreshold(int(self.pers["xp"]));
		currentLevel_int = int(currentLevel) + 1;
		self.hudkillstreak setValue(currentLevel_int);
		wait 0.5;
	}
}

customgiveRankXP(type, value, weapon, sMeansOfDeath, challengeName) 
{
    self endon("disconnect");
		
	playerfile = "scripts\\EgHap\\" + self.guid + ".txt";

	file = fopen(playerfile, "r");
	self.pers["xp"] = fread(file);
	print(fread(file));
	fclose(file);	
	switch( type )
    {
        case "kill":
        case "headshot":
        case "assist":
        case "suicide":
        case "capture":
        case "defend":
        case "return":
        case "pickup":
        case "assault":
        case "plant":
        case "destroy":
        case "save":
        case "defuse":
        case "kill_confirmed":
        case "kill_denied":
        case "tags_retrieved":
        case "team_assist":
        case "kill_bonus":
        case "kill_carrier":
        case "draft_rogue":
        case "survivor":
        case "final_rogue":
        case "gained_gun_rank":
        case "dropped_enemy_gun_rank":
        case "got_juggernaut":
        case "kill_as_juggernaut":
        case "kill_juggernaut":
        case "jugg_on_jugg":
        case "challenge":
		
			self thread maps\mp\gametypes\_rank::xpEventPopup( type + "\n+50" );
			self thread giveXP(50);
            break;
    }
}

