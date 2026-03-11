// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,lp_pic_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = sprite_get_texture(lp_jel_spr,sprite_get_number(lp_jel_spr)-1);
    name_var = "JELlegendz";
    link_var = "https://www.youtube.com/watch?v=ECJrtPjvTiI";
    // https://www.youtube.com/@JELlegendz
    event_inherited();
    // Easter Egg
    spr_id_var = sprite_get_number(lp_jel_spr)-1;
    spr_spd_var = 1;
    wait_spd_var = 0.1;
    unseen_spd_var = 0.01;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    local.seen = false;
    with player_obj
    {
        if on_var
        {
            local.hfov = convert_fov_scr(current_fov_var,view_wview[cam_id_var],view_hview[cam_id_var],1);
            if seen_scr
            (
                local.hfov*0.5,current_fov_var*0.5,-1,
                eye_yaw_var,eye_pitch_var,
                x,y,z+eye_h_var,
                false,false,
                other.coll_var[1],other.coll_var[3],
                other.x,other.y,other.z
            ) > 0
            { local.seen = true; break; }
        }
    }
    if local.seen
    {
        if spr_id_var < sprite_get_number(lp_jel_spr)-1
        {
            if spr_id_var < 1 { local.spd = wait_spd_var; } else { local.spd = spr_spd_var; }
            spr_id_var = min(sprite_get_number(lp_jel_spr)-1,spr_id_var+(local.spd*global.delta_time_var));
            store_tex_var = sprite_get_texture(lp_jel_spr,floor(spr_id_var));
            tex_var = store_tex_var;
        }
    }
    else
    {
        if spr_id_var > 0
        {
            spr_id_var = max(0,spr_id_var-(unseen_spd_var*global.delta_time_var));
            store_tex_var = sprite_get_texture(lp_jel_spr,floor(spr_id_var));
            tex_var = store_tex_var;
        }
    }
');