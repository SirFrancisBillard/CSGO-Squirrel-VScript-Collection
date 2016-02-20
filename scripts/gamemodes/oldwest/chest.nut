DoIncludeScript("default.nut", this);

this.e_ChestModel <- EntityGroup[0];		// prop_dynamic
this.e_ChestButton <- EntityGroup[1];		// func_button

function OpenChest(Opener) {
	local Randy = RandomInt(1, 4);
	switch (Randy) {
		case 1 {
			DoEntFire("oldwest_molotov", "Use", 1, 0.0, Opener, Opener);
			break;
		} case 2 {
			DoEntFire("oldwest_revolver", "Use", 1, 0.0, Opener, Opener);
			break;
		} case 3 {
			DoEntFire("oldwest_shotgun", "Use", 1, 0.0, Opener, Opener);
			break;
		} case 4 {
			DoEntFire("oldwest_sniper", "Use", 1, 0.0, Opener, Opener);
			break;
		}
	}
}
