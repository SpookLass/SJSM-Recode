/*
Argumen 0: Room
*/
for (local.i=0; local.i<global.player_len_var; local.i+=1;)
{
    if instance_exists(global.player_arr[local.i])
    { global.player_arr[local.i].on_var = true; }
}
with mus_control_obj { on_var = true; }
rm_goto_scr(argument0);