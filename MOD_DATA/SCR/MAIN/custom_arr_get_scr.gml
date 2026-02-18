/*
Argument 0: Setting
Argument 1: Difficulty
Argument 2: Mode
Argument 3: Behavior
*/
local.difficulty = argument1+1;
local.mode = argument2+1;
local.behavior = argument3+1;
local.value = arr_get_scr("custom_default",argument0,local.difficulty,local.mode,local.behavior); // All 3
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,0,local.mode,local.behavior); // Mode and Behavior
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,local.difficulty,0,local.behavior); // Difficulty and Behavior
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,local.difficulty,local.mode,0); // Difficulty and Mode
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,0,0,local.behavior); // Behavior
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,0,local.mode,0); // Mode
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,local.difficulty,0,0); // Difficulty
if local.value != noone { return local.value; }
local.value = arr_get_scr("custom_default",argument0,0,0,0); // Default
return local.value;