/datum/crafting_recipe/food
	var/real_parts
	category = CAT_FOOD
	time = 5

/datum/crafting_recipe/food/New()
	real_parts = parts.Copy()
	parts |= reqs

//////////////////////////////////////////FOOD MIXTURES////////////////////////////////////
/datum/chemical_reaction/tofu
	name = "Tofu"
	id = "tofu"
	required_reagents = list(/datum/reagent/consumable/soymilk = 10)
	required_catalysts = list(/datum/reagent/consumable/enzyme = 5)
	mob_react = FALSE

/datum/chemical_reaction/tofu/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/tofu(location)
	return

/datum/chemical_reaction/chocolate_bar
	name = "Chocolate Bar"
	id = "chocolate_bar"
	required_reagents = list(/datum/reagent/consumable/soymilk = 2, /datum/reagent/consumable/coco = 2, /datum/reagent/consumable/sugar = 2)

/datum/chemical_reaction/chocolate_bar/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/chocolatebar(location)
	return


/datum/chemical_reaction/chocolate_bar2
	name = "Chocolate Bar"
	id = "chocolate_bar2"
	required_reagents = list(/datum/reagent/consumable/milk/chocolate_milk = 4, /datum/reagent/consumable/sugar = 2)
	mob_react = FALSE

/datum/chemical_reaction/chocolate_bar2/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/chocolatebar(location)
	return

/datum/chemical_reaction/hot_coco
	name = "Hot Coco"
	id = /datum/reagent/consumable/hot_coco
	results = list(/datum/reagent/consumable/hot_coco = 5)
	required_reagents = list(/datum/reagent/water = 5, /datum/reagent/consumable/coco = 1)

/datum/chemical_reaction/coffee
	name = "Coffee"
	id = /datum/reagent/consumable/coffee
	results = list(/datum/reagent/consumable/coffee = 5)
	required_reagents = list(/datum/reagent/toxin/coffeepowder = 1, /datum/reagent/water = 5)

/datum/chemical_reaction/tea
	name = "Tea"
	id = /datum/reagent/consumable/tea
	results = list(/datum/reagent/consumable/tea = 5)
	required_reagents = list(/datum/reagent/toxin/teapowder = 1, /datum/reagent/water = 5)

/datum/chemical_reaction/soysauce
	name = "Soy Sauce"
	id = /datum/reagent/consumable/soysauce
	results = list(/datum/reagent/consumable/soysauce = 5)
	required_reagents = list(/datum/reagent/consumable/soymilk = 4, /datum/reagent/toxin/acid = 1)

/datum/chemical_reaction/corn_syrup
	name = "corn_syrup"
	id = /datum/reagent/consumable/corn_syrup
	results = list(/datum/reagent/consumable/corn_syrup = 5)
	required_reagents = list(/datum/reagent/consumable/corn_starch = 1, /datum/reagent/toxin/acid = 1)
	required_temp = 374

/datum/chemical_reaction/caramel
	name = "Caramel"
	id = /datum/reagent/consumable/caramel
	results = list(/datum/reagent/consumable/caramel = 1)
	required_reagents = list(/datum/reagent/consumable/sugar = 1)
	required_temp = 413
	mob_react = FALSE

/datum/chemical_reaction/cheesewheel
	name = "Cheesewheel"
	id = "cheesewheel"
	required_reagents = list(/datum/reagent/consumable/milk = 40)
	required_catalysts = list(/datum/reagent/consumable/enzyme = 5)

/datum/chemical_reaction/cheesewheel/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/store/cheesewheel(location)

/datum/chemical_reaction/synthmeat
	name = "synthmeat"
	id = "synthmeat"
	required_reagents = list(/datum/reagent/blood = 5, /datum/reagent/medicine/cryoxadone = 1)
	mob_react = FALSE

/datum/chemical_reaction/synthmeat/synthblood
	id = "synthmeat_synthblood"
	required_reagents = list(/datum/reagent/blood/synthetics = 5, /datum/reagent/medicine/cryoxadone = 1)

/datum/chemical_reaction/synthmeat/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/meat/slab/synthmeat(location)

/datum/chemical_reaction/hot_ramen
	name = "Hot Ramen"
	id = /datum/reagent/consumable/hot_ramen
	results = list(/datum/reagent/consumable/hot_ramen = 3)
	required_reagents = list(/datum/reagent/water = 1, /datum/reagent/consumable/dry_ramen = 3)

/datum/chemical_reaction/hell_ramen
	name = "Hell Ramen"
	id = /datum/reagent/consumable/hell_ramen
	results = list(/datum/reagent/consumable/hell_ramen = 6)
	required_reagents = list(/datum/reagent/consumable/capsaicin = 1, /datum/reagent/consumable/hot_ramen = 6)

/datum/chemical_reaction/imitationcarpmeat
	name = "Imitation Carpmeat"
	id = "imitationcarpmeat"
	required_reagents = list(/datum/reagent/toxin/carpotoxin = 5)
	required_container = /obj/item/reagent_containers/food/snacks/tofu
	mix_message = "The mixture becomes similar to mutant carp meat."

/datum/chemical_reaction/imitationcarpmeat/on_reaction(datum/reagents/holder)
	var/location = get_turf(holder.my_atom)
	new /obj/item/reagent_containers/food/snacks/fishmeat/carp/imitation(location)
	if(holder && holder.my_atom)
		qdel(holder.my_atom)

/datum/chemical_reaction/dough
	name = "Dough"
	id = "dough"
	required_reagents = list(/datum/reagent/water = 10, /datum/reagent/consumable/flour = 15)
	mix_message = "The ingredients form a dough."

/datum/chemical_reaction/dough/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/dough(location)

/datum/chemical_reaction/cakebatter
	name = "Cake Batter"
	id = "cakebatter"
	required_reagents = list(/datum/reagent/consumable/eggyolk = 15, /datum/reagent/consumable/flour = 15, /datum/reagent/consumable/sugar = 5)
	mix_message = "The ingredients form a cake batter."

/datum/chemical_reaction/cakebatter/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/cakebatter(location)

/datum/chemical_reaction/cakebatter/vegan
	id = "vegancakebatter"
	required_reagents = list(/datum/reagent/consumable/soymilk = 15, /datum/reagent/consumable/flour = 15, /datum/reagent/consumable/sugar = 5)

/datum/chemical_reaction/ricebowl
	name = "Rice Bowl"
	id = "ricebowl"
	required_reagents = list(/datum/reagent/consumable/rice = 10, /datum/reagent/water = 10)
	required_container = /obj/item/reagent_containers/glass/bowl
	mix_message = "The rice absorbs the water."

/datum/chemical_reaction/ricebowl/on_reaction(datum/reagents/holder)
	var/location = get_turf(holder.my_atom)
	new /obj/item/reagent_containers/food/snacks/salad/ricebowl(location)
	if(holder && holder.my_atom)
		qdel(holder.my_atom)

/datum/chemical_reaction/bbqsauce
	name = "BBQ Sauce"
	id = /datum/reagent/consumable/bbqsauce
	results = list(/datum/reagent/consumable/bbqsauce = 5)
	required_reagents = list(/datum/reagent/ash = 1, /datum/reagent/consumable/tomatojuice = 1, /datum/reagent/medicine/salglu_solution = 3, /datum/reagent/consumable/blackpepper = 1)

/datum/chemical_reaction/margarine
	name = "Margarine"
	id = "margarine"
	required_reagents = list(/datum/reagent/consumable/cornoil = 5, /datum/reagent/consumable/soymilk = 5, /datum/reagent/consumable/sodiumchloride = 1)
	mix_message = "The ingredients solidify into a stick of margarine."

/datum/chemical_reaction/margarine/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= multiplier, i++)
		new /obj/item/reagent_containers/food/snacks/butter/margarine(location)
