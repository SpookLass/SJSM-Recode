/*
Argument 0: String
Returns a string with no invalid file characters.
*/
local.str = string(argument0);
local.str = string_replace_all(local.str,"<","_");
local.str = string_replace_all(local.str,">","_");
local.str = string_replace_all(local.str,":","_");
local.str = string_replace_all(local.str,'"',"_");
local.str = string_replace_all(local.str,"/","_");
local.str = string_replace_all(local.str,"\","_");
local.str = string_replace_all(local.str,"|","_");
local.str = string_replace_all(local.str,"?","_");
local.str = string_replace_all(local.str,"*","_");
return local.str;