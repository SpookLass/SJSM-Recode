// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string("NAME","dl","NAME_dl");
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","dl_num","NAME_dl_num");
            break;
        }
    }
    snd_arr[0,1] = ini_read_string("SUB","dl_01","SUB_dl_01"); snd_arr[0,2] = true;
    snd_arr[1,1] = ini_read_string("SUB","dl_02","SUB_dl_02"); snd_arr[1,2] = true;
    snd_arr[2,1] = ini_read_string("SUB","dl_03","SUB_dl_03"); snd_arr[2,2] = true;
    snd_arr[3,1] = ini_read_string("SUB","dl_04","SUB_dl_04"); snd_arr[3,2] = true;
    ini_close();
    type_var = 0;
    spd_base_var = 0.7;
    spr_spd_var = 1/6;
    dur_var = irandom_range(15,25);
    delay_var = 960/7; // 137.r142857
    dmg_var = 30;
    dmg_alarm_var = 160;
    w_var = 10;
    h_var = 24.28;
    z_off_var = 0;
    // Sounds
    snd_len_var = 4;
    wake_snd_var[0] = true;
    snd_num_var = 1;
    snd_den_var = 3;
    snd_alarm_min_var = 240;
    snd_alarm_max_var = 460;
    snd_dist_var = 600;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Special
    open_dist_var = 48;
    warp_update_var = true;
    warp_alarm_var = 60;
    warp_dist_var = 128;
    alarm_len_var = 9;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.close_spr_var = close_spr_var;
            other.open_spr_var = open_spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        close_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS7_01_spr.png",4,false,false,0,0);
        open_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS7_02_spr.png",4,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_wake_snd.wav");
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_mus_snd.mp3");
    }
    // Behavior
    if global.dl_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.dl_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            type_var = 2;
            dmg_alarm_var = 120;
            do_warp_var = true;
            delay_var = 60;
            break;
        }
        case 3: // Old HD
        {
            delay_min_var = 90;
            delay_max_var = 180;
            warp_dist_var = 160;
            local.set = true;
        }
        case 2: // HD
        {
            spd_base_var = 32/45; // 0.7r1
            dur_var = irandom_range(10,20);
            dmg_alarm_var = 180;
            if !local.set
            {
                delay_min_var = 60;
                delay_max_var = 120;
            }
            // Special
            do_warp_var = true;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_var = 500;
            break;
        }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(open_spr_var);
        sprite_delete(close_spr_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if !instance_exists(dl_eff_obj) { instance_create(0,0,dl_eff_obj); }
    warp_var = false;
    event_inherited();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if warp_var 
        || (instance_exists(target_var) && target_dist_var < open_dist_var)
        { spr_var = open_spr_var; }
        else { spr_var = close_spr_var; }
    }
    event_inherited();
');
// Movement Event
object_event_add
(argument0,ev_other,ev_user0,'
    if do_warp_var && !enter_var
    {
        if warp_var
        {
            local.per = alarm_arr[8,0]/alarm_arr[8,1];
            x = lerp_scr(warp_x_var,start_x_var,local.per);
            y = lerp_scr(warp_y_var,start_y_var,local.per);
            z = lerp_scr(warp_z_var,start_z_var,local.per);
            if warp_update_var && instance_exists(target_var)
            {
                event_user(15);
                temp_var = false;
            }
        }
        else 
        {
            if target_dist_var >= warp_dist_var
            {
                start_x_var = x;
                start_y_var = y;
                start_z_var = z;
                event_user(15);
                if temp_var
                {
                    warp_var = true;
                    do_coll_var = false;
                    set_alarm_scr(8,warp_alarm_var);
                    temp_var = false;
                }
            }
            if !warp_var { event_inherited(); }
        }
    }
    else { event_inherited(); }
');
// Warp Event
object_event_add
(argument0,ev_other,ev_user15,'
    /*local.xvec = (x-target_x_var)/target_dist_var;
    local.yvec = (y-target_y_var)/target_dist_var;
    local.zvec = (z-target_z_var)/target_dist_var;*/
    local.dist_2d = point_distance(start_x_var,start_y_var,target_x_var,target_y_var);
    local.xvec = (start_x_var-target_x_var)/local.dist_2d;
    local.yvec = (start_y_var-target_y_var)/local.dist_2d;
    local.zvec = 0;
    // Calculate warp
    local.dist = check_ray_scr(target_x_var,target_y_var,target_z_var+(target_var.coll_var[1]/2),local.xvec,local.yvec,local.zvec);
    local.dir = point_direction(target_x_var,target_y_var,start_x_var,start_y_var);
    local.xtmp = target_x_var+lengthdir_x(local.dist-coll_var[2],local.dir);
    local.ytmp = target_y_var+lengthdir_y(local.dist-coll_var[2],local.dir);
    local.ztmp = target_z_var;
    if target_dist_var > local.dist && !check_coll_scr(-1,0,0,0,local.xtmp,local.ytmp,local.ztmp)
    {
        warp_x_var = local.xtmp;
        warp_y_var = local.ytmp;
        warp_z_var = local.ztmp;
        temp_var = true;
    }
');
// Warp alarm
object_event_add
(argument0,ev_alarm,8,'
    warp_var = false;
    do_coll_var = true;
    x = warp_x_var;
    y = warp_y_var;
    z = warp_z_var;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if warp_var
    {
        d3d_set_hidden(false);
        d3d_set_fog(true,c_red,0,128);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
        d3d_set_hidden(true);
    }
    else { event_inherited(); }
');