this.DebugStatus <- true; // true = enabled, false = disabled
this.DebugPrefix = "[DEBUG] ";

function GetDebugPrefix() {
	return DebugPrefix;
}

function SetDebugPrefix(NewPrefix) {
	DebugPrefix = NewPrefix;
}

function LogDebugString(DebugString) {
	printl(DebugPrefix + DebugString);
}

function GetDebugStatus() {
	return DebugStatus;
}

function SetDebugStatus(DebugState) {
	DebugStatus = DebugState;
}
