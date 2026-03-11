// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
global.lp_pic_coll[1] = 8;
global.lp_pic_coll[2] = 2;
global.lp_pic_coll[3] = 16;
global.lp_pic_coll[0] = prop_to_coll_scr(1,'',global.lp_pic_coll[3],0,global.lp_pic_coll[1],false,0,global.lp_pic_coll[2]*0.5);
p3dc_set_trimask_scr(mask_metal_const);
global.rail_metal_coll[0] = prop_to_coll_scr(1,'',global.lp_pic_coll[3],0,global.lp_pic_coll[1],false,0,global.lp_pic_coll[2]*0.5);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    type_var = 10; // Single Plane
    w_var = 8;
    h_var = 8;
    radius_var = 1;
    dist_var = 0.1;
    z = 14;
    direction = 270;
    solid_var = false;
    // Trigger
    local.xtmp = x+lengthdir_x(global.door_trig_coll[2]/2,direction);
    local.ytmp = y+lengthdir_y(global.door_trig_coll[2]/2,direction);
    with instance_create(local.xtmp,local.ytmp,interact_trig_obj)
    {
        par_var = other.id;
        str_var = other.name_var;
        coll_var[0] = global.door_trig_coll[0];
        coll_var[1] = global.door_trig_coll[1];
        coll_var[2] = global.door_trig_coll[2];
    }
    // Collisions
    coll_var[0] = global.lp_pic_coll[0];
    coll_var[1] = global.lp_pic_coll[1];
    coll_var[2] = global.lp_pic_coll[2];
    coll_var[3] = global.lp_pic_coll[3]+global.lp_pic_coll[2];
');
// Trigger Event
object_event_add
(argument0,ev_other,ev_user0,'
    if is_string(link_var)
    {
        action_splash_web(link_var,true);
        with instance_create(0,0,pause_menu_obj)
        {
            cam_id_var = other.interact_target_var.cam_id_var;
            player_id_var = other.interact_target_var.player_id_var;
            event_user(1);
        }
    }
');