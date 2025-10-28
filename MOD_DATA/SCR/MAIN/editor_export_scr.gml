local.str = "
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"+'"'+"
    // Name
    global.rm_name_var = '"+name_var+"'
    // Spawns
    global.spawn_len_var = "+string(instance_number(spawn_editor_obj))+";";
with spawn_editor_obj
{
    local.str += "
    global.spawn_arr["+string(sub_type_var)+",0] = "+string(x)+";
    global.spawn_arr["+string(sub_type_var)+",1] = "+string(y)+";
    global.spawn_arr["+string(sub_type_var)+",2] = "+string(z)+";
    global.spawn_arr["+string(sub_type_var)+",3] = "+string(image_angle)+";";
}
local.str += "
    // Marks (Slime spawners)
    global.mark_len_var = "+string(instance_number(mark_editor_obj))+";";
with mark_editor_obj
{
    local.str += "
    global.mark_arr["+string(sub_type_var)+",0] = "+string(x)+";
    global.mark_arr["+string(sub_type_var)+",1] = "+string(y)+";
    global.mark_arr["+string(sub_type_var)+",2] = "+string(z)+";";
}
local.str += "
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
"+'"'+");
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,"+fog_var+");
room_instance_add(argument0,0,0,"+color_var+");
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors";
with floor_editor_obj
{
    for (local.i=0; local.i<w_var; local.i+=1;)
    {
        for (local.j=0; local.j<h_var; local.j+=1;)
        {
            local.str += "
room_instance_add(argument0,"+string(x+16+(local.i*32))+","+string(y+16+(local.j*32))+","+other.type_arr[type_var,(sub_type_var*2)+4]+");";
        }
    }
}
local.str += "
// Ceilings";
with ceil_editor_obj
{
    for (local.i=0; local.i<w_var; local.i+=1;)
    {
        for (local.j=0; local.j<h_var; local.j+=1;)
        {
            local.str += "
room_instance_add(argument0,"+string(x+16+(local.i*32))+","+string(y+16+(local.j*32))+","+other.type_arr[type_var,(sub_type_var*2)+4]+");";
        }
    }
}
local.str += "
// Walls (Horizontal)";
with wall_hor_editor_obj
{
    for (local.i=0; local.i<w_var; local.i+=1;)
    { local.str += "
room_instance_add(argument0,"+string(x+16+(local.i*32))+","+string(y)+","+other.type_arr[type_var,(sub_type_var*2)+4]+");";}
}
local.str += "
// Walls (Vertical)";
with wall_vert_editor_obj
{
    for (local.i=0; local.i<h_var; local.i+=1;)
    { local.str += "
room_instance_add(argument0,"+string(x)+","+string(y+16+(local.i*32))+","+other.type_arr[type_var,(sub_type_var*2)+4]+");";}
}
local.str += "
// Props";
with prop_editor_obj
{
    local.str += "
room_instance_add(argument0,"+string(x)+","+string(y)+","+other.type_arr[type_var,(sub_type_var*2)+4]+");";
}
local.file = file_text_open_write(working_directory+"\MODS\"+file_name_var+".gml");
file_text_write_string(local.file,local.str);
file_text_close(local.file);