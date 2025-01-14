

/////////////////// Dough Ingredients ////////////////////////

/obj/item/reagent_containers/food/snacks/dough
	name = "dough"
	desc = "Dough is a thick, malleable, sometimes elastic paste made from grains or from leguminous crops."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "dough"
	cooked_type = /obj/item/reagent_containers/food/snacks/store/bread/plain
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1)
	foodtype = GRAIN


// Dough + rolling pin = flat dough
/obj/item/reagent_containers/food/snacks/dough/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/kitchen/rollingpin))
		if(isturf(loc))
			new /obj/item/reagent_containers/food/snacks/flatdough(loc)
			to_chat(user, "<span class='notice'>You flatten [src].</span>")
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You need to put [src] on a surface to roll it out!</span>")
	else
		..()


// sliceable into 3xdoughslices
/obj/item/reagent_containers/food/snacks/flatdough
	name = "flat dough"
	desc = "A dough, rolled out until thin."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "flat dough"
	slice_path = /obj/item/reagent_containers/food/snacks/doughslice
	slices_num = 3
	cooked_type = /obj/item/reagent_containers/food/snacks/pizzabread
	dried_type = /obj/item/reagent_containers/food/snacks/breadhard
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/pizzabread
	name = "pizza bread"
	desc = "Add ingredients to make a pizza."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "pizzabread"
	custom_food_type = /obj/item/reagent_containers/food/snacks/customizable/pizza
	list_reagents = list(/datum/reagent/consumable/nutriment = 7)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	foodtype = GRAIN


/obj/item/reagent_containers/food/snacks/doughslice
	name = "dough slice"
	desc = "A slice of bread dough."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "doughslice"
	cooked_type = /obj/item/reagent_containers/food/snacks/bun
	filling_color = "#CD853F"
	tastes = list("dough" = 1)
	foodtype = GRAIN


/obj/item/reagent_containers/food/snacks/bun
	name = "bun"
	desc = "A base for creating burgers."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "bun"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	custom_food_type = /obj/item/reagent_containers/food/snacks/customizable/burger
	filling_color = "#CD853F"
	tastes = list("bun" = 1) // the bun tastes of bun.
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/cakebatter
	name = "cake batter"
	desc = "Cake batter waiting for the oven."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "cakebatter"
	cooked_type = /obj/item/reagent_containers/food/snacks/store/cake/plain
	list_reagents = list(/datum/reagent/consumable/nutriment = 9)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("batter" = 1)
	foodtype = GRAIN | DAIRY

// Cake batter + rolling pin = pie dough
/obj/item/reagent_containers/food/snacks/cakebatter/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/kitchen/rollingpin))
		if(isturf(loc))
			new /obj/item/reagent_containers/food/snacks/piedough(loc)
			to_chat(user, "<span class='notice'>You flatten [src].</span>")
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You need to put [src] on a surface to roll it out!</span>")
	else
		..()

/obj/item/reagent_containers/food/snacks/piedough
	name = "pie dough"
	desc = "A base for making pies."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "piedough"
	slice_path = /obj/item/reagent_containers/food/snacks/rawpastrybase
	slices_num = 3
	cooked_type = /obj/item/reagent_containers/food/snacks/pie/plain
	list_reagents = list(/datum/reagent/consumable/nutriment = 9)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1)
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/rawpastrybase
	name = "raw pastry base"
	desc = "A base for making pastries, must be cooked first."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "rawpastrybase"
	cooked_type = /obj/item/reagent_containers/food/snacks/pastrybase
	filling_color = "#CD853F"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("raw pastry" = 1)
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/pastrybase
	name = "pastry base"
	desc = "A base for making pastries."
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "pastrybase"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	filling_color = "#CD853F"
	tastes = list("pastry" = 1)
	foodtype = GRAIN | DAIRY
