function TTT_InitVars()
{
	::TTT_LoadingVars <- true;
	
	::TTT_Gamemode <- "Trouble in Terrorist Town";
	::TTT_ShortName <- "TTT";
	::TTT_Version <- "0.4";
	
	::TTT_ItemGiveMaster <- Entities.CreateByClassName("game_player_equip");
	TTT_ItemGiveMaster.SetName("TTT_ItemGiveMaster");
	TTT_ItemGiveMaster.__KeyValueFromInt("spawnflags", 7);
	
	::TTT_HudHintMaster <- Entities.CreateByClassname("env_hudhint");
	
	::TTT_SpeedModMaster <- Entities.CreateByClassname("player_speedmod");
	
	::TTT_ClientCommandMaster <- Entities.CreateByClassname("point_clientcommand");
	
	::TTT_EventPlayerDie <- Entities.CreateByClassName("trigger_brush");
	TTT_EventPlayerDie.SetName("game_playerdie");
	
	::TTT_EventPlayerKill <- Entities.CreateByClassName("trigger_brush");
	TTT_EventPlayerKill.SetName("game_playerkill");
	
	::TTT_EventPlayerJoin <- Entities.CreateByClassName("trigger_brush");
	TTT_EventPlayerJoin.SetName("game_playerjoin");
	
	::TTT_EventPlayerSpawn <- Entities.CreateByClassName("trigger_brush");
	TTT_EventPlayerSpawn.SetName("game_playerspawn");
	
	::TTT_EventPlayerLeave <- Entities.CreateByClassName("trigger_brush");
	TTT_EventPlayerLeave.SetName("game_playerleave");
	
	::TTT_LoadingVars <- false;
}

function TTT_InitFuncs()
{
	::TTT_LoadingFuncs <- true;
	
	::TTT_HudPrint <- function(player, text)
	{
		TTT_HudHintMaster.__KeyValueFromString("me ssage", text);
		DoEntFire("!self", "ShowHudHint", text, 0.0, player, TTT_HudHintMaster);
	}
	
	::TTT_GiveItem <- function(player, item)
	{
		EntFire("TTT_ItemGiveMaster", "TriggerForActivatedPlayer", item, 0.0, player);
	}
	
	::TTT_ModifySpeed <- function(player, speed)
	{
		DoEntFire("!self", "ModifySpeed", speed.tostring(), 0, player, TTT_SpeedModMaster);
	}
	
	::TTT_ClientCommand <- function(player, command)
	{
		DoEntFire("!self", "Command", command, 0, player, TTT_ClientCommandMaster);
	}
	
	::TTT_LoadingFuncs <- false;
}

function TTT_Initialize() //Teehee wrapper function
{
	::TTT_Loading <- true;
	TTT_InitVars();
	TTT_InitFuncs();
	::TTT_Loading <- true;
}