// Builtin Variables
object_set_depth(argument0,-103);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            other.js_snd_var = js_snd_var;
            local.loaded = true;
        }
    }
    if !local.loaded
    {
        spr_var = sprite_add(main_directory_const+"\SPR\MON\otter8_js_spr.png",12,false,false,0,0);
        js_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\otter8_js_snd.wav",false);
    }
    snd_var = 0;
    alarm_len_var = 2;
    chance_alarm_var = 60;
    chance_num_var = 1;
    chance_den_var = 1987;
    anim_alarm_var = 24;
    set_alarm_scr(0,chance_alarm_var+irandom(chance_alarm_var));
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        fmod_snd_free_scr(js_snd_var);
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if visible
    {
        spr_id_var = floor(lerp_scr(sprite_get_number(spr_var),0,alarm_arr[1,0]/alarm_arr[1,1]));
    }
');
// Jump alarm
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(chance_num_var,chance_den_var)
    {
        visible = true
        snd_var = fmod_snd_play_scr(js_snd_var)
        spr_id_var = 0;
        set_alarm_scr(1,anim_alarm_var)
    }
    else { set_alarm_scr(0,chance_alarm_var); }
');
// Stop Alarm
object_event_add
(argument0,ev_alarm,1,'
    fmod_inst_stop_scr(snd_var);
    visible = false
    spr_id_var = 0;
    set_alarm_scr(0,chance_alarm_var);
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    // Nothin
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    if alarm_arr[0,0] <= 0 && alarm_arr[1,0] <= 0
    { set_alarm_scr(0,60); visible = false; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_sprite_stretched_ext
        (spr_var,spr_id_var,0,0,view_wview[view_current],view_hview[view_current],image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');