// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Make collisions
global.bed_coll[1] = 7;
global.bed_coll[2] = 30;
global.bed_coll[3] = 20;
global.bed_coll[0] = prop_to_coll_scr(2,"",global.bed_coll[2],global.bed_coll[3],global.bed_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = fabric_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 2; // Box
    w_var = 30;
    l_var = 20;
    h_var = 7;
    // Collisions
    coll_var[0] = global.bed_coll[0];
    coll_var[1] = global.bed_coll[1];
    coll_var[2] = global.bed_coll[2];
    coll_var[3] = global.bed_coll[3];
    // Color
    color_var = 2;
    tone_var = choose(c_white,c_fuchsia,c_dkgray,c_teal,c_red);
    // Pillow
    local.offset = (w_var/2)-3.5;
    local.pillow = instance_create(x-lengthdir_x(local.offset,direction),y-lengthdir_y(local.offset,direction),pillow_obj);
    local.pillow.z = z+h_var;
    local.pillow.direction = direction;
');