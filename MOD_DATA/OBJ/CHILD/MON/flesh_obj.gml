// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collision
globalvar flesh_coll;
flesh_coll[1] = 640;
flesh_coll[2] = 0;
flesh_coll[3] = 1280;
local.yradius = flesh_coll[3]/2;
local.zradius = flesh_coll[1]/2;
flesh_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_wall_scr(0,local.yradius,local.zradius,0,-local.yradius,-local.zradius);
p3dc_end_mdl_scr();
// Create Event
object_event_add
(argument0,ev_create,1,'
    ini_open("lang_"+global.lang_var+".ini");
    name_var = translate_mon_str_scr("flesh",global.name_var);
    ini_close();
    // Variables
    spd_base_var = 0.5;
    dur_var = irandom_range(10,20);
    delay_var = 192;
    path_prec_var = 32;
    dupe_var = dupe_never_const;
    alarm_len_var = 2;
    alarm_ini_scr();
    do_possess_var = false;
    do_snd_var = false;
    smart_var = false;
    arrow_var = false;
    angle_var = 0;
    color_prio_var = 0;
    reflect_var = false;
    dead_rm_var = flesh_dead_rm;
    kill_var = true;
    unlock_var = 1;
    // Damage
    dmg_var = 99999;
    dmg_min_var = 0;
    dmg_unbalance_var = false;
    dmg_stam_var = 0;
    // Zone
    zone_var = true;
    zone_start_var = 0;
    // Fog
    fog_color_var = make_color_rgb(135,10,24);
    fog_prio_var = 2;
    fog_start_var = 0;
    fog_end_var = 200;
    fog_start_consume_var = 0;
    fog_end_consume_var = 64;
    for (local.i=0; local.i<global.player_len_var; local.i+=1;)
    { fog_consume_var[local.i] = false; }
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Hurt
    do_hurt_var =  false;
    hurt_spd_mult_var = 0.5; // -0.5
    hurt_alarm_var = 60;
    // Collisions
    coll_var[0] = flesh_coll[0];
    coll_var[1] = flesh_coll[1];
    coll_var[2] = flesh_coll[2];
    coll_var[3] = flesh_coll[3];
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.icon_spr_var = icon_spr_var;
            other.bg_var = bg_var;
            other.wall_bg_var = wall_bg_var;
            other.floor_bg_var = floor_bg_var;
            other.ceil_bg_var = ceil_bg_var;
            other.light_wall_spr_var = light_wall_spr_var;
            other.light_floor_spr_var = light_floor_spr_var;
            other.door_bg_var = door_bg_var;
            other.overlay_bg_var = overlay_bg_var;
            other.arrow_snd_var = arrow_snd_var;
            other.mus_snd_var = mus_snd_var;
            other.zone_list_var = zone_list_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        icon_spr_var = spr_add_scr(flesh_icon_spr_path,3,false,false,0,0);
        bg_var = bg_add_scr(flesh_bg_path,false,false);
        // Textures
        wall_bg_var = bg_add_scr(mad_trim_bg_path,false,false);
        floor_bg_var = bg_add_scr(mad_floor_bg_path,false,false);
        ceil_bg_var = bg_add_scr(mad_ceil_bg_path,false,false);
        light_wall_spr_var = spr_add_scr(flesh_light_wall_spr_path,2,false,false,0,0);
        light_floor_spr_var = spr_add_scr(flesh_light_floor_spr_path,2,false,false,0,0);
        door_bg_var = bg_add_scr(mad_door_bg_path,false,false);
        // Special Textures
        wall_spr_var = spr_add_scr(flesh_wall_spr_path,5,false,false,0,0);
        arrow_bg_var = bg_add_scr(flesh_arrow_bg_path,false,false);
        arrow_base_bg_var = bg_add_scr(flesh_arrow_base_bg_path,false,false);
        // Arrow Sound
        arrow_snd_var = snd_add_scr(flesh_arrow_snd_path,true,snd_group_sfx_const,1,16,128);
        // Overlay
        overlay_bg_var = bg_add_scr(flesh_overlay_bg_path,false,false);
        // Music
        switch theme_scr(global.flesh_theme_var,global.theme_var,1,0,0,1)
        {
            case 1: { mus_snd_var = snd_add_scr(flesh_rom_mus_snd_path,false,snd_group_mus_const,1,0,0); break; }
            default: { mus_snd_var = snd_add_scr(flesh_mus_snd_path,false,snd_group_mus_const,1,0,0); break; }
        }
        // Zone
        zone_list_var = ds_list_create();
        ds_list_clear(zone_list_var);
        ds_list_add(zone_list_var,flesh_02_rm);
        ds_list_add(zone_list_var,flesh_03_rm);
        ds_list_add(zone_list_var,flesh_04_rm);
        ds_list_add(zone_list_var,flesh_05_rm);
        ds_list_add(zone_list_var,flesh_06_rm);
        ds_list_add(zone_list_var,flesh_07_rm);
        ds_list_add(zone_list_var,flesh_08_rm);
        ds_list_add(zone_list_var,flesh_09_rm);
        ds_list_add(zone_list_var,flesh_10_rm);
    }
    arrow_tex_var = background_get_texture(arrow_bg_var);
    arrow_base_tex_var = background_get_texture(arrow_base_bg_var);
    door_tex_var = background_get_texture(door_bg_var);
    // Behavior
    if global.flesh_type_var == -1 { local.type = irandom(4); }
    else { local.type = global.flesh_type_var; }
    switch local.type
    {
        case 3: { zone_var = false; }
        case 0:
        {
            // do_hurt_var = true;
            angle_var = 5;
            smart_var = true;
            dmg_var = 0.5;
            color_prio_var = 1;
            unlock_var = 0;
            // No Gold, Only Arrow
            arrow_var = true;
            break;
        }
        case 2: // HD
        {
            delay_var = 0;
            spd_base_var = 44/225; // 0.19r5
            angle_var = 15;
            unlock_var = 2;
            break;
        }
        case 4:
        {
            if global.mode_var != 0
            {
                spd_base_var *= 2;
                delay_var *= 0.5;
            }
            angle_var = 14;
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
    // Zone
    if zone_var && zone_start_var <= 0
    { zone_override_scr(zone_list_var,noone); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    zone_reset_scr();
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    global.ceil_bg_tex = background_get_texture(global.ceil_bg);
    global.light_wall_obj_spr = global.light_wall_spr;
    global.light_floor_obj_spr = global.light_floor_spr;
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(icon_spr_var);
        background_delete(bg_var);
        background_delete(wall_bg_var);
        background_delete(floor_bg_var);
        background_delete(ceil_bg_var);
        sprite_delete(light_wall_spr_var);
        sprite_delete(light_floor_spr_var);
        background_delete(door_bg_var);
        background_delete(arrow_bg_var);
        background_delete(arrow_base_bg_var);
        sprite_delete(wall_spr_var);
        background_delete(overlay_bg_var);
        fmod_snd_free_scr(mus_snd_var);
        ds_list_destroy(zone_list_var);
    }
    with flesh_tex_obj { if par_var == other.id { instance_destroy(); }}
    with flesh_eff_obj { if par_var == other.id { instance_destroy(); }}
    with fog_flesh_obj { if par_var == other.id { instance_destroy(); }}
    with skybox_par_obj { if par_var == other.id { instance_destroy(); }}
    with mad_door_obj
    {
        if par_var == other.id
        {
            local.door = id;
            if variable_local_exists("spawn_var") { local.spawn = spawn_var; }
			else { local.spawn = -1; }
            with instance_create(x,y,door_obj)
            {
                spawn_var = local.spawn;
                if local.spawn >= 0 { spawn_arr[local.spawn,5] = id; }
                z = local.door.z;
                direction = local.door.direction;
                image_blend = local.door.image_blend;
            }
            instance_destroy();
        }
    }
    with flesh_wall_obj
    {
        if par_var == other.id
        {
            local.wall = id;
            with instance_create(x,y,wall_par_obj)
            {
                z = local.wall.z;
                w_var = local.wall.w_var;
                h_var = local.wall.h_var;
                direction = local.wall.direction;
                image_blend = local.wall.image_blend;
            }
            instance_destroy();
        }
    }
    if arrow_var
    {
        with flesh_arrow_obj
        {
            if par_var == other.id
            {
                on_var = false;
                visible = false;
            }
        }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Reset Position
    local.minx = -1; local.miny = -1; local.maxx = -1; local.maxy = -1;
    with floor_par_obj
    {
        if x-(w_var/2) < local.minx || local.minx == -1 { local.minx = x-(w_var/2); }
        if y-(h_var/2) < local.miny || local.miny == -1 { local.miny = y-(h_var/2); }
        if x+(w_var/2) > local.maxx || local.maxx == -1 { local.maxx = x+(w_var/2); }
        if y+(h_var/2) > local.maxy || local.maxy == -1 { local.maxy = y+(h_var/2); }
    }
    yaw_var = global.spawn_arr[0,3];
    x = ((local.maxx+local.minx)/2)-(sign(cos(yaw_var*pi/180))*(32+local.maxx-local.minx)/2);
    y = ((local.maxy+local.miny)/2)+(sign(sin(yaw_var*pi/180))*(32+local.maxy-local.miny)/2);
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
            if !dead_var
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
    }
    local.delay += delay_var;
    // Textures
    global.wall_bg_tex = background_get_texture(wall_bg_var);
    global.floor_bg_tex = background_get_texture(floor_bg_var);
    global.ceil_bg_tex = background_get_texture(ceil_bg_var);
    global.light_wall_obj_spr = light_wall_spr_var;
    global.light_floor_obj_spr = light_floor_spr_var;
    // Door
    local.par = id;
    if dur_var < 0 || dur_var > 1
    {
        with door_obj
        {
            local.door = id;
            with instance_create(x,y,mad_door_obj)
            {
                if variable_local_exists("spawn_var") { local.spawn = spawn_var; }
			    else { local.spawn = -1; }
                spawn_var = local.spawn;
                if local.spawn >= 0 { spawn_arr[local.spawn,5] = id; }
                z = local.door.z;
                direction = local.door.direction;
                image_blend = local.door.image_blend;
                par_var = local.par;
                store_tex_var = local.par.door_tex_var;
                tex_var = store_tex_var;
            }
            instance_destroy();
        }
        with door_trig_obj
        {
            snd_len_var = 1;
            snd_arr[0] = door_m_02_snd;
        }
    }
    // Walls
    with wall_mon_obj
    {
        spr_var = other.wall_spr_var;
        par_var = other.id;
        instance_change(flesh_wall_obj,true);
    }
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
        with instance_create(0,0,fog_flesh_obj)
        {
            par_var = other.id;
            prio_var = other.fog_prio_var;
            fog_var = true;
            fog_color_var = other.fog_color_var;
            fog_start_var = other.fog_start_var;
            fog_end_var = other.fog_end_var;
            fog_start_consume_var = other.fog_start_consume_var;
            fog_end_consume_var = other.fog_end_consume_var;
            fog_dark_var = false;
            event_user(0);
        }
    }
    // Arrow
    local.arrow = false;
    if arrow_var
    {
        if instance_exists(flesh_arrow_obj)
        {
            with flesh_arrow_obj
            {
                par_var = other.id;
                store_tex_var = other.arrow_tex_var;
                tex_var = store_tex_var;
                store_tex_02_var = other.arrow_base_tex_var;
                tex_02_var = store_tex_02_var;
                on_var = true;
                visible = true;
                inst_var = fmod_snd_3d_loop_scr(other.arrow_snd_var,x,y,z);
                event_user(0);
            }
            with torch_obj
            { instance_destroy(); }
            with color_par_obj { instance_destroy(); }
            with instance_create(0,0,flesh_color_obj)
            {
                par_var = other.id;
                prio_var = 5;
                event_user(0);
            }
            local.arrow = true;
        }
    }
    else if unlock_var > 0 && global.unlock_var >= 0
    {
        if unlock_var == 2 { global.unlock_var = max(1,global.spawn_len_var-2); }
        else { global.unlock_var = 1; }
        for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
        {
            if instance_exists(global.spawn_arr[local.i,4])
            { global.spawn_arr[local.i,4].lock_var = (local.i != global.unlock_var); }
        }
    }
    // Color
    if color_prio_var > 0 && !local.arrow
    {
        with color_par_obj { if prio_var < other.color_prio_var  { instance_destroy(); }}
        if !instance_exists(color_par_obj)
        {
            with instance_create(0,0,bright_color_obj)
            {
                par_var = other.id;
                prio_var = other.color_prio_var;
                event_user(0);
            }
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
            par_var = other.id;
            image_blend = other.image_blend;
            dist_var = 320;
            side_tex_var = other.tex_var;
            top_tex_var = other.tex_var;
            bottom_tex_var = other.tex_var;
            top_tex_w_var *= 20;
            top_tex_h_var *= 20;
            bottom_tex_w_var *= 20;
            bottom_tex_h_var *= 20;
            side_tex_w_var *= 20;
            side_tex_h_var *= 20;
            type_var = 2;
            step_var = 12;
        }
    }
    // Zone
    if zone_var
    {
        if dur_var == 1 { zone_reset_scr(); }
        else if zone_start_var > 0 && dur_start_var-dur_var == zone_start_var-1
        { zone_override_scr(zone_list_var,noone); }
    }
    // Delay
    if local.delay <= 0 { event_perform(ev_alarm,0); }
    else { set_alarm_scr(0,local.delay); }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var
    {
        if hurt_var { set_motion_3d_scr(spd_base_var*hurt_spd_mult_var,true); }
        else { set_motion_3d_scr(spd_base_var,true); }
        // Damage
        local.dead = (dmg_min_var <= 0);
        local.success = false;
        local.dmg = dmg_var*global.delta_time_var;
        with player_obj
        {
            other.fog_consume_var[cam_id_var] = false;
            if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
            {
                // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
                if abs(deg_diff_scr(other.yaw_var,point_direction(other.x,other.y,x,y))) > 90
                {
                    if atk_player_scr
                    (
                        id,other.id, // Player & Monster
                        other.dmg_var*global.delta_time_var,0,other.dmg_min_var, // Damage
                        false,0, // Collisions
                        !other.dmg_unbalance_var,false, // Effects
                        false,noone, // Possess
                        other.dmg_stam_var // Stamina?
                    )
                    {
                        local.success = true;
                        other.atk_target_var = id;
                        other.fog_consume_var[cam_id_var] = true;
                    }
                }
            }
            if !dead_var { local.dead = false; }
        }
        if local.success && local.dead && !possess_var && !global.debug_var
        { kill_scr(atk_target_var,object_index,dead_rm_var,kill_var); }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    on_var = true;
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,1,'
    hurt_var = false;
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if hurt_alarm_var > 0
    {
        hurt_var = true;
        set_alarm_scr(1,hurt_alarm_var);
        fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd));
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var
    {
        d3d_set_culling(true);
        if fog_immune_var { d3d_set_fog(false,c_black,0,0); }
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_y(angle_var);
        d3d_transform_add_rotation_z(yaw_var);
        d3d_transform_add_translation(x,y,z);
        d3d_draw_wall(0,640,320,0,-640,-320,tex_var,40,20);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if fog_immune_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
        d3d_set_culling(false);
    }
');