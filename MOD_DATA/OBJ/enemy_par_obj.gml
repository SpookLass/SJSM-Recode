// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    if !variable_local_exists("color_var") { color_var = 2; }
    if !variable_local_exists("reflect_var") { reflect_var = true; }
    event_inherited();
    if !variable_local_exists("do_hurt_var") { do_hurt_var = false; }
    if !variable_local_exists("do_possess_var") { do_possess_var = true; }
    hurt_var = false;
    on_var = false;
    possess_var = false;
    player_id_var = 0;
    cam_id_var = -1;
    active_var = false;
    // Sound Stuff
    if !variable_local_exists("do_snd_var") { do_snd_var = true; }
    if do_snd_var
    {
        if !variable_local_exists("snd_dist_min_var") { snd_dist_min_var = 0; }
        if !variable_local_exists("snd_dist_max_var") { snd_dist_max_var = 600; }
        if !variable_local_exists("loop_snd_var") { loop_snd_var[0] = false; }
        if !variable_local_exists("loop_snd_dist_min_var") { loop_snd_dist_min_var = 0; }
        if !variable_local_exists("loop_snd_dist_max_var") { loop_snd_dist_max_var = 600; }
    }
    sub_var[0] = "";
    sub_var[1] = false;
    inst_var = noone;
    loop_inst_var = noone;
');
// Event Step End
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if do_snd_var
    {
        fmod_inst_set_3d_pos_scr(inst_var,x,y,z);
        fmod_inst_set_3d_pos_scr(loop_inst_var,x,y,z);
    }
');