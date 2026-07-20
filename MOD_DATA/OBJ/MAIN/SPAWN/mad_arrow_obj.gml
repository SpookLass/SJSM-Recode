// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    // Assets
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[20,0]);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[21,0]);
        tex_02_var = store_tex_02_var;
    }
    // Variables
    snap_var = 1; // Snap to floor
    event_inherited();
    flesh_var = false;
    solid_var = false;
    type_var = 4; // Floor
    w_var = 44;
    l_var = 18;
    dist_var = 4;
    color_var = 3;
    // Base
    tex_w_02_var = 1;
    tex_h_02_var = 1;
    w_02_var = 16;
    l_02_var = 16;
    dist_02_var = 1;
    // Bob
    dist_base_var = dist_var;
    bob_var = true;
    bob_time_var = 0;
    bob_mult_var = 1; // 16/15 1.0r6
    bob_rate_var=1800;
    // Special
    player_var = true;
    turn_rate_var = 0;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if player_var
    {
        local.player = instance_nearest(x,y,player_obj)
        if instance_exists(local.player)
        {
            target_dir_var = point_direction(x,y,local.player.x,local.player.y);
            if turn_rate_var <= 0 { direction = target_dir_var; }
        }
    }
    if turn_rate_var > 0
    { direction = turn_scr(direction,target_dir_var,turn_rate_var*global.delta_time_var); }
    if bob_var
    {
        bob_time_var = (bob_time_var+global.delta_time_var) mod bob_rate_var;
        dist_var = dist_base_var+(sin(2*bob_time_var*pi/bob_rate_var)*bob_mult_var/2);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    d3d_transform_set_identity();
    d3d_transform_add_translation(x,y,z);
    d3d_draw_floor(-w_02_var/2,-l_02_var/2,dist_02_var,w_02_var/2,l_02_var/2,dist_02_var,tex_02_var,tex_w_02_var,tex_h_02_var);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    // I think this is the right order
    event_inherited();
');