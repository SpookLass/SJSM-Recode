/*
Argument 0: Room Variable (same for all rooms)
*/
// Stuff
// Don't go above 38!!!
local.width = 30; 
local.height = 10;
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Test Room Big'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = "+string(16+(round(local.height/2)*32))+";
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = "+string(16+(local.width*32))+";
    global.spawn_arr[1,1] = "+string(16+(round(local.height/2)*32))+";
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
")
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,fog_big_obj);
room_instance_add(argument0,0,0,color_control_dark_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
for (local.i=0; local.i<local.width; local.i+=1;)
{
    for (local.j=0; local.j<local.height; local.j+=1;)
    {
        local.xtmp = 48+(local.i*32);
        local.ytmp = 48+(local.j*32);
        room_instance_add(argument0,local.xtmp,local.ytmp,floor_obj);
    }
}
// Walls
for (local.i=0; local.i<30; local.i+=1;)
{
    local.xtmp = 48+(local.i*32);
    local.ytmp = 32+(local.height*32);
    room_instance_add(argument0,local.xtmp,32,wall_big_hor_obj);
    room_instance_add(argument0,local.xtmp,local.ytmp,wall_big_hor_obj);
}
for (local.i=0; local.i<30; local.i+=1;)
{
    local.xtmp = 32+(local.width*32);
    local.ytmp = 48+(local.i*32);
    room_instance_add(argument0,32,local.ytmp,wall_big_vert_obj);
    room_instance_add(argument0,local.xtmp,local.ytmp,wall_big_vert_obj);
}
// Torches
if local.height >= 3
{
    room_instance_add(argument0,32,(round(local.height/2)*32)-16,torch_west_obj);
    room_instance_add(argument0,32,48+(round(local.height/2)*32),torch_west_obj);
    room_instance_add(argument0,32+(local.width*32),(round(local.height/2)*32)-16,torch_east_obj);
    room_instance_add(argument0,32+(local.width*32),48+(round(local.height/2)*32),torch_east_obj);
    if local.height >= 7
    {
        room_instance_add(argument0,32+(local.width*32),(round(local.height/2)*32)-16,torch_east_obj);
        room_instance_add(argument0,32+(local.width*32),112+(round(local.height/2)*32),torch_east_obj);
    }
}


