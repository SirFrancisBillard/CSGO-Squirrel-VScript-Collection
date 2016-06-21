ROLE_DETECTIVE_COLOR <- "0 0 255";
ROLE_CHANCES <- 4;
ROLE_DETECTIVE <- 1;
ROLE_TRAITOR <- 2;

function SetupRoles()
{
	ply <- null;
	
	while ((ply = Entities.FindByClassname(ply, "player")) != null)
	{	
		randy <- RandomInt(1, ROLE_CHANCES);
		
		if (randy == ROLE_TRAITOR)
		{
			ply.SetName("ttt_player_traitor");
			ply.SetTeam(2);
			TTT_HudPrint(ply, "You are a TRAITOR")
			EntFire("TTT_ItemGiveMaster", "TriggerForActivatedPlayer", "weapon_c4", 0.0, ply);
		}
		else if (randy == ROLE_DETECTIVE)
		{
			ply.SetName("ttt_player_detective");
			ply.SetTeam(3);
			TTT_HudPrint(ply, "You are a DETECTIVE");
			TTT_GiveItem(ply, "weapon_deagle");
			TTT_GiveItem(ply, "weapon_taser");
			TTT_GiveItem(ply, "item_assaultsuit");
		}
		else
		{
			ply.SetName("ttt_player_innocent");
			ply.SetTeam(2);
			TTT_HudPrint(ply, "You are INNOCENT")
		}
	}
	ScriptPrintMessageChatAll("Roles have been selected.");
	ScriptPrintMessageChatTeam(2, "If you can buy, you're a traitor.");
	ScriptPrintMessageChatTeam(3, "You are a detective");
}