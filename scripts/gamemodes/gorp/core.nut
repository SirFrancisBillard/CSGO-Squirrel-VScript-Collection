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
	ent <- null;
	while ((ent = Entities.FindByName(ent, "gorp_health_station")) != null)
	{			
		owner <- ent.GetOwner();
		origin <- ent.GetOrigin();
		
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
