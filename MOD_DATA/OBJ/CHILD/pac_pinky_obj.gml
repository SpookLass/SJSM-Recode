// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,pac_ghost_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_blend = make_color_rgb(255,212,255);
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_var != noone
    {
        target_x_var = mod_scr(target_x_var+lengthdir_x(4,target_var.dir_var*90),ds_grid_width(par_var.map_grid_var));
        target_y_var = mod_scr(target_y_var+lengthdir_y(4,target_var.dir_var*90),ds_grid_height(par_var.map_grid_var));
    }
');