/*
Argument 0: Player
Argument 1: Possess
Argument 2: Possessing Player
*/
with argument0
{
    hp_var = 0;
    dead_var = true;
    do_coll_var = false;
    do_stam_var = false;
}
// Revive
if argument1
{
    revive_player_scr(argument2);
    argument2.x = argument0.x;
    argument2.y = argument0.y;
    argument2.z = argument0.z;
    argument2.eye_yaw_var = argument0.eye_yaw_var;
    argument2.eye_pitch_var = argument0.eye_pitch_var;
}