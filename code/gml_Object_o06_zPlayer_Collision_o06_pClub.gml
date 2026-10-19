scrSfx(sfx_special02, 80);
ballSpeed = 0;
o06__Game.golfStrokes = o06__Game.golfStrokesMax;

collect_location(other.location)

with (other.id)
   instance_destroy();

scrSaveGame(0);
player_id = get_location_player(other.location);
game_name = apclient_get_player_game(player_id);
item_name = apclient_get_item_name(get_location_item(other.location), game_name);
player_name = scrStringManual("ap_for", 0) + " " + apclient_get_player_alias(player_id);
hint1 = string_upper(item_name);
hint2 = string_upper(player_name);
var _tbox = scrDrawTextBoxEx(global.g06_tx, _tboxy, global.g06_tw, global.g06_th, -1000, hint1, hint2);
_tbox.alignCenter = true;

if (_tbox.str[1] == "" && _tbox.str[2] == "")
{
    _tbox.str[1] = _tbox.str[0];
    _tbox.str[0] = "";
}
