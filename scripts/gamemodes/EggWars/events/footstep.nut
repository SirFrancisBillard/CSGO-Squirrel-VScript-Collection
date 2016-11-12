::OnGameEvent_player_footstep <- function(ply) {
	if (ply.ValidateScriptScope()) {
		local script = ply.GetScriptScope()
		if (!("egg_init" in script)) {
			script.egg <- {}
			script.egg.oneHitKnife <- false
			script.egg.extraKnockBack <- false
			script.egg_init <- true
		}
	}
}
