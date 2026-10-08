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
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    mdl_var = '+string(argument2.mdl_arr_var[argument4,0])+'
    mdl_path_var = '+string(argument2.mdl_arr_var[argument4,1])+'
    event_inherited();
    solid_var = false;
    // For grid
    w_var = '+string(argument6)+'
    l_var = '+string(argument7)+'
    h_var = '+string(argument8)+'
    z = '+string(argument9)+'
');
// Loop across the world
if argument10
{
    // Draw event
    object_event_add
    (argument0,ev_draw,0,'
        for (local.i=-10; local.i<10; local.i+=1;)
        {
            z = local.i*32;
            event_inherited();
        }
        z = -320;
    ');
}
// Horizontal and vertical
if argument5
{
    local.obj = argument0;
    if string_pos("obj",argument1) >= 0
    {
        local.horname = string_replace(argument1,"obj","hor_obj");
        local.vertname = string_replace(argument1,"obj","vert_obj");
    }
    else
    {
        local.horname = argument1+"_hor";
        local.vertname = argument1+"_vert";
    }
    with argument2
    {
        obj_arr_var[obj_len_var,1] = spawn_hor_obj_path;
        obj_arr_var[obj_len_var,2] = local.horname;
        obj_arr_var[obj_len_var,3] = 1;
        obj_arr_var[obj_len_var,4] = local.obj;
        obj_arr_var[obj_len_var+1,1] = spawn_vert_obj_path;
        obj_arr_var[obj_len_var+1,2] = local.vertname;
        obj_arr_var[obj_len_var+1,3] = 1;
        obj_arr_var[obj_len_var+1,4] = local.obj;
        obj_len_var += 2;
    }
}