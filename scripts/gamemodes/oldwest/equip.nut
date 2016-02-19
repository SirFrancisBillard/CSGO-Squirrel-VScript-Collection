DoIncludeScript("default.nut", this);

// This script is used in conjunction with game_player_equip entities to equip players

function EquipKnife() {
	EntFire("oldwest_knife", "TriggerForAllPlayers", 1);
}

function EquipRevolver() {
	EntFire("oldwest_revolver", "TriggerForAllPlayers", 1);
}

function EquipSniper() {
	EntFire("oldwest_sniper", "TriggerForAllPlayers", 1);
}

function EquipShotgun() {
	EntFire("oldwest_shotgun", "TriggerForAllPlayers", 1);
}

function EquipMolotov() {
	EntFire("oldwest_molotov", "TriggerForAllPlayers", 1);
}
