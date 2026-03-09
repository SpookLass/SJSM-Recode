/*
Argument 0: Time
Argument 1: Rate (1000 for milliseconds, 60 for frames, 1 for seconds)
*/
local.seconds = argument0/argument1;
local.minutes = floor(local.seconds/60);
local.hours = floor(local.minutes/60);
local.days = floor(local.hours/24);
local.seconds = local.seconds mod 60;
local.minutes = string(local.minutes mod 60);
local.hours = string(local.hours mod 24);
if string_length(string(floor(local.seconds))) <= 1 { local.seconds = "0"+string(local.seconds); }
if string_length(local.minutes) <= 1 { local.minutes = "0"+local.minutes; }
if string_length(local.hours) <= 1 { local.hours = "0"+local.hours; }
if local.days > 0 { local.days = string(local.days)+":"; } else { local.days = ""; }
return local.days+local.hours+":"+local.minutes+":"+string(local.seconds);