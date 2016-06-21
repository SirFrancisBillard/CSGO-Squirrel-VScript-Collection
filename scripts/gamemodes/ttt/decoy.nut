function Think()
{
	ent <- null;
	
	while ((ent = Entities.FindByClassname(ent, "decoy_projectile")) != null)
	{		
		if(ent.GetVelocity().Length() == Vector(0,0,0).Length())
		{		
			owner <- ent.GetOwner();
			origin <- ent.GetOrigin();	
			if (owner.GetName() == "ttt_player_traitor")
			{
				//Traitor stuff
			}
			else if (owner.GetName() == "ttt_player_detective")
			{
				//Detective stuff
			}
			ent.Destroy()
		}
	}
}