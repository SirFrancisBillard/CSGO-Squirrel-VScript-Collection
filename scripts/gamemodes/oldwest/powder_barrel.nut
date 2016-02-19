self.e_Model <- EntityGroup[0];
self.e_Exp <- EntityGroup[1];

function ExplodeBarrel() {
	EntFire(e_Model.GetName(), "Kill", 1);
	EntFire(e_Exp.GetName(), "Explode", 250);
	EntFire(e_Exp.GetName(), "Kill", 1);
}

ConnectOutput("OnTakeDamage", "ExplodeBarrel");
