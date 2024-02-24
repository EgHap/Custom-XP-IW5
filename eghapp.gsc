#include maps\mp\gametypes\_rank;

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
		player thread yaya();
	}
}

yaya()
{
    for(;;)
    {
        rank = levelForXpThreshold(int(self.pers["xp"]));
        self setRank(rank, 0);
        wait 0.05;
    }
}

levelForXpThreshold(threshold) 
{
    if (threshold >= 1400000) return 80;
    if (threshold >= 1375000) return 79;
    if (threshold >= 1350000) return 78;
    if (threshold >= 1325000) return 77;
    if (threshold >= 1300000) return 76;
    if (threshold >= 1275000) return 75;
    if (threshold >= 1250000) return 74;
    if (threshold >= 1225000) return 73;
    if (threshold >= 1200000) return 72;
    if (threshold >= 1175000) return 71;
    if (threshold >= 1150000) return 70;
    if (threshold >= 1125000) return 69;
    if (threshold >= 1100000) return 68;
    if (threshold >= 1075000) return 67;
    if (threshold >= 1050000) return 66;
    if (threshold >= 1025000) return 65;
    if (threshold >= 1000000) return 64;
    if (threshold >= 975000) return 63;
    if (threshold >= 950000) return 62;
    if (threshold >= 925000) return 61;
    if (threshold >= 900000) return 60;
    if (threshold >= 875000) return 59;
    if (threshold >= 850000) return 58;
    if (threshold >= 825000) return 57;
    if (threshold >= 800000) return 56;
    if (threshold >= 775000) return 55;
    if (threshold >= 750000) return 54;
    if (threshold >= 725000) return 53;
    if (threshold >= 700000) return 52;
    if (threshold >= 675000) return 51;
    if (threshold >= 650000) return 50;
    if (threshold >= 625000) return 49;
    if (threshold >= 600000) return 48;
    if (threshold >= 575000) return 47;
    if (threshold >= 550000) return 46;
    if (threshold >= 525000) return 45;
    if (threshold >= 500000) return 44;
    if (threshold >= 475000) return 43;
    if (threshold >= 450000) return 42;
    if (threshold >= 425000) return 41;
    if (threshold >= 400000) return 40;
    if (threshold >= 375000) return 39;
    if (threshold >= 350000) return 38;
    if (threshold >= 325000) return 37;
    if (threshold >= 300000) return 36;
    if (threshold >= 275000) return 35;
    if (threshold >= 250000) return 34;
    if (threshold >= 225000) return 33;
    if (threshold >= 200000) return 32;
    if (threshold >= 175000) return 31;
    if (threshold >= 150000) return 30;
    if (threshold >= 125000) return 29;
    if (threshold >= 100000) return 28;
    if (threshold >= 97500) return 27;
    if (threshold >= 95000) return 26;
    if (threshold >= 92500) return 25;
    if (threshold >= 90000) return 24;
    if (threshold >= 87500) return 23;
    if (threshold >= 85000) return 22;
    if (threshold >= 82500) return 21;
    if (threshold >= 80000) return 20;
    if (threshold >= 77500) return 19;
    if (threshold >= 75000) return 18;
    if (threshold >= 72500) return 17;
    if (threshold >= 70000) return 16;
    if (threshold >= 67500) return 15;
    if (threshold >= 65000) return 14;
    if (threshold >= 62500) return 13;
    if (threshold >= 60000) return 12;
    if (threshold >= 57500) return 11;
    if (threshold >= 55000) return 10;
    if (threshold >= 52500) return 9;
    if (threshold >= 50000) return 8;
    if (threshold >= 47500) return 7;
    if (threshold >= 45000) return 6;
    if (threshold >= 42500) return 5;
    if (threshold >= 40000) return 4;
    if (threshold >= 37500) return 3;
    if (threshold >= 35000) return 2;
    if (threshold >= 1000) return 1;
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
	self giveXP(100);
		
	playerfile = "scripts\\EgHap\\" + self.guid + ".txt";

	file = fopen(playerfile, "r");
	self.pers["xp"] = fread(file);
	print(fread(file));
	fclose(file);	
	self thread maps\mp\gametypes\_rank::xpEventPopup( "+50" );
}
