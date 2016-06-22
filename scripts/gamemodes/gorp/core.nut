::GORP_LONGNAME <- "Global Offensive Roleplay";
::GORP_SHORTNAME <- "GORP";
::GORP_VERSION <- "v0.1 ALPHA";
::GORP_AUTHOR <- "Sir Francis Billard";

::CT <- 2;
::T <- 3;

SendToConsole("echo GORP core script loaded");

SendToConsoleServer("mp_roundtime 9999999999");
SendToConsoleServer("mp_roundtime_defuse 9999999999");
SendToConsoleServer("mp_roundtime_hostage 9999999999");
SendToConsoleServer("mp_ignore_round_win_conditions 1");
SendToConsoleServer("mp_teammates_are_enemies 1");
SendToConsoleServer("mp_buy_anywhere 1");
SendToConsoleServer("mp_limitteams 0");
SendToConsoleServer("mp_autoteambalance 0");
SendToConsoleServer("mp_give_player_c4 0");
SendToConsoleServer("mp_startmoney 200");
SendToConsoleServer("mp_maxmoney 1000000");
SendToConsoleServer("mp_buytime 9999999999");
SendToConsoleServer("mp_teamname_1 \"Police\"");
SendToConsoleServer("mp_teamname_2 \"Citizens\"");
SendToConsoleServer("mp_teammatchstat_txt \"Roleplay\"");
SendToConsoleServer("mp_teammatchstat_1 \"Wee-oo wee-oo\"");
SendToConsoleServer("mp_teammatchstat_2 \"Howdy doody!\"");
SendToConsoleServer("mp_teamprediction_txt \"Economy\"");
SendToConsoleServer("mp_teammatchstat_2 50");

SendToConsoleServer("mp_warmup_end");
SendToConsoleServer("mp_restartgame 1");

HEALTH_STATION_RADIUS <- 128;
HEALTH_STATION_HEALTH <- 1;

SALARY_DELAY <- 120.0;
SALARY_AMOUNT <- 200;
SALARY_MESSAGE <- "Payday!";
SALARY_GIVER <- Entities.CreateByClassname("game_money");
SALARY_GIVER.__KeyValueFromString("AwardText", SALARY_MESSAGE);
SALARY_GIVER.__KeyValueFromInt("Money", SALARY_AMOUNT);
SALARY_TIMER <- Time() + SALARY_DELAY;

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
}

function GORP_CreateJob(nm, mdl, tm, hp)
{
	PrecacheModel(mdl);
	JobTable <- {name = nm, model = mdl, team = tm, health = hp};
	return JobTable;
}

//Examples of how to properly create jobs
//In the third slot: 2 = CT, 3 = T
::TEAM_CITIZEN <- GORP_CreateJob("Citizen", "models/characters/hostage_03.mdl", 3, 100);
::TEAM_POLICE <- GORP_CreateJob("Police", "models/player/ctm_sas.mdl", 2, 100);
::TEAM_MEDIC <- GORP_CreateJob("Medic", "models/characters/hostage_04.mdl", 3, 100);
::TEAM_GANGSTER <- GORP_CreateJob("Gangster", "models/player/tm_anarchist_variantd.mdl", 3, 100);

function SetJob(ply, jobtbl)
{
	PrecacheModel(jobtbl.model);
	if (ply.IsValid() and ply.GetClassname == "player")
	{
		ply.__KeyValueFromString("targetname", jobtbl.name);
		ply.SetModel(jobtbl.model);
		ply.SetTeam(jobtbl.team);
		ply.SetMaxHealth(jobtbl.health);
		ply.SetHealth(jobtbl.health);
	}
}

function Think()
{
	SendToConsole("echo Think function has started...");

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

			owner.SetOrigin(origin);
			decoy.Destroy();
		}
	}

	health_station <- null;
	while ((health_station = Entities.FindByName(health_station, "gorp_health_station")) != null)
	{			
		owner <- health_station.GetOwner();
		origin <- health_station.GetOrigin();

		ply <- null;
		while (ply = Entities.FindByClassnameWithin(ply, "player", origin, HEALTH_STATION_RADIUS) != null)
		{
			if (ply.GetHealth() < ply.GetMaxHealth())
			{
				ply.SetHealth(ply.GetHealth() + HEALTH_STATION_HEALTH);
			}
		}
	}

	SendToConsole("echo Think function successful!");
}
