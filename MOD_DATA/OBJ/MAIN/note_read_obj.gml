// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[interact_input_const,player_id_var] == 1
    { with par_var { event_user(3); }}
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[par_var.cam_id_var],view_hview[par_var.cam_id_var],0);
        d3d_set_hidden(false);
        local.scale = view_hview[par_var.cam_id_var]/720;
        local.xtmp = (view_wview[par_var.cam_id_var]/2)-(300*local.scale);
        local.ytmp = (view_hview[par_var.cam_id_var]/2)-(340*local.scale);
        draw_surface_ext(surf_var,local.xtmp,local.ytmp,local.scale,local.scale,0,image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');