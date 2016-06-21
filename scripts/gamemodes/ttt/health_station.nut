HEALTH_STATION_RADIUS <- 128;
HEALTH_STATION_HEALTH <- 1;

function Think()
{
	ent <- null;
	
	while ((ent = Entities.FindByName(ent, "ttt_health_station")) != null)
	{			
		owner <- ent.GetOwner();
		origin <- ent.GetOrigin();	
		ply <- null;
		
		while ((ply = Entities.FindByClassnameWithin(ply, "player", origin, HEALTH_STATION_RADIUS) != null)
		{
			if (ply.GetHealth() < ply.GetMaxHealth())
			{
				ply.SetHealth(ply.GetHealth() + HEALTH_STATION_HEALTH);
			}
		}
	}
}