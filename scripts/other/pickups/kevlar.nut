function OnPickedUp(ply) {
	GiveWeapon(ply, "item_assaultsuit");
	EntFire(!self, "Kill", "", 0.01, ply);
}
