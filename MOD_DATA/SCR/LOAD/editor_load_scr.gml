// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\SPR\EDITOR\*.png",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_spr_scr(main_directory_const+"\SPR\EDITOR\"+local.file,filename_change_ext(local.file,""),1,false,false,0,0,argument0);
    local.file = file_find_next();
}
file_find_close();
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\OBJ\EDITOR\*.gml",-1);
while (local.file != "")
{
    file_to_obj_scr(main_directory_const+"\OBJ\EDITOR\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
// Initialize
instance_create(0,0,editor_control_obj);