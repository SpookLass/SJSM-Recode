/*
Argument 2: Load Parent
Argument 3: Texture (Index or name)
Argument 4: Width
Argument 5: Height
Argument 6: Z
Argument 7: Texture Width
Argument 8: Texture Height
Argument 9: Mask
Argument 10: Depth-1
Argument 11: Alpha
Argument 12: Color
*/
// Builtin Variables
object_set_depth(argument0,argument10);
object_set_mask(argument0,noone);
object_set_parent(argument0,ceil_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
local.create = '
    par_var = '+string(argument2)+'
    store_tex_var = ';
// Texture
if is_string(argument3) { local.create += 'par_var.'+argument3+';'; }
else { local.create += string(argument2.bg_arr_var[argument3,4])+';'; }
local.create += '
    event_inherited();';
// Width
if argument4 != 0
{
    local.create += '
    w_var = '+string(argument4)+';';
}
// Height
if argument5 != 0
{
    local.create += '
    h_var = '+string(argument5)+';';
}
// Z
if argument6 != 0
{
    local.create += '
    z = '+string(argument6)+';';
}
// Texture width
if argument7 != 0
{
    local.create += '
    tex_w_var = '+string(argument7)+';';
}
// Texture Height
if argument8 != 0
{
    local.create += '
    tex_h_var = '+string(argument8)+';';
}
// Mask
if argument9 != 0
{
    local.create += '
    mask_var = '+string(argument9)+';';
}
// Alpha
if argument11 != 0
{
    local.create += '
    image_alpha = '+string(argument11)+';';
}
// Color
if argument12 != 0
{
    local.create += '
    image_blend = '+string(argument12)+';';
}
// Create event
object_event_add
(argument0,ev_create,0,local.create);