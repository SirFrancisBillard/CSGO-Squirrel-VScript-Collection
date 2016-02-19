DoIncludeScript("default.nut", this);

// Script for:
// logic_eventlistener
// targetname			oldwest_kill_logger
// event				player_death
// team					-1 (Don't care)

this.KillsLogged <- 0;

function ResetKillLogs() {
	LogDebugString("Kill logs have been reset.")''
	KillsLogged = 0;
}

function LogKill() {
	LogDebugString("Kill has been logged.");
	KillsLogged = KillsLogged + 1;
}

function GetLoggedKills() {
	LogDebugString("Logged kills have been retrieved.")
	return KillsLogged;
}
