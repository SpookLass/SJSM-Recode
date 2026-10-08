/*
Argument 2: Load parent
Argument 3: Sprite Array Index
Argument 4: Sprite Index
Argument 5: Width
Argument 6: Height
Argument 7: Distance
Argument 8: Z
Argument 9: Direction
*/
// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    par_var = '+string(argument2)+'
    store_tex_var = '+string(sprite_get_texture(argument2.spr_arr_var[argument3,0],argument4))+'
    event_inherited();
    type_var = 10; // Single Plane
    w_var = '+string(argument5)+'
    h_var = '+string(argument6)+'
    dist_var = '+string(argument7)+'
    z = '+string(argument8)+'
    direction = '+string(argument9)+'
');
/*
Clock (temp)
w_var = 8;
h_var = 8;
dist_var = 0.2;
z = 30;
direction = 180;
*/