// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Start
    // Loading specimen specific settings
object_event_add
(argument0,ev_create,1,'');
// Create Normal Event
    // Default settings
object_event_add
(argument0,ev_create,2,'
    // Variables
    if !variable_local_exists("do_hurt_var") { do_hurt_var = false; }
    if !variable_local_exists("do_possess_var") { do_possess_var = true; }
    if !variable_local_exists("hp_var") { hp_var = -1; }
    if !variable_local_exists("name_var") { name_var = "Unknown"; }
    if !variable_local_exists("dead_rm_var") { dead_rm_var = dead_rm; }
    if !variable_local_exists("cam_id_var") { cam_id_var = -1; }
    hp_max_var = hp_var;
    hurt_var = false;
    on_var = false;
    possess_var = false;
    player_id_var = 0;
    active_var = false;
    // Sound Stuff
    if !variable_local_exists("do_snd_var") { do_snd_var = true; }
    if do_snd_var
    {
        if !variable_local_exists("snd_h_var") { snd_h_var = 0; }
        if !variable_local_exists("snd_dist_min_var") { snd_dist_min_var = 0; }
        if !variable_local_exists("snd_dist_max_var") { snd_dist_max_var = 600; }
        if !variable_local_exists("loop_snd_var") { loop_snd_var[0] = false; }
        if !variable_local_exists("loop_snd_dist_min_var") { loop_snd_dist_min_var = 0; }
        if !variable_local_exists("loop_snd_dist_max_var") { loop_snd_dist_max_var = 600; }
        if !variable_local_exists("inst_var") { inst_var = noone; }
        if !variable_local_exists("loop_inst_var") { loop_inst_var = noone; }
        // Subtitles
        if !variable_local_exists("sub_var")
        {
            sub_var[0] = "";
            sub_var[1] = false;
        }
        if !variable_local_exists("sub_font_var") { sub_font_var = main_font; }
        if !variable_local_exists("sub_color_var") { sub_color_var = c_white; }
        if !variable_local_exists("sub_xscale_var") { sub_xscale_var = 0.5; }
        if !variable_local_exists("sub_yscale_var") { sub_yscale_var = 0.5; }
        if !variable_local_exists("sub_angle_var") { sub_angle_var = 0; }
        if !variable_local_exists("sub_shadow_var") { sub_shadow_var = true; }
        if sub_shadow_var
        {
            if !variable_local_exists("sub_shadow_color_var") { sub_shadow_color_var = make_color_rgb(100,0,0); }
            if !variable_local_exists("sub_shadow_xdist_var") { sub_shadow_xdist_var = -2; }
            if !variable_local_exists("sub_shadow_ydist_var") { sub_shadow_ydist_var = 2; }
        }
    }
');
// Create End Event
    // Startup
object_event_add
(argument0,ev_create,3,'
    event_perform(ev_other,ev_room_start);
');
// Create Event
object_event_add
(argument0,ev_create,0,'
    if !variable_local_exists("color_var") { color_var = 2; }
    if !variable_local_exists("reflect_var") { reflect_var = true; }
    event_inherited();
    event_perform(ev_create,1);
    event_perform(ev_create,2);
    event_perform(ev_create,3);
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    if do_snd_var
    {
        fmod_inst_stop_scr(loop_inst_var);
        if fmod_inst_is_3d_scr(inst_var) || !persistent { fmod_inst_stop_scr(inst_var); }
    }
');
// Event Step End
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if do_snd_var
    {
        fmod_inst_set_3d_pos_scr(inst_var,x,y,z+snd_h_var);
        fmod_inst_set_3d_pos_scr(loop_inst_var,x,y,z+snd_h_var);
    }
');