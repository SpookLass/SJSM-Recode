// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Translate
    ini_open(global.lang_var);
    str_var[0] = "";
    str_var[1] = string_replace_all(ini_read_string("DEAD","clown","DEAD_clown"),"@l","
");
    str_var[2] = ini_read_string("DEAD","fool","DEAD_fool");
    str_var[3] = "";
    ini_close();
    // Sound
    inst_var = fmod_snd_play_scr(load_par_obj.snd_arr_var[0,0]);
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    // Spin Clowns
    dir_add_var = 6;
    dist_var = 44;
    clown_len_var = 12;
    // Draw
    image_blend = c_black;
    image_alpha = 0;
    str_color_var = c_white;
    str_alpha_var = 0.5;
    str_alpha_min_var = 0;
    str_alpha_max_var = 0.75;
    alpha_min_var = 0;
    alpha_max_var = 0.25;
    str_yscale_var = 1;
    str_yscale_min_var = 1;
    str_yscale_max_var = 1.2;
    // State
    state_var = 0;
    state_len_var = 3;
    alarm_var[0] = 187.8;
    alarm_var[1] = 309;
    alarm_var[2] = 263.4;
    str_scale_var[0] = 1;
    str_scale_var[1] = 0.5;
    str_scale_var[2] = 2;
    str_scale_var[3] = 1;
    // Alarm
    set_alarm_scr(0,alarm_var[state_var]);
');
// Alarm Event
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    switch state_var
    {
        
        case state_len_var:
        {
            with load_par_obj { instance_destroy(); }
            rm_goto_menu_scr(dead_rm,true);
            break;
        }
        case 2:
        {
            with clown_dead_obj { instance_destroy(); }
            for (local.i=0; local.i<clown_len_var; local.i+=1;)
            {
                local.dir = direction+(360*local.i/clown_len_var);
                with instance_create(cam_dead_obj.x+lengthdir_x(local.dir,dist_var),cam_dead_obj.y+lengthdir_y(local.dir,dist_var),clown_dead_spin_obj)
                {
                    par_var = other.id;
                    store_tex_var = sprite_get_texture(load_par_obj.spr_arr_var[0,0],mod_scr(local.i,sprite_get_number(load_par_obj.spr_arr_var[0,0])));
                    tex_var = store_tex_var;
                    dist_var = other.dist_var;
                    id_var = local.i;
                    id_len_var = other.clown_len_var;
                }
            }
            with clown_dead_color_obj { dir_add_var *= 2; }
            with instance_create(0,0,fade_eff_obj)
            {
                invert_var = true;
                image_blend = c_black;
                set_alarm_scr(0,other.alarm_var[other.state_var]);
            }
            set_alarm_scr(0,alarm_var[state_var]);
            break;
        }
        case 1:
        {
            if !global.reduce_flash_var { set_alarm_scr(1,1); }
            instance_create(x,y,clown_dead_color_obj);
            with clown_dead_fog_obj { fog_end_var = 128; event_user(0); }
            with clown_dead_obj { set_alarm_scr(0,tp_alarm_var); }
        }
        default:
        {
            set_alarm_scr(0,alarm_var[state_var]);
            break;
        }
    }
');
// Anim Event
object_event_add
(argument0,ev_alarm,1,'
    image_alpha = random_range(alpha_min_var,alpha_max_var);
    str_alpha_var = random_range(str_alpha_min_var,str_alpha_max_var);
    str_yscale_var = random_range(str_yscale_min_var,str_yscale_max_var);
    set_alarm_scr(1,1);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if state_var >= 1 { direction += dir_add_var*global.delta_time_var; }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    // Text
    draw_set_color(str_color_var); draw_set_alpha(str_alpha_var); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_ext_scr(str_var[state_var],0,0,str_scale_var[state_var],str_scale_var[state_var]*str_yscale_var,0.125,fa_center,fa_middle,-1,108,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white); draw_set_alpha(1);
    d3d_set_hidden(true);
');