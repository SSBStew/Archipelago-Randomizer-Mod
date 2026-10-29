function scr12_SetupShop(arg0)
{
    for (var i = 0; i < shopItemsMax; i++)
        shopItems[i] = "";
    if (global.grimstone_shops == 0)
	{
        if (arg0 == 11)
        {
            shopItems[0] = "BANDAGE";
            shopItems[1] = "a DERANGER";
            shopItems[2] = "g LITEVEST";
            shopItems[3] = "i WORN";
        }
        else if (arg0 == 21)
        {
            shopItems[0] = "BANDAGE";
            shopItems[1] = "ANTIDOTE";
            shopItems[2] = "LASSO";
            shopItems[3] = "e KITCHEN";
            shopItems[4] = "f BANDANA";
            shopItems[5] = "g WOOL";
            shopItems[6] = "h COTTON";
            shopItems[7] = "i LEATHER";
        }
        else if (arg0 == 26)
        {
            shopItems[0] = "a DERANGER";
            shopItems[1] = "b COACH";
        }
        else if (arg0 == 31)
        {
            shopItems[0] = "BANDAGE";
            shopItems[1] = "ANTIDOTE";
            shopItems[2] = "LASSO";
            shopItems[3] = "BEDROLLS";
            shopItems[4] = "f BOLO";
            shopItems[5] = "g LEATHER";
            shopItems[6] = "h WOOL";
            shopItems[7] = "i SNAKE";
        }
        else if (arg0 == 36)
        {
            shopItems[0] = "a PEPPRBOX";
            shopItems[1] = "b COACH";
            shopItems[2] = "c LONGRIFL";
        }
        else if (arg0 == 41)
        {
            shopItems[0] = "BANDAGE";
            shopItems[1] = "OINTMENT";
            shopItems[2] = "ANTIDOTE";
            shopItems[3] = "LASSO";
            shopItems[4] = "e DAGGER";
            shopItems[5] = "g PONCHO";
            shopItems[6] = "h LEATHER";
            shopItems[7] = "i EELSKIN";
        }
        else if (arg0 == 51)
        {
            shopItems[0] = "OINTMENT";
            shopItems[1] = "ANTIDOTE";
            shopItems[2] = "BEDROLLS";
            shopItems[3] = "HOLYWATER";
            shopItems[4] = "SALT";
            shopItems[5] = "LASSO";
            shopItems[6] = "d RATLING";
            shopItems[7] = "f CHARM";
        }
        else if (arg0 == 61)
        {
            shopItems[0] = "OINTMENT";
            shopItems[1] = "ANTIDOTE";
            shopItems[2] = "LASSO";
            shopItems[3] = "BEDROLLS";
            shopItems[4] = "a SIDEWIND";
            shopItems[5] = "b 4BARREL";
            shopItems[6] = "c INFANTRY";
            shopItems[7] = "d RATLING";
        }
        else if (arg0 == 81)
        {
            shopItems[0] = "OINTMENT";
            shopItems[1] = "MEDKIT";
            shopItems[2] = "ANTIDOTE";
            shopItems[3] = "BEDROLLS";
            shopItems[4] = "HOLYWATER";
            shopItems[5] = "SALT";
            shopItems[6] = "g DUSTER";
            shopItems[7] = "h SILK";
        }
        else if (arg0 == 86)
        {
            shopItems[0] = "a PEACEMKR";
            shopItems[1] = "b NOCKER";
            shopItems[2] = "c BUFFALO";
            shopItems[3] = "d MITRAIL";
        }
        else if (arg0 == 91)
        {
            shopItems[0] = "OINTMENT";
            shopItems[1] = "MEDKIT";
            shopItems[2] = "ANTIDOTE";
            shopItems[3] = "LASSO";
            shopItems[4] = "f BONE";
            shopItems[5] = "g DEMON";
        }
        else if (arg0 == 94)
        {
            shopItems[0] = "e OBSIDIAN";
            shopItems[1] = "e TOOTHPIK";
            shopItems[2] = "b PUNTER";
            shopItems[3] = "d INFERNO";
        }
        else if (arg0 == 138)
        {
            shopItems[0] = "DOGTREAT A";
            shopItems[1] = "DOGTREAT D";
            shopItems[2] = "DOGTREAT E";
        }
        
        for (var i = 0; i < shopItemsMax; i++)
        {
            if (arg0 == 138)
                shopPrices[i] = scr12_ItemGetVal(shopItems[i], 2);
            else
                shopPrices[i] = scr12_ItemGetVal(shopItems[i], 1);
        }
	}
	else if (global.grimstone_shops == 1)
	{
		if (arg0 == 11)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 0);
            shopItems[1] = ds_list_find_value(ds_shopItems, 1);
            shopItems[2] = ds_list_find_value(ds_shopItems, 2);
            shopItems[3] = ds_list_find_value(ds_shopItems, 3);
        }
        else if (arg0 == 21)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 4);
            shopItems[1] = ds_list_find_value(ds_shopItems, 5);
            shopItems[2] = ds_list_find_value(ds_shopItems, 6);
            shopItems[3] = ds_list_find_value(ds_shopItems, 7);
            shopItems[4] = ds_list_find_value(ds_shopItems, 8);
            shopItems[5] = ds_list_find_value(ds_shopItems, 9);
            shopItems[6] = ds_list_find_value(ds_shopItems, 10);
            shopItems[7] = ds_list_find_value(ds_shopItems, 11);
        }
        else if (arg0 == 26)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 12);
            shopItems[1] = ds_list_find_value(ds_shopItems, 13);
        }
        else if (arg0 == 31)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 14);
            shopItems[1] = ds_list_find_value(ds_shopItems, 15);
            shopItems[2] = ds_list_find_value(ds_shopItems, 16);
            shopItems[3] = ds_list_find_value(ds_shopItems, 17);
            shopItems[4] = ds_list_find_value(ds_shopItems, 18);
            shopItems[5] = ds_list_find_value(ds_shopItems, 19);
            shopItems[6] = ds_list_find_value(ds_shopItems, 20);
            shopItems[7] = ds_list_find_value(ds_shopItems, 21);
        }
        else if (arg0 == 36)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 22);
            shopItems[1] = ds_list_find_value(ds_shopItems, 23);
            shopItems[2] = ds_list_find_value(ds_shopItems, 24);
        }
        else if (arg0 == 41)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 25);
            shopItems[1] = ds_list_find_value(ds_shopItems, 26);
            shopItems[2] = ds_list_find_value(ds_shopItems, 27);
            shopItems[3] = ds_list_find_value(ds_shopItems, 28);
            shopItems[4] = ds_list_find_value(ds_shopItems, 29);
            shopItems[5] = ds_list_find_value(ds_shopItems, 30);
            shopItems[6] = ds_list_find_value(ds_shopItems, 31);
            shopItems[7] = ds_list_find_value(ds_shopItems, 32);
        }
        else if (arg0 == 51)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 33);
            shopItems[1] = ds_list_find_value(ds_shopItems, 34);
            shopItems[2] = ds_list_find_value(ds_shopItems, 35);
            shopItems[3] = ds_list_find_value(ds_shopItems, 36);
            shopItems[4] = ds_list_find_value(ds_shopItems, 37);
            shopItems[5] = ds_list_find_value(ds_shopItems, 38);
            shopItems[6] = ds_list_find_value(ds_shopItems, 39);
            shopItems[7] = ds_list_find_value(ds_shopItems, 40);
        }
        else if (arg0 == 61)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 41);
            shopItems[1] = ds_list_find_value(ds_shopItems, 42);
            shopItems[2] = ds_list_find_value(ds_shopItems, 43);
            shopItems[3] = ds_list_find_value(ds_shopItems, 44);
            shopItems[4] = ds_list_find_value(ds_shopItems, 45);
            shopItems[5] = ds_list_find_value(ds_shopItems, 46);
            shopItems[6] = ds_list_find_value(ds_shopItems, 47);
            shopItems[7] = ds_list_find_value(ds_shopItems, 48);
        }
        else if (arg0 == 81)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 49);
            shopItems[1] = ds_list_find_value(ds_shopItems, 50);
            shopItems[2] = ds_list_find_value(ds_shopItems, 51);
            shopItems[3] = ds_list_find_value(ds_shopItems, 52);
            shopItems[4] = ds_list_find_value(ds_shopItems, 53);
            shopItems[5] = ds_list_find_value(ds_shopItems, 54);
            shopItems[6] = ds_list_find_value(ds_shopItems, 55);
            shopItems[7] = ds_list_find_value(ds_shopItems, 56);
        }
        else if (arg0 == 86)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 57);
            shopItems[1] = ds_list_find_value(ds_shopItems, 58);
            shopItems[2] = ds_list_find_value(ds_shopItems, 59);
            shopItems[3] = ds_list_find_value(ds_shopItems, 60);
        }
        else if (arg0 == 91)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 61);
            shopItems[1] = ds_list_find_value(ds_shopItems, 62);
            shopItems[2] = ds_list_find_value(ds_shopItems, 63);
            shopItems[3] = ds_list_find_value(ds_shopItems, 64);
            shopItems[4] = ds_list_find_value(ds_shopItems, 65);
            shopItems[5] = ds_list_find_value(ds_shopItems, 66);
        }
        else if (arg0 == 94)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 67);
            shopItems[1] = ds_list_find_value(ds_shopItems, 68);
            shopItems[2] = ds_list_find_value(ds_shopItems, 69);
            shopItems[3] = ds_list_find_value(ds_shopItems, 70);
        }
        else if (arg0 == 138)
        {
            shopItems[0] = ds_list_find_value(ds_shopItems, 71);
            shopItems[1] = ds_list_find_value(ds_shopItems, 72);
            shopItems[2] = ds_list_find_value(ds_shopItems, 73);
        }
        
        for (var i = 0; i < shopItemsMax; i++)
        {
            if (arg0 == 138)
                shopPrices[i] = scr12_ItemGetVal(shopItems[i], 2);
            else
                shopPrices[i] = scr12_ItemGetVal(shopItems[i], 1);
        }
	}
	else
	{
		if (arg0 == 11)
        {
            for (i = 0; i < 4; i++)
			{
			    var _location = 501 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 21)
        {
            for (i = 0; i < 8; i++)
			{
			    var _location = 511 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 26)
        {
            for (i = 0; i < 2; i++)
			{
			    var _location = 521 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 31)
        {
            for (i = 0; i < 8; i++)
			{
			    var _location = 531 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 36)
        {
            for (i = 0; i < 3; i++)
			{
			    var _location = 541 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 41)
        {
            for (i = 0; i < 8; i++)
			{
			    var _location = 551 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 51)
        {
            for (i = 0; i < 8; i++)
			{
			    var _location = 561 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 61)
        {
            for (i = 0; i < 8; i++)
			{
			    var _location = 571 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 81)
        {
            for (i = 0; i < 8; i++)
			{
			    var _location = 581 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 86)
        {
            for (i = 0; i < 4; i++)
			{
			    var _location = 591 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 91)
        {
            for (i = 0; i < 6; i++)
			{
			    var _location = 601 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 94)
        {
            for (i = 0; i < 4; i++)
			{
			    var _location = 611 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
        else if (arg0 == 138)
        {
            for (i = 0; i < 3; i++)
			{
			    var _location = 621 + i;
				player_id = get_location_player(_location);
				game_name = apclient_get_player_game(player_id);
				item_name = apclient_get_item_name(get_location_item(_location), game_name);
				shopLocation[i] = _location;
				if (apclient_get_slot() == apclient_get_player_alias(player_id) && string_starts_with(item_name, "Grimstone - "))
					shopItems[i] = string_trim_start(item_name, ["Grimstone - "]);
				else
					shopItems[i] = "APITEM";
			}
        }
		for (jj = 0; jj < i; jj++)
			hint_location(shopLocation[jj]);
        for (var i = 0; i < shopItemsMax; i++)
        {
            if (arg0 == 138)
                shopPrices[i] = scr12_ItemGetVal(shopItems[i], 2);
            else
                shopPrices[i] = scr12_ItemGetVal(shopItems[i], 1);
        }
	}
}