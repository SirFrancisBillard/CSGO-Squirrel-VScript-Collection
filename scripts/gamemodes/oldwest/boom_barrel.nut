function SetupBoomBarrel() {
	ConnectOutput("OnTakeDamage", function() {
		EntFire(!self, "Kill", 1);
	})
}

SetupBoomBarrel();
