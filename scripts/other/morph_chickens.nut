function entities_by_classname(classname){
	entities <- [];
	for(local e = Entities.FindByClassname(0,classname); e != null; e = Entities.FindByClassname(e,classname)){
		entities.push(e);
	}
	return entities;
}

foreach(c in entities_by_classname("chicken")){
	c.SetModel("models/player/tm_separatist_variantA.mdl");
}
