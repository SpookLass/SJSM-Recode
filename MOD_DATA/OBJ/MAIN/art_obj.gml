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
    store_tex_var = choose
    (
        art_01_bg_tex,
        art_02_bg_tex,
        art_03_bg_tex,
        art_04_bg_tex,
        art_05_bg_tex,
        art_06_bg_tex,
        art_07_bg_tex,
        art_08_bg_tex,
        art_09_bg_tex,
        art_10_bg_tex,
        art_11_bg_tex,
        art_12_bg_tex,
        art_13_bg_tex,
        art_14_bg_tex,
        art_15_bg_tex
    );
    event_inherited();
    solid_var = false;
    type_var = 6; // Double Plane
    w_var = 16.6;
    h_var = 9.2;
    z = 15.4;
    dist_var = 0.3;
');