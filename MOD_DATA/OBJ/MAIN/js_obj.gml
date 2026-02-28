object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Collision
global.js_coll[1] = 14;
global.js_coll[2] = 14;
global.jsr_coll[0] = prop_to_coll_scr(9,'',global.js_coll[2],0,global.js_coll[1],false,0,1);
global.jsl_coll[0] = prop_to_coll_scr(9,'',-global.js_coll[2],0,global.js_coll[1],false,0,1);
// Create event
object_event_add
(argument0,ev_create,0,'
    note_var = noone;
    load_var = false;
    inst_var = noone;
    silent_var = false;
    hit_var = false;
    if global.js_override_var
    {
        chance_num_var = global.js_override_num_var;
        chance_den_var = global.js_override_den_var;
    }
    else if !variable_local_exists("chance_num_var")
    {
        chance_num_var = 1;
        chance_den_var = global.js_chance_var;
    }
    if frac_chance_scr(chance_num_var,chance_den_var)
    {
        snd_dist_min_var = 0;
        snd_dist_max_var = 0;
        snd_3d_var = false;
        freeze_var = true;
        rotate_var = false;
        look_var = false;
        stop_snd_var = true;
        flesh_var = false;
        // Main
        event_inherited();
        solid_var = true;
        type_var = 9;
        z += 8;
        w_var = 14;
        h_var = 14;
        radius_var = 1;
        if variable_local_exists("base_dir_var") { base_dir_var += 180; }
        else { base_dir_var = 180; }
        jump_dir_var = -90;
        direction = base_dir_var;
        dist_var = 0.1;
        tex_w_var = -1;
        // Special
        delay_var = 6;
        alarm_len_var = 1;
        alarm_ini_scr();
        weapon_var = true;
        // Collisions
        coll_var[0] = global.jsr_coll[0];
        coll_var[1] = global.js_coll[1];
        coll_var[2] = global.js_coll[2];
        // Behavior
        if global.js_type_var == -1 { local.type = irandom(3); }
        else { local.type = global.js_type_var; }
        switch local.type
        {
            case global.type_len_var:
            {
                look_var = true;
            }
            case 0:
            {
                snd_3d_var = true;
                freeze_var = 2;
                rotate_var = true;
                break;
            }
            case 2:
            {
                snd_3d_var = true;
                freeze_var = false;
                rotate_var = true;
                snd_dist_max_var = 600;
                stop_snd_var = false;
                break;
            }
        }
        // Assets
        load_var = true;
        if global.mode_var == 0
        {
            if global.rm_count_var < 600 { local.tex = irandom(6); local.snd = global.js_snd_arr[irandom(7)]; }
            else { local.tex = irandom(global.js_story_len_var-1); local.snd = global.js_snd_arr[irandom(global.js_snd_story_len_var-1)]; }
        }
        else { local.tex = irandom(global.js_len_var-1); local.snd = global.js_snd_arr[irandom(global.js_snd_len_var-1)]; }
        bg_01_var = background_add(global.js_arr[local.tex,0],false,false);
        bg_02_var = background_add(global.js_arr[local.tex,1],false,false);
        snd_var = fmod_snd_add_scr(local.snd,snd_3d_var);
        store_tex_var = background_get_texture(bg_01_var);
        tex_var = store_tex_var;
        store_tex_02_var = background_get_texture(bg_02_var);
        tex_02_var = store_tex_02_var;
        if snd_dist_max_var > 0
        { fmod_snd_set_minmax_dist_scr(snd_var,0,snd_dist_max_var); }
        // Trigger
        if !variable_local_exists("trig_var")
        {
            with instance_create(x+lengthdir_x(16,base_dir_var-90),y+lengthdir_y(16,base_dir_var-90),js_trig_obj)
            {
                par_var = other.id;
                other.trig_var = id;
                z = other.z-8;
                local.dir = round(other.base_dir_var/90);
                if local.dir mod 2 != 0 // Rotate 90 degrees
                {
                    local.coll = coll_var[2]
                    coll_var[2] = coll_var[3];
                    coll_var[3] = local.coll;
                }
                direction = local.dir*90;
            }
        }
        // Left
        if !irandom(1)
        {
            w_var *= -1;
            jump_dir_var *= -1;
            coll_var[0] = global.jsl_coll[0];
            x += lengthdir_x(32,base_dir_var-90);
            y += lengthdir_y(32,base_dir_var-90);
        }
        // Note
        if global.note_override_var
        {
            local.num = global.note_override_num_var;
            local.den = global.note_override_den_var;
        }
        else
        {
            local.num = !instance_exists(enemy_par_obj);
            local.den = 2;
        }
        if frac_chance_scr(local.num,local.den) && is_string(note_scr()) && !instance_exists(note_obj)
        {
            local.xtmp = x+lengthdir_x(w_var/2,base_dir_var-90);
            local.ytmp = y+lengthdir_y(w_var/2,base_dir_var-90);
            with instance_create(local.xtmp,local.ytmp,note_js_obj)
            {
                par_var = other.id;
                z = other.z+(other.h_var/2)-(h_var/2);
                other.note_var = id;
                visible = false;
            }
        }
    }
    else { instance_destroy(); }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    if instance_exists(note_var)
    { with note_var { instance_destroy(); }}
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
        background_delete(bg_01_var);
        background_delete(bg_02_var);
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Jumpscare!
object_event_add
(argument0,ev_other,ev_user1,'
    visible = true;
    switch freeze_var
    {
        case 1: { local.freeze = true; break; }
        case 2: { local.freeze = !instance_exists(mon_par_obj); break; }
        default: { local.freeze = false; break; }
    }
    if local.freeze
    {
        if look_var
        {
            local.xtmp = x+lengthdir_x(w_var/2,direction-90);
            local.ytmp = y+lengthdir_y(w_var/2,direction-90);
            local.ztmp = z+(h_var/2);
            with player_var
            {
                eye_yaw_var = point_direction(x,y,local.xtmp,local.ytmp);
                eye_pitch_var = point_direction_3d_scr(x,y,z+eye_h_var,local.xtmp,local.ytmp,local.ztmp)
            }
        }
        with instance_create(0,0,player_freeze_obj) { player_var = other.player_var; }
    }
    if !silent_var
    {
        if snd_3d_var { inst_var = fmod_snd_3d_play_scr(snd_var); }
        else { inst_var = fmod_snd_play_scr(snd_var); }
    }
    if rotate_var
    {
        direction = base_dir_var+jump_dir_var;
        set_alarm_scr(0,delay_var);
    }
    if instance_exists(note_var)
    {
        with note_var
        {
            visible = true;
            if other.rotate_var
            {
                direction = other.direction;
                x = other.x+lengthdir_x(other.w_var/2,other.direction-90);
                y = other.y+lengthdir_y(other.w_var/2,other.direction-90);
            }
        }
        
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if alarm_arr[0,0] > 0
    {
        direction = lerp_scr(base_dir_var,base_dir_var+jump_dir_var,alarm_arr[0,0]/alarm_arr[0,1]);
        if instance_exists(note_var)
        {
            with note_var
            {
                direction = other.direction;
                x = other.x+lengthdir_x(other.w_var/2,other.direction-90);
                y = other.y+lengthdir_y(other.w_var/2,other.direction-90);
            }
        }
    }
    if snd_3d_var && fmod_inst_is_play_scr(inst_var)
    { fmod_inst_set_3d_pos_scr(inst_var,x+lengthdir_x(w_var/2,direction-90),y+lengthdir_y(w_var/2,direction-90),z+(h_var/2)); }
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    direction = base_dir_var;
    if instance_exists(note_var)
    {
        with note_var
        {
            direction = other.direction;
            x = other.x+lengthdir_x(other.w_var/2,other.direction-90);
            y = other.y+lengthdir_y(other.w_var/2,other.direction-90);
        }
    }
');
// Die
object_event_add
(argument0,ev_other,ev_user4,'
    if !hit_var
    {
        hit_var = true;
        solid_var = false;
        w_var *= 0.25;
        tex_w_var *= 0.25;
        if stop_snd_var { fmod_inst_stop_scr(inst_var); }
        fmod_snd_play_scr(choose(card_01_snd,card_02_snd,card_03_snd,card_04_snd));
        hurt_target_var.violence_var += 1;
        if instance_exists(note_var)
        {
            with note_var
            { instance_destroy(); }
        }
    }
');