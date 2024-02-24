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
        if(int(self.pers["xp"]) >= xpThresholdForLevel(80))
            self setRank( 80, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(79))
            self setRank( 79, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(78))
            self setRank( 78, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(77))
            self setRank( 77, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(76))
            self setRank( 76, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(75))
            self setRank( 75, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(74))
            self setRank( 74, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(73))
            self setRank( 73, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(72))
            self setRank( 72, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(71))
            self setRank( 71, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(70))
            self setRank( 70, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(69))
            self setRank( 69, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(68))
            self setRank( 68, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(67))
            self setRank( 67, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(66))
            self setRank( 66, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(65))
            self setRank( 65, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(64))
            self setRank( 64, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(63))
            self setRank( 63, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(62))
            self setRank( 62, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(61))
            self setRank( 61, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(60))
            self setRank( 60, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(59))
            self setRank( 59, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(58))
            self setRank( 58, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(57))
            self setRank( 57, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(56))
            self setRank( 56, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(55))
            self setRank( 55, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(54))
            self setRank( 54, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(53))
            self setRank( 53, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(52))
            self setRank( 52, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(51))
            self setRank( 51, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(50))
            self setRank( 50, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(49))
            self setRank( 49, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(48))
            self setRank( 48, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(47))
            self setRank( 47, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(46))
            self setRank( 46, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(45))
            self setRank( 45, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(44))
            self setRank( 44, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(43))
            self setRank( 43, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(42))
            self setRank( 42, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(41))
            self setRank( 41, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(40))
            self setRank( 40, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(39))
            self setRank( 39, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(38))
            self setRank( 38, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(37))
            self setRank( 37, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(36))
            self setRank( 36, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(35))
            self setRank( 35, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(34))
            self setRank( 34, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(33))
            self setRank( 33, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(32))
            self setRank( 32, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(31))
            self setRank( 31, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(30))
            self setRank( 30, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(29))
            self setRank( 29, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(28))
            self setRank( 28, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(27))
            self setRank( 27, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(26))
            self setRank( 26, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(25))
            self setRank( 25, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(24))
            self setRank( 24, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(23))
            self setRank( 23, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(22))
            self setRank( 22, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(21))
            self setRank( 21, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(20))
            self setRank( 20, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(19))
            self setRank( 19, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(18))
            self setRank( 18, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(17))
            self setRank( 17, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(16))
            self setRank( 16, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(15))
            self setRank( 15, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(14))
            self setRank( 14, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(13))
            self setRank( 13, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(12))
            self setRank( 12, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(11))
            self setRank( 11, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(10))
            self setRank( 10, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(9))
            self setRank( 9, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(8))
            self setRank( 8, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(7))
            self setRank( 7, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(6))
            self setRank( 6, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(5))
            self setRank( 5, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(4))
            self setRank( 4, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(3))
            self setRank( 3, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(2))
            self setRank( 2, 0 );
        else if(int(self.pers["xp"]) >= xpThresholdForLevel(1))
            self setRank( 1, 0 );
        else
            self setRank( 0, 0 );
        wait 0.05;
    }
}

xpThresholdForLevel(value)
{
    switch (value)
    {
        case 80: return 1400000;
        case 79: return 1375000;
        case 78: return 1350000;
        case 77: return 1325000;
        case 76: return 1300000;
        case 75: return 1275000;
        case 74: return 1250000;
        case 73: return 1225000;
        case 72: return 1200000;
        case 71: return 1175000;
        case 70: return 1150000;
        case 69: return 1125000;
        case 68: return 1100000;
        case 67: return 1075000;
        case 66: return 1050000;
        case 65: return 1025000;
        case 64: return 1000000;
        case 63: return 975000;
        case 62: return 950000;
        case 61: return 925000;
        case 60: return 900000;
        case 59: return 875000;
        case 58: return 850000;
        case 57: return 825000;
        case 56: return 800000;
        case 55: return 775000;
        case 54: return 750000;
        case 53: return 725000;
        case 52: return 700000;
        case 51: return 675000;
        case 50: return 650000;
        case 49: return 625000;
        case 48: return 600000;
        case 47: return 575000;
        case 46: return 550000;
        case 45: return 525000;
        case 44: return 500000;
        case 43: return 475000;
        case 42: return 450000;
        case 41: return 425000;
        case 40: return 400000;
        case 39: return 375000;
        case 38: return 350000;
        case 37: return 325000;
        case 36: return 300000;
        case 35: return 275000;
        case 34: return 250000;
        case 33: return 225000;
        case 32: return 200000;
        case 31: return 175000;
        case 30: return 150000;
        case 29: return 125000;
        case 28: return 100000;
        case 27: return 97500;
        case 26: return 95000;
        case 25: return 92500;
        case 24: return 90000;
        case 23: return 87500;
        case 22: return 85000;
        case 21: return 82500;
        case 20: return 80000;
        case 19: return 77500;
        case 18: return 75000;
        case 17: return 72500;
        case 16: return 70000;
        case 15: return 67500;
        case 14: return 65000;
        case 13: return 62500;
        case 12: return 60000;
        case 11: return 57500;
        case 10: return 55000;
        case 9: return 52500;
        case 8: return 50000;
        case 7: return 47500;
        case 6: return 45000;
        case 5: return 42500;
        case 4: return 40000;
        case 3: return 37500;
        case 2: return 35000;
        case 1: return 1000;
        default: return 0;
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
