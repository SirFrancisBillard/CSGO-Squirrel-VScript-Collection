SHOP.name <- "Knife Enchanter"
SHOP.desc <- "Allow your knife to deal one-hit kills."
SHOP.costs <- EGG_CURRENCY_SILVER
SHOP.price <- 2000
SHOP.bought <- function(ply, script) {
	if (!(script.egg.oneHitKnife)) {
		script.egg.oneHitKnife <- true
	}
}
