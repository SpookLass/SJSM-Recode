/*
Argument 0: Player
Argument 1: Attacker
Argument 2: Kill screen
Argument 3: Remove players and end run
*/
global.dead_mon_var = argument1;
global.menu_player_var = argument0.player_id_var;
if argument3
{
    if global.permadeath_var { delete_save_scr(global.save_name_var); }
    rm_goto_menu_scr(argument2,true);
}
else { rm_goto_menu_scr(argument2,2); }