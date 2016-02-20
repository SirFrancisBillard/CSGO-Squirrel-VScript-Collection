DoIncludeScript("default.nut", this);
DoIncludeScript("kill_logger.nut", this);

this.e_SoundPlayer <- EntityGroup[0];

function PlayGongSound() {
	EntFire(e_SoundPlayer.GetName(), "PlaySound", 1);
}
