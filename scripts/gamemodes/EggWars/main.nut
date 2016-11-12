IncludeScript("VUtil.nut")

::Egg <- {}

IncludeScript("EggWars/util/enums.nut")
IncludeScript("EggWars/util/client.nut")
IncludeScript("EggWars/util/config.nut")
IncludeScript("EggWars/util/declare.nut")
IncludeScript("EggWars/util/hud.nut")

Egg.Shops <- {}
Egg.Generators  <- {}

DeclareEvent("footstep")
DeclareEvent("damage")
DeclareEvent("bullet")

DeclareGenerator("silver")
DeclareGenerator("gold")
DeclareGenerator("gems")
DeclareGenerator("gems_mid")

DeclareShop("money")
DeclareShop("knife")
