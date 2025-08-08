/*
Argument 0: Print
*/
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\RM\MAIN\*.gml",-1);
file_to_rm_scr(main_directory_const+"\RM\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_rm_scr(main_directory_const+"\RM\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();