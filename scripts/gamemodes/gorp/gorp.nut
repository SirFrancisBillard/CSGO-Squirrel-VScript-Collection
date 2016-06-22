SendToConsoleServer("ent_remove GORP_Script");
SendToConsoleServer("ent_remove GORP_Timer");

GORP_Script <- Entities.CreateByClassname("logic_script");
GORP_Script.__KeyValueFromString("targetname", "GORP_Script");
SendToConsole("echo GORP script scope created");
GORP_Script.__KeyValueFromString("vscripts", "gorp/core.nut");
SendToConsole("echo Loading GORP core script...");
GORP_Script.__KeyValueFromString("thinkfunction", "Think");
SendToConsole("echo Initializing think function...");
GORP_Script.ValidateScriptScope();
SendToConsole("echo GORP script scope validated once");
EntFireByHandle(GORP_Script, "RunScriptFile", "gorp/core", 0.0, GORP_Script, GORP_Script);
SendToConsole("echo GORP script file has ran");
GORP_Script.ValidateScriptScope();
SendToConsole("echo GORP script scope validated twice");
	
GORP_Timer <- Entities.CreateByClassname("logic_timer");
SendToConsole("echo Timer created");
GORP_Timer.__KeyValueFromInt("RefireTime", 1);
SendToConsole("echo Refire time set");
GORP_Timer.__KeyValueFromString("targetname", "GORP_Timer");
GORP_Timer.ValidateScriptScope();
SendToConsole("echo Timer scope validated");
SendToConsoleServer(@"ent_fire GORP_Timer enable");
SendToConsoleServer(@"ent_fire GORP_Timer addoutput ""startdisabled 0""");
SendToConsoleServer(@"ent_fire GORP_Timer addoutput ""ontimer GORP_Script,RunScriptCode,Think()""");