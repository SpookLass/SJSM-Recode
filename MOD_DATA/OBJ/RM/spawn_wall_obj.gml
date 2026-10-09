/*
Argument 2: Load Parent
Argument 3: Texture (Index or name)
Argument 4: Horizontal and Vertical
Argument 5: Width
Argument 6: Height
Argument 7: Z
Argument 8: Texture Width
Argument 9: Texture Height
Argument 10: Mask
Argument 11: No Grid
Argument 12: Depth
Argument 13: Alpha
Argument 14: Color
*/
// Builtin Variables
object_set_depth(argument0,argument12);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
local.create = '
    par_var = '+string(argument2)+'
    local.bg = ';
// Texture
if is_string(argument3) { local.create += 'par_var.'+argument3+';'; }
else { local.create += string(argument2.bg_arr_var[argument3,0])+';'; }
local.create += '
    store_tex_var = background_get_texture(local.bg);
    event_inherited();
    grid_var = '+string(!argument11)+'
    tex_h_var = (background_get_width(local.bg)/background_get_height(local.bg))';
// Texture Height
if argument9 != 0
{ local.create += '*'+string(argument9); }
// Width
if argument5 != 0
{
    local.create += '
    w_var = '+string(argument5)+';';
}
// Height
if argument6 != 0
{
    local.create += '
    h_var = '+string(argument6)+';';
}
// Z
if argument7 != 0
{
    local.create += '
    z = '+string(argument7)+';';
}
// Texture width
if argument8 != 0
{
    local.create += '
    tex_w_var = '+string(argument8)+';';
}
// Mask
if argument10 > 0
{
    local.create += '
    mask_var = '+string(argument10-1)+';';
}
// Alpha
if argument13 != 0
{
    local.create += '
    image_alpha = '+string(argument13)+';';
}
// Color
if argument14 != 0
{
    local.create += '
    image_blend = '+string(argument14)+';';
}
// Create event
object_event_add
(argument0,ev_create,0,local.create);
// Horizontal and vertical
if argument4
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