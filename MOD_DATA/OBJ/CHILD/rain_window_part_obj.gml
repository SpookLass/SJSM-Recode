// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,rain_part_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Bounding Box
    w_var = 256;
    l_var = 256;
    h_var = 128;
    // Particles
    part_len_var = 100;
    part_spawn_var = 4;
    do_coll_var = true;
    // Ring
    do_ring_var = false;
    // Spawning
    player_var = false;
    local.dir = part_yaw_var+180;
    local.dist = tan(degtorad(90+part_pitch_var))*h_var;
    x_off_var = lengthdir_x(local.dist,local.dir);
    y_off_var = lengthdir_y(local.dist,local.dir);
    // Effects
    fade_dist_var = 0;
    fog_var = true;
');