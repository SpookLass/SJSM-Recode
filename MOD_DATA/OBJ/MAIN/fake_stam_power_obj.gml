// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    dur_var = 15;
    event_inherited();
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    with player_var
    {
        if do_sprint_var
        {
            do_stam_var = false;
            do_sprint_var = false;
        }
    }
');
// Begin
object_event_add
(argument0,ev_other,ev_user0,'
    if player_var == player_obj { local.cam = -1; }
    else if instance_exists(player_var) { local.cam = player_var.cam_id_var; }
    // Effects
    if !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_white; 
            set_alarm_scr(0,6);
            cam_id_var = local.cam;
        }
    }
    fmod_snd_play_scr(lightning_01_snd);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    fmod_snd_play_scr(magic_01_snd);
    with player_var
    {
        if !do_sprint_var
        {
            do_stam_var = true;
            do_sprint_var = true;
        }
    }
');