/*
Argument 0: Print
*/
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\MDL\MAIN\*.gmmod",-1);
// Not sure why, but it doesn't include the path.
file_to_mdl_scr(main_directory_const+"\MDL\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    file_to_mdl_scr(main_directory_const+"\MDL\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();