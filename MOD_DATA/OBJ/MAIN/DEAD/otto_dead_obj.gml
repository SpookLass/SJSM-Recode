// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // String
    image_xscale = 0.4;
    image_yscale = 0.4;
    image_alpha = 0.8;
    // Assets
    load_var = true;
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS26_01_spr.png",3,false,false,100,65);
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\otto_js_snd.wav",false);
    // Sound
    inst_var = noone;
    // Animate
    scale_state_var = 0;
    scale_var[0] = 1470;
    scale_var[1] = 1680;
    image_xscale = scale_var[scale_state_var];
    // State
    state_var = 0;
    alarm_var[0] = 120;
    alarm_var[1] = 180;
    alarm_var[2] = 87;
    alarm_var[3] = 17;
    alarm_var[4] = 30;
    // Alarm
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,alarm_var[state_var]);
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        fmod_snd_free_scr(snd_var);
        sprite_delete(spr_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { rm_goto_menu_scr(dead_rm,false); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    switch state_var
    {
        case 1:
        case 3:
        {
            inst_var = fmod_snd_play_scr(snd_var);
            visible = true;
            set_alarm_scr(0,alarm_var[state_var]);
            set_alarm_scr(1,3);
            break;
        }
        case 2:
        case 4:
        {
            fmod_inst_stop_scr(inst_var);
            visible = false;
            set_alarm_scr(0,alarm_var[state_var]);
            set_alarm_scr(1,-1);
            break;
        }
        case 5: { rm_goto_menu_scr(dead_rm,false); break; }
    }
    
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    scale_state_var = !scale_state_var;
    image_xscale = scale_var[scale_state_var];
    set_alarm_scr(1,3);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_spr_stretch_scr(spr_var,0,0,0,image_xscale,0,fa_center,fa_middle);
    d3d_set_hidden(true);
');