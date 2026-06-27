// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    true_time_var = true;
    char_var = 0;
    char_alarm_var = 3;
    char_delay_min_var = 15;
    char_delay_max_var = 30;
    str_draw_var = "";
    str_var = "";
    scale_var = 1;
    scale_min_var = 0.125;
    par_var = noone;
    inst_var = noone;
    alarm_len_var = 1;
    alarm_ini_scr();
');
// String Alarm Event
object_event_add
(argument0,ev_alarm,0,'
    if char_var < string_length(str_var)
    {
        // Sound
        if frac_chance_scr(1,ceil(0.25*instance_number(object_index)))
        {
            fmod_inst_stop_scr(inst_var);
            inst_var = fmod_snd_play_scr(load_par_obj.snd_arr_var[irandom_range(1,load_par_obj.snd_len_var-1),0]);
        }
        char_var += 1;
        // Next string
        if char_var >= string_length(str_var)
        {
            str_draw_var = str_var;
            event_user(0);
            set_alarm_scr(0,random_range(char_delay_min_var,char_delay_max_var));
        }
        else
        {
            str_draw_var = string_copy(str_var,0,char_var);
            set_alarm_scr(0,char_alarm_var);
        }
    }
    else { event_user(0); }
');
// Summon Text
object_event_add
(argument0,ev_other,ev_user0,'
    local.str = par_var.str_var[irandom(par_var.str_len_var-1)];
    local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
    local.width = (view_wview[0]-(string_width(local.str)*0.5*max(scale_min_var,scale_var*local.viewscale)))/local.viewscale;
    local.height = (view_hview[0]-(string_height(local.str)*max(scale_min_var,scale_var*local.viewscale)))/local.viewscale;
    local.xtmp = random_range(-24,local.width+24);
    local.ytmp = random_range(-24,local.height+24);
    with instance_create(local.xtmp,local.ytmp,sg_dead_str_obj)
    {
        str_var = local.str;
        char_alarm_var = other.char_alarm_var;
        char_delay_min_var = other.char_delay_min_var;
        char_delay_max_var = other.char_delay_max_var;
        scale_var = other.scale_var;
        scale_min_var = other.scale_min_var;
        image_blend = other.image_blend;
        par_var = other.par_var;
        set_alarm_scr(0,char_alarm_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    // Draw
    draw_set_alpha(image_alpha); draw_set_color(image_blend);
    draw_str_scr(str_draw_var,x,y,scale_var,scale_var,scale_min_var,fa_left,fa_top,image_angle);
    draw_set_alpha(1); draw_set_color(c_white);
    // Reset
    d3d_set_hidden(true);
');