if (!global.paused && !ds_queue_empty(global.ap_message_queue) && !instance_exists(oSaveIcon))
{
    global.ap_message = ds_queue_dequeue(global.ap_message_queue);
    scrSaveNotification(global.ARCHIPELAGO_NOTIFICATION);
}
debugThing = apclient_poll();
switch (apclient_json_source())
{
    case "ap_room_info":
        global.SAVE_FILE = "save_" + apclient_get_seed() + "_" + apclient_get_slot() + ".ufo";
        global.SAVE_FILE = string_replace_all(global.SAVE_FILE, "*", "");
		global.server_release_mode = apclient_get_permission("release");
        break;
    case "ap_slot_refused":
        global.ap_connecting = 0;
        global.ap_connected = false;
        break;
    case "ap_slot_connected":
        global.ap_connected = true;
        apclient_status_update(global.AP_CLIENT_STATUS_READY);
        global.included_games = [];
        for (game = 0; game <= 51; game += 1)
        {
            global.included_games[game] = false;
        }
        global.included_games[0] = true;
        included_games = apclient_json_proxy(0, "included_games");
        for (i = 0; apclient_json_exists(included_games, string(i)); i += 1)
        {
            game = apclient_json_number_at(included_games, string(i));
            global.included_games[game] = true;
        }
        global.game_goals = [];
        game = 0;
        for (game = 0; game <= 51; game++)
        {
            global.game_goals[game] = global.NO_GOAL;
        }
        goal_games = apclient_json_proxy(0, "goal_games");
        for (i = 0; apclient_json_exists(goal_games, string(i)); i += 1)
        {
            game = apclient_json_number_at(goal_games, string(i));
            global.game_goals[game] = global.GOAL_GOLD;
        }
        cherry_games = apclient_json_proxy(0, "cherry_games");
        for (i = 0; apclient_json_exists(cherry_games, string(i)); i += 1)
        {
            game = apclient_json_number_at(cherry_games, string(i));
            if (global.game_goals[game] == global.GOAL_GOLD)
            {
                global.game_goals[game] = global.GOAL_CHERRY;
            }
        }
        global.porgy_check_on_touch = apclient_json_number_at(0, "porgy_check_on_touch");
        global.porgy_radar = apclient_json_number_at(0, "porgy_radar");
		global.golfaria_start_brakes = apclient_json_number_at(0, "golfaria_start_brakes");
		global.golfaria_difficulty = apclient_json_number_at(0, "golfaria_difficulty");
        break;
    case "ap_socket_connected":
        apclient_connect_slot(global.ap_player, global.ap_password, "[]");
        global.ap_connected = false;
        break;
    case "ap_socket_disconnected":
        global.ap_connecting = 0;
        global.ap_connected = false;
        break;
    case "ap_socket_error":
        if (global.ap_connecting > 0)
        {
            global.ap_connecting--;
        }
        if (global.ap_connecting <= 0)
        {
            global.ap_connected = false;
        }
        break;
    case "ap_items_received":
        item_count = apclient_json_number_at(0, "len");
        item_index = apclient_json_number_at(0, "index");
        if (item_index == 0)
        {
            global.item_index = 0;
            old_items_received = [];
            for (subgame_id = 0; subgame_id <= 51; subgame_id++)
            {
                old_items_received[subgame_id] = {};
                if (!global.included_games[subgame_id])
                {
                    continue;
                }
                for (item_id = 0; item_id < 1000; item_id++)
                {
                    if (variable_struct_exists(global.ap_items_received[subgame_id], string(item_id)))
                    {
                        count = variable_struct_get(global.ap_items_received[subgame_id], string(item_id));
                        variable_struct_set(old_items_received[subgame_id], string(item_id), count);
                        variable_struct_set(global.ap_items_received[subgame_id], string(item_id), 0);
                    }
                }
            }
        }
        if (item_index != global.item_index)
        {
            apclient_sync();
            exit;
        }
        ids = apclient_json_proxy(0, "ids");
        players = apclient_json_proxy(0, "players");
        for (i = 0; i < item_count; i++)
        {
            whole_id = apclient_json_number_at(ids, string(i)) - global.AP_BASE_ID;
            subgame_id = floor(whole_id / 1000);
            item_id = whole_id - (subgame_id * 1000);
            if (!global.included_games[subgame_id])
            {
                continue;
            }
            if (subgame_id == 0 && !global.included_games[item_id])
            {
                continue;
            }
            if (!variable_struct_exists(global.ap_items_received[subgame_id], string(item_id)))
            {
                variable_struct_set(global.ap_items_received[subgame_id], string(item_id), 0);
            }
            if (!variable_struct_exists(old_items_received[subgame_id], string(item_id)))
            {
                variable_struct_set(old_items_received[subgame_id], string(item_id), 0);
            }
            count = variable_struct_get(global.ap_items_received[subgame_id], string(item_id)) + 1;
            old_count = variable_struct_get(old_items_received[subgame_id], string(item_id));
            variable_struct_set(global.ap_items_received[subgame_id], string(item_id), count);
            player_id = apclient_json_number_at(players, string(i));
            if ((player_id != apclient_get_player_number() && item_index > 0) || count > old_count)
            {
                player_name = apclient_get_player_alias(player_id);
                item_name = apclient_get_item_name(whole_id + global.AP_BASE_ID, "UFO 50");
                str = method_call(string, [scrStringManual("ap_got_from", 0), item_name, player_name]);
                ds_queue_enqueue(global.ap_message_queue, str);
            }
        }
        global.item_index = item_index + item_count;
        break;
    case "ap_location_checked":
        location_count = apclient_json_number_at(0, "len");
        locations = apclient_json_proxy(0, "locations");
        for (i = 0; i < location_count; i++)
        {
            whole_id = apclient_json_number_at(locations, string(i)) - global.AP_BASE_ID;
            subgame_id = floor(whole_id / 1000);
            location_id = whole_id - (subgame_id * 1000);
            if (!global.included_games[subgame_id])
            {
                continue;
            }
            variable_struct_set(global.ap_locations_found[subgame_id], string(location_id), 2);
        }
        break;
    case "ap_location_info":
        location_count = apclient_json_number_at(0, "len");
        items = apclient_json_proxy(0, "items");
        players = apclient_json_proxy(0, "players");
        locations = apclient_json_proxy(0, "locations");
        for (i = 0; i < location_count; i++)
        {
            item_id = apclient_json_number_at(items, string(i));
            player_id = apclient_json_number_at(players, string(i));
            whole_location_id = apclient_json_number_at(locations, string(i)) - global.AP_BASE_ID;
            subgame_id = floor(whole_location_id / 1000);
            location_id = whole_location_id - (subgame_id * 1000);
            if (!global.included_games[subgame_id])
            {
                continue;
            }
            if (!variable_struct_exists(global.ap_scouts[subgame_id], string(location_id)))
            {
                variable_struct_set(global.ap_scouts[subgame_id], string(location_id), 
                {
                    item_id: 0,
                    player_id: 0,
                    state: 0
                });
            }
            location_data = variable_struct_get(global.ap_scouts[subgame_id], string(location_id));
            state = variable_struct_get(global.ap_scouts[subgame_id], string(location_id)).state | 1;
            variable_struct_set(global.ap_scouts[subgame_id], string(location_id), 
            {
                item_id: item_id,
                player_id: player_id,
                state: state
            });
        }
        break;
    case "ap_print_json":
        if (apclient_json_exists(0, "type"))
        {
            switch (apclient_json_string_at(0, "type"))
            {
                case "ItemSend":
                    ntwk_item = apclient_json_proxy(0, "item");
                    sender = apclient_json_number_at(ntwk_item, "player");
                    receiver = apclient_json_number_at(0, "receiving");
                    if (sender == apclient_get_player_number() && receiver != apclient_get_player_number())
                    {
                        player_name = apclient_get_player_alias(receiver);
                        game_name = apclient_get_player_game(receiver);
                        item_name = apclient_get_item_name(apclient_json_number_at(ntwk_item, "item"), game_name);
                        str = method_call(string, [scrStringManual("ap_sent_to", 0), item_name, player_name]);
                        ds_queue_enqueue(global.ap_message_queue, str);
                    }
                    break;
            }
        }
        break;
    case "ap_bounced":
        break;
    case "show_message":
        show_message(apclient_json_string_at(0, "message"));
        break;
    case "":
        break;
    default:
        show_message(apclient_json_source() + ":\n" + apclient_json_dump(0));
        break;
}
