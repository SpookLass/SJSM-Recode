// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    par_var = '+string(argument2)+'
    store_tex_var = '+string(argument2.surf_arr_var[argument3,4])+'
    tex_h_var = '+string(argument2.surf_arr_var[argument3,2]/argument2.surf_arr_var[argument3,3])+'
    event_inherited();
');
// Directions
if argument4
{
    local.obj = argument0;
    if string_pos("obj",argument1) >= 0
    {
        local.northname = string_replace(argument1,"obj","north_obj");
        local.eastname = string_replace(argument1,"obj","east_obj");
        local.southname = string_replace(argument1,"obj","south_obj");
        local.westname = string_replace(argument1,"obj","west_obj");
    }
    else
    {
        local.northname = argument1+"_north";
        local.eastname = argument1+"_east";
        local.southname = argument1+"_south";
        local.westname = argument1+"_west";
    }
    with argument2
    {
        obj_arr_var[obj_len_var,1] = spawn_north_obj_path;
        obj_arr_var[obj_len_var,2] = local.northname;
        obj_arr_var[obj_len_var,3] = 1;
        obj_arr_var[obj_len_var,4] = local.obj;
        obj_arr_var[obj_len_var+1,1] = spawn_vert_obj_path;
        obj_arr_var[obj_len_var+1,2] = local.eastname;
        obj_arr_var[obj_len_var+1,3] = 1;
        obj_arr_var[obj_len_var+1,4] = local.obj;
        obj_arr_var[obj_len_var+2,1] = spawn_hor_obj_path;
        obj_arr_var[obj_len_var+2,2] = local.southname;
        obj_arr_var[obj_len_var+2,3] = 1;
        obj_arr_var[obj_len_var+2,4] = local.obj;
        obj_arr_var[obj_len_var+3,1] = spawn_west_obj_path;
        obj_arr_var[obj_len_var+3,2] = local.westname;
        obj_arr_var[obj_len_var+3,3] = 1;
        obj_arr_var[obj_len_var+3,4] = local.obj;
        obj_len_var += 4;
    }
}