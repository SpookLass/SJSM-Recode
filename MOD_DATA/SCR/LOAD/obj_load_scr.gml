/*
Argument 0: Print
*/
file_to_obj_scr(main_directory_const+"\OBJ\par_obj.gml","par_obj",argument0);
file_to_obj_scr(main_directory_const+"\OBJ\par_3d_obj.gml","par_3d_obj",argument0);
file_to_obj_scr(main_directory_const+"\OBJ\enemy_par_obj.gml","enemy_par_obj",argument0);
file_to_obj_scr(main_directory_const+"\OBJ\light_par_obj.gml","light_par_obj",argument0);
// Get the first file in the parent directory (needed for later)
local.file = file_find_first(main_directory_const+"\OBJ\PAR\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\PAR\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
// Sub-directories
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\FOG\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\FOG\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\COLOR\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\COLOR\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\EFF\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\EFF\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
// Get the first file in the child directory
local.file = file_find_first(main_directory_const+"\OBJ\CHILD\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\CHILD\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
local.file = file_find_first(main_directory_const+"\OBJ\CHILD\COLOR\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\CHILD\COLOR\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
local.file = file_find_first(main_directory_const+"\OBJ\CHILD\MON\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\CHILD\MON\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
// Mods (oh god what a mess)
for (local.i=0; local.i<ds_list_size(global.mod_list); local.i+=1;)
{
    local.dir = ds_list_find_valuee(global.mod_list,local.i);
    // Parent
    local.file = file_find_first(local.dir+"\OBJ\PAR\*.gml",-1);
    while (local.file != "")
    {
        file_to_obj_scr(local.dir+"\OBJ\PAR\"+local.file,filename_change_ext(local.file,""),argument0);
        local.file = file_find_next();
    }
    file_find_close();
    // Main
    local.file = file_find_first(local.dir+"\OBJ\MAIN\*.gml",-1);
    while (local.file != "")
    {
        file_to_obj_scr(local.dir+"\OBJ\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
        local.file = file_find_next();
    }
    // Child
    local.file = file_find_first(local.dir+"\OBJ\CHILD\*.gml",-1);
    while (local.file != "")
    {
        file_to_obj_scr(local.dir+"\OBJ\CHILD\"+local.file,filename_change_ext(local.file,""),argument0);
        local.file = file_find_next();
    }
}