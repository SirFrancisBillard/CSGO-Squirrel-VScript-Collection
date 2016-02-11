this.T <- "T";
this.CT <- "CT";
this.ScoreT <- "0";
this.ScoreCT <- "0";

function GetCurrentScore(team) {
	if (team == "T") {
		return ScoreT;
	} else if (team == "CT") {
		return ScoreCT;
	}
}

function ResetScores() {
	ScoreT = 0;
	ScoreCT = 0;
}

function PickedUpFlag(team) {
	if (team == "T") {
		ScriptPrintMessageChatAll("The Terrorists have picked up the Counter-Terrorists' flag!");
	} else if (team == "CT") {
		ScriptPrintMessageChatAll("The Counter-Terrorists have picked up the Terrorists' flag!");
	}
	
}

function CapturedFlag(team) {
	
}
