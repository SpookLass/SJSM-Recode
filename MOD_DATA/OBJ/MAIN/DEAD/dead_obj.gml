// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu4_tex.png",false,false);
    bg_var = background_add(main_directory_const+"\BG\DEAD\dead_bg.png",false,false);
    fade_spr_var = execute_file(main_directory_const+"\SPR\UI\static_fade_spr.gml",main_directory_const+"\SPR\UI\static_fade_spr.png");
    str_var = "Your soul wanders an endless maze";
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[interact_input_const,global.dead_player_var] == 1
    || global.input_press_arr[back_input_const,global.dead_player_var] == 1
    || global.input_press_arr[pause_input_const,global.dead_player_var] == 1
    { event_perform(ev_alarm,1); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    set_alarm_scr(1,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);

    draw_str_ext_shadow_scr(str_var,0,464,1,1,0.125,fa_center,fa_top,-1,0,)

    d3d_set_hidden(true);
');