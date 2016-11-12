function DeclareEvent(id) {
	IncludeScript("EggWars/events/" + id + ".nut")
}

function DeclareGenerator(id) {
	::GEN <- {}
	IncludeScript("EggWars/generators/" + id + ".nut")
	Egg.Generators[id] <- GEN
	::GEN <- null
}

function DeclareShop(id) {
	::SHOP <- {}
	IncludeScript("EggWars/shops/" + id + ".nut")
	Egg.Shops[id] <- SHOP
	::SHOP <- null
}
