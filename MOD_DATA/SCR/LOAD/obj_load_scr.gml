/*
Argument 0: Print
*/
file_to_obj_scr(main_directory_const+"\OBJ\par_obj.gml","par_obj",argument0);
file_to_obj_scr(main_directory_const+"\OBJ\par_3d_obj.gml","par_3d_obj",argument0);
file_to_obj_scr(main_directory_const+"\OBJ\enemy_par_obj.gml","enemy_par_obj",argument0);
file_to_obj_scr(main_directory_const+"\OBJ\light_par_obj.gml","light_par_obj",argument0);
// Get the first file in the parent directory (needed for later)
local.file = file_find_first(main_directory_const+"\OBJ\PAR\*.gml",-1);
file_to_obj_scr(main_directory_const+"\OBJ\PAR\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_obj_scr(main_directory_const+"\OBJ\PAR\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\*.gml",-1);
file_to_obj_scr(main_directory_const+"\OBJ\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();
// Sub-directories
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\FOG\*.gml",-1);
file_to_obj_scr(main_directory_const+"\OBJ\MAIN\FOG\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\FOG\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();
local.file = file_find_first(main_directory_const+"\OBJ\MAIN\COLOR\*.gml",-1);
file_to_obj_scr(main_directory_const+"\OBJ\MAIN\COLOR\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_obj_scr(main_directory_const+"\OBJ\MAIN\COLOR\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();
// Get the first file in the child directory
local.file = file_find_first(main_directory_const+"\OBJ\CHILD\*.gml",-1);
file_to_obj_scr(main_directory_const+"\OBJ\CHILD\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_obj_scr(main_directory_const+"\OBJ\CHILD\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();