// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,pac_control_obj.pac_ghost_obj_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_blend = make_color_rgb(101,255,101);
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_var != noone
    {
        for (local.i=1; local.i<=round(target_dist_var); local.i+=1;)
        {
            local.xtmp = mod_scr(target_var.x+lengthdir_x(local.i,target_var.dir_var*90),ds_grid_width(par_var.map_grid_var));
            local.ytmp = mod_scr(target_var.y+lengthdir_y(local.i,target_var.dir_var*90),ds_grid_height(par_var.map_grid_var));
            local.coll = ds_grid_get(par_var.map_grid_var,local.xtmp,local.ytmp);
            if local.coll == 1 || local.coll == 2 { break; }
            target_x_var = local.xtmp;
            target_y_var = local.ytmp;
        }
    }
');