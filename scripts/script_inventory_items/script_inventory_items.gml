#macro TEMPLATE_ITEM_NONE					0
#macro TEMPLATE_ITEM_BATTERY			1
#macro TEMPLATE_ITEM_FLASHLIGHT		2
#macro TEMPLATE_ITEM_GUN					3
#macro TEMPLATE_ITEM_GUN_AMMO			4
#macro TEMPLATE_ITEM_SYRINGE			5
#macro TEMPLATE_ITEM_TOOLKIT			6
#macro TEMPLATE_ITEM_TUBE					7
#macro TEMPLATE_ITEM_LAMP					8

/// @arg UID
function inv_item_template(_item) {
	switch (_item) {
		case TEMPLATE_ITEM_GUN_AMMO: 
			return new Item(spr_ammo_inv, spr_ammo_floor, 1, 1, "Pistol Ammo", "pistol_ammo", item_type.ammo, 0, TEMPLATE_ITEM_GUN_AMMO);
		case TEMPLATE_ITEM_BATTERY: 
			return new Item(spr_battery_inv, spr_battery_floor, 1, 1, "Battery", "battery", item_type.garbage, 0, TEMPLATE_ITEM_BATTERY);
		case TEMPLATE_ITEM_FLASHLIGHT: 
			return new Item(spr_flashlight_inv, spr_flashlight_floor, 2, 1, "Flashlight", "flashlight", item_type.weapon, 0, TEMPLATE_ITEM_FLASHLIGHT);
		case TEMPLATE_ITEM_LAMP: 
			return new Item(spr_lamp_inv, spr_lamp_floor, 1, 2, "Lamp", "lamp", item_type.weapon, 0, TEMPLATE_ITEM_LAMP);
		case TEMPLATE_ITEM_GUN: 
			return new Item(spr_pistol_inv, spr_pistol_floor, 3, 2, "Firearm", "pistol", item_type.weapon, 0, TEMPLATE_ITEM_GUN);
		case TEMPLATE_ITEM_SYRINGE: 
			return new Item(spr_syringe_inv, spr_syringe_floor, 2, 1, "Syringe", "syringe", item_type.medicine, 0, TEMPLATE_ITEM_SYRINGE);
		case TEMPLATE_ITEM_TOOLKIT: 
			return new Item(spr_toolkit_inv, spr_toolkit_floor, 3, 2, "Toolkit", "toolkit", item_type.tool, 0, TEMPLATE_ITEM_TOOLKIT);
		case TEMPLATE_ITEM_TUBE: 
			return new Item(spr_tube_inv, spr_tube_floor, 5, 1, "Tube", "tube", item_type.weapon, 0, TEMPLATE_ITEM_TUBE);
	}
}

