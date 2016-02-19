DoIncludeScript("default.nut", this);

// Copy this script and edit to make mods for Old West (or just CS:GO in general)

function OnRoundStart() {
	LogDebugString("A new round has started.");
}

function OnRoundStart() {
	LogDebugString("The current round has ended.");
}

function OnPlayerDeath() {
	LogDebugString("A player has died.");
}

function OnPlayerHurt() {
	LogDebugString("A player has been hurt.");
}

function OnPlayerShoot() {
	LogDebugString("A player has shot.");
}

function OnPlayerSpawn() {
	LogDebugString("A player has spawned.");
}

function OnPlayerChat() {
	LogDebugString("A player has been hurt.");
}

function OnPlayerChangeTeam() {
	LogDebugString("A player has sent a chat message.");
}
