/*
Argument 0: Value
Argument 1: Modulate
*/
local.value = argument0 mod argument1;
if local.value < 0 { local.value += argument1; }
return local.value;