TRAITOR_TEST_RADIUS <- 64;

function Think()
{
	ent <- null;
	
	while ((ent = Entities.FindByName(ent, "ttt_traitor_test")) != null)
	{			
		owner <- ent.GetOwner();
		origin <- ent.GetOrigin();	
		ply <- null;
		
		while ((ply = Entities.FindByClassnameWithin(ply, "player", origin, TRAITOR_TEST_RADIUS) != null)
		{
			if (ply.GetName() == "ttt_player_traitor")
			{
				ply.__KeyValueFromString("rendercolor", "255 0 0");
			}
			if (ply.GetName() == "ttt_player_innocent")
			{
				ply.__KeyValueFromString("rendercolor", "0 255 0");
			}
			if (ply.GetName() == "ttt_player_detective")
			{
				ply.__KeyValueFromString("rendercolor", "0 0 255");
			}
		}
	}
}