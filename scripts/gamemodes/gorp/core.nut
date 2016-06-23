::GORP_LONGNAME <- "Global Offensive Roleplay";
::GORP_SHORTNAME <- "GORP";
::GORP_VERSION <- "v0.1 ALPHA";
::GORP_AUTHOR <- "Sir Francis Billard";

::CT <- 2;
::T <- 3;

SendToConsole("echo GORP core script loaded");

SendToConsoleServer("mp_warmup_end");
SendToConsoleServer("mp_roundtime 9999999999");
SendToConsoleServer("mp_roundtime_defuse 9999999999");
SendToConsoleServer("mp_roundtime_hostage 9999999999");
SendToConsoleServer("mp_ignore_round_win_conditions 1");
SendToConsoleServer("mp_teammates_are_enemies 1");
SendToConsoleServer("mp_buy_anywhere 1");
SendToConsoleServer("mp_respawn_on_death_ct 1");
SendToConsoleServer("mp_respawn_on_death_t 1");
SendToConsoleServer("mp_limitteams 0");
SendToConsoleServer("mp_autoteambalance 0");
SendToConsoleServer("mp_give_player_c4 0");
SendToConsoleServer("mp_startmoney 200");
SendToConsoleServer("mp_maxmoney 1000000");
SendToConsoleServer("mp_buytime 9999999999");
SendToConsoleServer("mp_teamname_1 \"Police\"");
SendToConsoleServer("mp_teamname_2 \"Gangsters\"");
SendToConsoleServer("mp_teammatchstat_txt \"Roleplay\"");
SendToConsoleServer("mp_teammatchstat_1 \"Wee-oo wee-oo\"");
SendToConsoleServer("mp_teammatchstat_2 \"Howdy doody!\"");
SendToConsoleServer("mp_teamprediction_txt \"Economy\"");
SendToConsoleServer("mp_teammatchstat_2 50");

HEALTH_STATION_RADIUS <- 128;
HEALTH_STATION_HEALTH <- 1;

MONEY_PRINTER_DELAY <- 4.0;
MONEY_PRINTER_RADIUS <- 128;
MONEY_PRINTER_AMOUNT <- 50;
MONEY_PRINTER_MAX <- 1;  //How many can you have at once?
MONEY_PRINTER_MESSAGE <- "Collected money from a printer.";
MONEY_PRINTER_GIVER <- Entities.CreateByClassname("game_money");
MONEY_PRINTER_GIVER.__KeyValueFromString("targetname", "MONEY_PRINTER_GIVER")
MONEY_PRINTER_GIVER.__KeyValueFromString("AwardText", MONEY_PRINTER_MESSAGE);
MONEY_PRINTER_GIVER.__KeyValueFromInt("Money", MONEY_PRINTER_AMOUNT);
MONEY_PRINTER_TIMER <- Time() + MONEY_PRINTER_DELAY;

SALARY_DELAY <- 120.0;
SALARY_AMOUNT <- 200;
SALARY_MESSAGE <- "Payday!";
SALARY_GIVER <- Entities.CreateByClassname("game_money");
SALARY_GIVER.__KeyValueFromString("AwardText", SALARY_MESSAGE);
SALARY_GIVER.__KeyValueFromInt("Money", SALARY_AMOUNT);
SALARY_TIMER <- Time() + SALARY_DELAY;

::GORP_Reset <- function()
{
	SendToConsole("sv_cheats 1");
	SendToConsole("ent_remove gorp_timer");
	SendToConsole("ent_remove gorp_script");
	money_printer <- null;
	while ((money_printer = Entities.FindByName(money_printer, "gorp_money_printer")) != null)
	{
		money_printer.Destroy();
	}
	SendToConsole("echo GORP has been reset!");
	SendToConsole("sv_cheats 0");
}

function Precache()
{
	Entities.FindByClassname(null, "Player").PrecacheModel("models/props/cs_office/microwave.mdl");
}

function GiveSalaries()
{
	SendToConsole("echo I SAID IT'S FUCKIN' PAYDAY MOTHERFUCKERS");

	EntFireByHandle(SALARY_GIVER, "AddTeamMoneyCT", SALARY_AMOUNT.tostring(), 0.0, SALARY_GIVER, SALARY_GIVER);
	EntFireByHandle(SALARY_GIVER, "AddTeamMoneyTerrorist", SALARY_AMOUNT.tostring(), 0.0, SALARY_GIVER, SALARY_GIVER);
}

GORP_ADVERT_DELAY <- 300.0;
GORP_ADVERT_TIMER <- Time() + GORP_ADVERT_DELAY;

function AdvertGORP()
{
	ScriptPrintMessageChatAll(GORP_SHORTNAME + " " + GORP_VERSION);
	ScriptPrintMessageChatAll("Created by " + GORP_AUTHOR);
	GORP_ADVERT_TIMER <- Time() + GORP_ADVERT_DELAY;
}

function FindInArray(array, match_value)
{
	foreach (index, item in array) {
		if (item == match_value) {
			return index;
		}
	}
}

WhoHasPrinters <- [];

function DoesPlyHavePrinter(ply)
{
	return (FindInArray(WhoHasPrinters, ply) != null);
}

function GivePlyPrinter(ply, giveNotTake)
{
	if (giveNotTake)
	{
		WhoHasPrinters.push(ply);
	} else {
		WhoHasPrinters.remove(FindInArray(WhoHasPrinters, ply));
	}

}

Precache();

function Think()
{
	if (SALARY_TIMER < Time())
	{
		SALARY_TIMER <- Time() + SALARY_DELAY;
		GiveSalaries();
	}

	if (GORP_ADVERT_TIMER < Time())
	{
		AdvertGORP();
	}

	decoy <- null;
	while ((decoy = Entities.FindByClassname(decoy, "decoy_projectile")) != null)
	{
		if (decoy.GetVelocity().Length() == Vector(0,0,0).Length())
		{
			owner <- decoy.GetOwner();
			origin <- decoy.GetOrigin();
			if (!DoesPlyHavePrinter(owner))
			{
				printer <- Entities.CreateByClassname("prop_physics");
				printer.SetModel("models/props/cs_office/microwave.mdl");
				printer.__KeyValueFromString("targetname", "gorp_money_printer");
				printer.SetOrigin(origin);
				printer.SetOwner(owner);
				EntFireByHandle(printer, "EnableMotion", "", 0.0, owner, owner)
				EntFireByHandle(printer, "Wake", "", 0.0, owner, owner)
				GivePlyPrinter(owner, true)
			}

			decoy.Destroy();
		}
	}

	money_printer <- null;
	while ((money_printer = Entities.FindByName(money_printer, "gorp_money_printer")) != null)
	{
		owner <- money_printer.GetOwner();
		origin <- money_printer.GetOrigin();
		
		if (RandomInt(1, 50000) == 1)
		{
			SendToConsole("echo PRINTER IGNITED")
			EntFireByHandle(money_printer, "Ignite", "", 0.0, owner, owner)
			EntFireByHandle(money_printer, "Kill", "", 4.0, owner, owner)
			GivePlyPrinter(owner, false);
		}

		ply <- null;
		while ((ply = Entities.FindByClassnameWithin(ply, "Player", origin, MONEY_PRINTER_RADIUS)) != null)
		{
			SendToConsole("echo We found a player near the printer...")
			if (MONEY_PRINTER_TIMER < Time())
			{
				SendToConsole("echo We got past the timer...")
				if (ply.GetTeam() == 2)
				{
					SendToConsole("echo Giving money CT...")
					EntFireByHandle(MONEY_PRINTER_GIVER, "AddTeamMoneyTerrorist", MONEY_PRINTER_AMOUNT.tostring(), 0.0, ply, ply);
				} else {
					if (ply.GetTeam() == 3)
					{
						SendToConsole("echo Radio code:")
						EntFireByHandle(MONEY_PRINTER_GIVER, "AddTeamMoneyCT", MONEY_PRINTER_AMOUNT.tostring(), 0.0, ply, ply);
					}
				}
				SendToConsole("echo We reset the timer...")
				MONEY_PRINTER_TIMER <- Time() + MONEY_PRINTER_DELAY;
			}
		}
	}
}
