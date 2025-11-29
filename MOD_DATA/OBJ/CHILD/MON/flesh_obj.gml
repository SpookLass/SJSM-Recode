// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string("NAME","flesh","NAME_flesh");
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","flesh_num","NAME_flesh_num");
            break;
        }
    }
    ini_close();
    // Variables
    spd_base_var = 0.5;
    dur_var = irandom_range(10,20);
    delay_var = 192;
    dmg_var = 99999;
    path_prec_var = 32;
    dupe_var = dupe_never_const;
    alarm_len_var = 1;
    color_var = true;
    // Fog
    fog_color_var = make_color_rgb(135,10,24);
    fog_prio_var = 2;
    fog_start_var = 0;
    fog_end_var = 200;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.bg_var = bg_var;
            other.wall_bg_var = wall_bg_var;
            other.floor_bg_var = floor_bg_var;
            other.ceil_bg_var = ceil_bg_var;
            other.light_wall_spr_var = light_wall_spr_var;
            other.light_floor_spr_var = light_floor_spr_var;
            other.overlay_bg_var = overlay_bg_var;
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = background_add(main_directory_const+"\BG\MON\flesh_bg.png",false,false);
        wall_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB5_01_tex.png",false,false);
        floor_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB5_04_tex.png",false,false);
        ceil_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB5_06_tex.png",false,false);
        light_wall_spr_var = sprite_add(main_directory_const+"\SPR\MON\flesh_light_wall_spr.png",2,false,false,0,0);
        light_floor_spr_var = sprite_add(main_directory_const+"\SPR\MON\flesh_light_floor_spr.png",2,false,false,0,0);
        overlay_bg_var = background_add(main_directory_const+"\BG\MON\flesh_overlay_bg.png",false,false);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\flesh_mus_snd.mp3");
        fmod_snd_set_loop_point_scr(mus_snd_var,5/22,9/11); // Ohhh 9/11
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    // Behavior
    if global.flesh_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.flesh_type_var; }
    switch local.type
    {
        case 0:
        {
            angle_var = 5;
            smart_var = true;
            dmg_var = 0.5;
            break;
        }
        case 2: // HD
        {
            break;
        }
    }
    // Asset stuff
    with instance_create(0,0,flesh_tex_obj)
    {
        par_var = other.id;
        bg_var = other.bg_var;
        other.tex_var = tex_var;
    }
    with mus_control_obj { event_user(0); }
    // Inherit
    event_inherited();
    // Room Start
    event_perform(ev_other,ev_room_start);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    global.ceil_bg_tex = background_get_texture(global.ceil_bg);
    global.light_wall_obj_spr = global.light_wall_spr;
    global.light_floor_obj_spr = global.light_floor_spr;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        background_delete(bg_var);
        background_delete(wall_bg_var);
        background_delete(floor_bg_var);
        background_delete(ceil_bg_var);
        sprite_delete(light_wall_spr_var);
        sprite_delete(light_floor_spr_var);
        background_delete(overlay_bg_var);
        fmod_snd_free_scr(mus_snd_var);
    }
    with flesh_tex_obj { if par_var == other.id { instance_destroy(); }}
    with flesh_eff_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Color
    if !color_var || !instance_exists(color_par_obj) || global.color_var == 1
    { image_blend = c_white; }
    // Reset Position
    yaw_var = global.spawn_arr[0,3];
    x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
    y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
    z = global.spawn_arr[0,2];
    set_motion_3d_scr(0,true,yaw_var,true,0,true);
    // Reset Variables
    on_var = false;
    // Calculate Delay
    local.delay = 0;
    if smart_var
    {
        //show_message("Testing!");
        local.nerf = (instance_number(mon_par_obj) > 1);
        with player_obj
        {
            local.dist = path_get_length(path_var);
            if local.dist > 0
            {
                local.check = local.dist/other.path_prec_var;
                for (local.i=0; local.i<local.check; local.i+=1;)
                {
                    local.per = local.i/local.check;
                    local.xtmp = path_get_x(path_var,local.per);
                    local.ytmp = path_get_y(path_var,local.per);
                    local.dist = point_line_dist_scr(other.x,other.y,other.yaw_var+90,local.xtmp,local.ytmp);
                    local.fleshtime = local.dist/other.spd_base_var;
                    if local.nerf { local.time = walk_clear_time_var*local.per; }
                    else { local.time = clear_time_var*local.per; }
                    local.newdelay = local.time-local.fleshtime;
                    local.delay = max(local.delay,local.newdelay);
                    /*show_message("Percentage: "+string(local.per)+"
X: "+string(local.xtmp)+"
Y: "+string(local.ytmp)+"
Flesh Distance: "+string(local.dist)+"
Flesh Time: "+string(local.fleshtime)+"
Player Time: "+string(local.time)+"
Difference: "+string(local.newdelay)+"
");*/
                }
            }
        }
    }
    local.delay += delay_var;
    // Textures
    global.wall_bg_tex = background_get_texture(wall_bg_var);
    global.floor_bg_tex = background_get_texture(floor_bg_var);
    global.ceil_bg_tex = background_get_texture(ceil_bg_var);
    global.light_wall_obj_spr = light_wall_spr_var;
    global.light_floor_obj_spr = light_floor_spr_var;
    // Effect
    if !instance_exists(flesh_eff_obj)
    {
        with instance_create(0,0,flesh_eff_obj)
        {
            par_var = other.id;
            bg_var = other.overlay_bg_var;
        }
    }
    // Fog
    with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
    if !instance_exists(fog_par_obj)
    {
        with instance_create(0,0,fog_par_obj)
        {
            prio_var = other.fog_prio_var;
            fog_var = true;
            fog_color_var = other.fog_color_var;
            fog_start_var = other.fog_start_var;
            fog_end_var = other.fog_end_var;
            fog_dark_var = false;
            event_user(0);
        }
    }
    // Skybox
    fog_immune_var = instance_exists(skybox_par_obj);
    if fog_immune_var
    {
        with skybox_par_obj { instance_destroy(); }
        with rain_part_obj { instance_destroy(); }
        with instance_create(0,0,skybox_par_obj)
        {
            dist_var = 320;
            side_tex_var = other.tex_var;
            top_tex_var = other.tex_var;
            bottom_tex_var = other.tex_var;
            top_tex_w_var *= 10;
            top_tex_h_var *= 10;
            bottom_tex_w_var *= 10;
            bottom_tex_h_var *= 10;
            side_tex_w_var *= 10;
            side_tex_h_var *= 10;
            type_var = 1;
            step_var = 12;
        }
    }
    // Delay
    set_alarm_scr(0,local.delay);
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var
    {
        set_motion_3d_scr(spd_base_var,true);
        // Damage
        local.kill = 0;
        with player_obj
        {
            if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
            {
                // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
                if abs(deg_diff_scr(other.yaw_var,point_direction(other.x,other.y,x,y))) > 90
                {
                    if hp_var > other.dmg_var
                    { hp_var -= other.dmg_var; }
                    else
                    {
                        hp_var = 0;
                        dead_var = true;
                        do_coll_var = false;
                        grav_var = false;
                        if local.kill == 0
                        { local.kill = 1; }
                    }
                    other.attack_target_var = id;
                    local.success = true;
                }
            }
            if !dead_var { local.kill = -1; }
        }
        if false//local.kill
        {
            global.dead_mon_var = object_index;
            instance_destroy();
            room_goto_scr(dead_rm_var);
        }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    on_var = true;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var
    {
        if fog_immune_var { d3d_set_fog(false,c_black,0,0); }
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_y(angle_var);
        d3d_transform_add_rotation_z(yaw_var);
        d3d_transform_add_translation(x,y,z);
        d3d_draw_wall(0,320,320,0,-320,-320,tex_var,20,20);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if fog_immune_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
    }
');