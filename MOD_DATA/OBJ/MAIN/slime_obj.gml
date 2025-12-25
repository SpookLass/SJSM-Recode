// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Collision
    coll_var[0] = global.slime_trig_coll[0];
    coll_var[1] = global.slime_trig_coll[1];
    coll_var[2] = global.slime_trig_coll[2];
    // Slime
    direction = random(360);
    z_off_var = 0.15;
    image_alpha = 0.8;
    w_var = 28;
    spd_mult_var = 0.6;
    tp_var = true;
    touch_var = false;
    if instance_exists(color_par_obj) && global.color_var == 0
    { image_blend = color_par_obj.image_blend; }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    with player_obj
    {
        if on_floor_var && !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
        {
            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
            {
                spd_mult_var *= other.spd_mult_var;
                other.touch_var = true;
            }
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_transform_set_identity();
    d3d_transform_set_rotation_z(direction);
    d3d_transform_add_translation(x,y,z+z_off_var);
    local.radius = w_var/2;
    d3d_draw_floor(-local.radius,-local.radius,0,local.radius,local.radius,0,tex_var,1,1);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');