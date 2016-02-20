// Client Commands

::point_clientcommand <- Entities.CreateByClassname("point_clientcommand");

::SendCommandToClient<-function(player,command){
DoEntFire("!self","Command",command,0,player,point_clientcommand);
}

::EmitGameSoundOnClient<-function(player,sound){
SendCommandToClient(player,"playgamesound "+sound)
}

::EmitSoundOnClient<-function(player,sound){
SendCommandToClient(player,"play "+sound)
}

// Give Weapons

function CreateLocalEquipManager(){
::game_player_equip <- Entities.CreateByClassname("game_player_equip");
}

function DestroyLocalEquipManager(){
::game_player_equip.Destroy()
}

::GiveWeapons<- function(player,weaponlist){
CreateLocalEquipManager()
::game_player_equip.__KeyValueFromInt("spawnflags",5)

foreach (k,v in weaponlist){
::game_player_equip.__KeyValueFromInt(v,1)
}

EntFireByHandle(::game_player_equip,"Use","",0.0,player,null);

foreach (k,v in weaponlist){
::game_player_equip.__KeyValueFromInt(v,0)
}
DestroyLocalEquipManager()
}

::GiveWeapon<- function(player,weapon){
CreateLocalEquipManager()
::game_player_equip.__KeyValueFromInt("spawnflags",5)

::game_player_equip.__KeyValueFromInt(weapon,1)
EntFireByHandle(::game_player_equip,"Use","",0.0,player,null);
::game_player_equip.__KeyValueFromInt(weapon,0)
DestroyLocalEquipManager()
}

::RefreshAmmo<- function(player){
CreateLocalEquipManager()
::game_player_equip.__KeyValueFromInt("spawnflags",5)
weaponlist <- {};
weapon <- null;
i <- 0;
while((weapon = Entities.FindByClassname(weapon,"weapon_*")) != null){
if (weapon.GetOwner()==player&&weapon.GetClassname()!="weapon_knife"){
weaponlist[i]<-weapon.GetClassname()
weapon.Destroy()
i++
}
}
foreach (k,v in weaponlist){
	::game_player_equip.__KeyValueFromInt(v,1)
}
EntFireByHandle(::game_player_equip,"Use","",0.0,player,null);
foreach (k,v in weaponlist){
::game_player_equip.__KeyValueFromInt(v,0)
}
	DestroyLocalEquipManager()
}
::StripWeapons<- function(player){
	weapon <- null;
	while((weapon = Entities.FindByClassname(weapon,"weapon_*")) != null){
		if (weapon.GetOwner()==player){
			weapon.Destroy()
		}
	}
}

// Player Speed Mod

::player_speedmod <- Entities.CreateByClassname("player_speedmod");

::ModifySpeed<-function(player,speed){
	DoEntFire("!self","ModifySpeed",speed.tostring(),0,player,player_speedmod);
}
