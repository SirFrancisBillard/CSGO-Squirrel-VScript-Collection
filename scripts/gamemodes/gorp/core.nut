::GORP_LONGNAME <- "Global Offensive Roleplay";
::GORP_SHORTNAME <- "GORP";
::GORP_VERSION <- "v0.1 ALPHA";
::GORP_AUTHOR <- "Sir Francis Billard";

SendToConsole("echo GORP core script loaded");

SendToConsoleServer("mp_roundtime 9999999999");
SendToConsoleServer("mp_roundtime_defuse 9999999999");
SendToConsoleServer("mp_roundtime_hostage 9999999999");
SendToConsoleServer("mp_teammates_are_enemies 1");
SendToConsoleServer("mp_buy_anywhere 1");
SendToConsoleServer("mp_limitteams 0");
SendToConsoleServer("mp_autoteambalance 0");
SendToConsoleServer("mp_maxmoney 1000000");
SendToConsoleServer("mp_buytime 9999999999");
SendToConsoleServer("mp_teamname_1 \"Police\"");
SendToConsoleServer("mp_teamname_2 \"Gangsters\"");
SendToConsoleServer("mp_teammatchstat_txt \"Roleplay\"");
SendToConsoleServer("mp_teammatchstat_1 \"Fighting crime\"");
SendToConsoleServer("mp_teammatchstat_2 \"Fuck da police!\"");
SendToConsoleServer("mp_teamprediction_txt \"Economy\"");
SendToConsoleServer("mp_teammatchstat_2 50");

SendToConsoleServer("mp_warmup_end");
SendToConsoleServer("mp_restartgame 1");

HEALTH_STATION_RADIUS <- 128;
HEALTH_STATION_HEALTH <- 1;

function Think()
{
	SendToConsole("echo Think function has been run");
	
	decoy <- null;
	while ((decoy = Entities.FindByClassname(decoy, "decoy_projectile")) != null)
	{
		if(decoy.GetVelocity().Length() == Vector(0,0,0).Length())
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
}