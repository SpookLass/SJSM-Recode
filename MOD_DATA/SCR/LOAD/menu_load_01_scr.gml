/*
--------------------
Customize menu stuff

This massive array can be confusing, but is very versatile.
Number and string types will simply display their value, while enums display an array of labels.
Names, descriptions, and labels can all be translated, but you can also change them manually.abs

Type
    0 - Enum
    1 - Number
    2 - Clamped Number
    3 - Max Clamped Number
    4 - Min Clamped Number
    5 - String
    6 - Type
        Functionally identical to an enum, but is initialized entirely differently

Default
    Uses specific functions
    Dimensions
        0 - Setting
        1 - Difficulty
        2 - Mode
        3 - Behavior
    Default is -1

--------------------
*/
draw_load_scr("Loading config...");
// Difficulties
    globalvar diff_arr;
    global.diff_len_var = 6;
    global.diff_default_var = 2;
    diff_arr[0,0] = "easiest"; // Name
    diff_arr[0,1] = "easiest"; // Description
    diff_arr[0,2] = true; // Translate
    diff_arr[0,3] = false; // Custom Only
    diff_arr[0,4] = global.diff_default_var;
    diff_arr[1,0] = "easy";
    diff_arr[1,1] = "easy";
    diff_arr[1,2] = true;
    diff_arr[1,3] = false;
    diff_arr[1,4] = global.diff_default_var;
    diff_arr[2,0] = "normal";
    diff_arr[2,1] = "normal";
    diff_arr[2,2] = true;
    diff_arr[2,3] = false;
    diff_arr[2,4] = global.diff_default_var;
    diff_arr[3,0] = "hard";
    diff_arr[3,1] = "hard";
    diff_arr[3,2] = true;
    diff_arr[3,3] = false;
    diff_arr[3,4] = global.diff_default_var;
    diff_arr[4,0] = "hardest";
    diff_arr[4,1] = "hardest";
    diff_arr[4,2] = true;
    diff_arr[4,3] = false;
    diff_arr[4,4] = global.diff_default_var;
    diff_arr[5,0] = "evil";
    diff_arr[5,1] = "evil";
    diff_arr[5,2] = true;
    diff_arr[5,3] = true;
    diff_arr[5,4] = 4;
// Modes
    globalvar mode_arr;
    global.mode_len_var = 3;
    global.mode_default_var = 1;
    mode_arr[0,0] = "story"; // Name
    mode_arr[0,1] = "story"; // Description
    mode_arr[0,2] = true; // Translate
    mode_arr[0,3] = true; // Custom Only
    mode_arr[0,4] = global.mode_default_var; // Defaults to
    mode_arr[1,0] = "endless";
    mode_arr[1,1] = "endless";
    mode_arr[1,2] = true;
    mode_arr[1,3] = false;
    mode_arr[1,4] = global.mode_default_var;
    mode_arr[2,0] = "sandbox";
    mode_arr[2,1] = "sandbox";
    mode_arr[2,2] = true;
    mode_arr[2,3] = true;
    mode_arr[2,4] = 1;
// Behavior
    globalvar type_arr;
    global.type_len_var = 3;
    global.type_default_var = 0;
    type_arr[0,0] = "recode"; // Name
    type_arr[0,1] = "recode"; // Description
    type_arr[0,2] = true; // Translate
    type_arr[0,3] = false; // Custom Only
    type_arr[0,4] = global.type_default_var; // Defaults to
    type_arr[1,0] = "og";
    type_arr[1,1] = "og";
    type_arr[1,2] = true;
    type_arr[1,3] = false;
    type_arr[1,4] = global.type_default_var;
    type_arr[2,0] = "hd";
    type_arr[2,1] = "hd";
    type_arr[2,2] = true;
    type_arr[2,3] = false;
    type_arr[2,4] = global.type_default_var;
// Monster Groups
    globalvar mon_group_arr;
    global.mon_group_len_var = 6;
    mon_group_arr[0,0] = "none"; // Name
    mon_group_arr[0,1] = true; // Translate
    mon_group_arr[1,0] = "spec";
    mon_group_arr[1,1] = true;
    mon_group_arr[2,0] = "mon";
    mon_group_arr[2,1] = true;
    mon_group_arr[3,0] = "doll";
    mon_group_arr[3,1] = true;
    mon_group_arr[4,0] = "endless";
    mon_group_arr[4,1] = true;
    mon_group_arr[5,0] = "unknown";
    mon_group_arr[5,1] = true;
// Setup
    globalvar custom_arr
    globalvar custom_name_arr;
    globalvar custom_label_arr;
    globalvar custom_desc_arr;
    globalvar custom_state_arr;
    globalvar mon_arr;
    global.custom_len_var = 0;
    global.custom_state_len_var = 0;
    global.diff_len_var = 6;
    global.mode_len_var = 3;
    global.behavior_len_var = 3;
    global.mon_len_var = 0;
// Default array
    arr_create_scr("custom_default",4,0,global.diff_len_var+1,global.mode_len_var+1,global.behavior_len_var+1);
// Categories
    local.main = custom_add_state_scr("custom",true,-1);
    local.toggle = custom_add_state_scr("toggle",true,local.main);
    local.chase = custom_add_state_scr("chase",true,local.main);
    local.rm = custom_add_state_scr("rm",true,local.main);
    local.type = custom_add_state_scr("type",true,local.main);
    local.spec = custom_add_state_scr("spec",true,local.type);
    local.mon = custom_add_state_scr("mon",true,local.type);
    local.doll = custom_add_state_scr("doll",true,local.type);
    local.endless = custom_add_state_scr("endless",true,local.type);
    local.unknown = custom_add_state_scr("unknown",true,local.type);
// Main
    // Toggle
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.toggle,"toggle","toggle",true,custom_state_const,-1,-1,false,local.main,false);
        custom_arr_add_len_scr(0,1);
    // Chase
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.chase,"chase","chase",true,custom_state_const,-1,-1,false,local.main,false);
        custom_arr_add_len_scr(0,1);
    // Room
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.rm,"rm","rm",true,custom_state_const,-1,-1,false,local.main,false);
        custom_arr_add_len_scr(0,1);
    // Type
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.type,"type","type",true,custom_state_const,-1,-1,false,local.main,false);
        custom_arr_add_len_scr(0,1);
// Toggles
    // Jump
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.jump = custom_add_scr("jump","jump","jump",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.jump,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.jump,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(true,local.jump,-1,-1,-1); // Default
            custom_arr_set_scr(false,local.jump,-1,-1,1); // OG
            custom_arr_set_scr(false,local.jump,-1,-1,2); // HD
    // Crouch
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.crouch = custom_add_scr("crouch","crouch","crouch",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.crouch,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.crouch,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(true,local.crouch,-1,-1,-1); // Default
            custom_arr_set_scr(false,local.crouch,-1,-1,1); // OG
            custom_arr_set_scr(false,local.crouch,-1,-1,2); // HD
    // Stamina Persist
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.stam_per = custom_add_scr("stam_per","stam_per","stam_per",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.stam_per,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.stam_per,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(false,local.stam_per,-1,-1,-1); // Default
            custom_arr_set_scr(true,local.stam_per,3,-1,-1); // Hard
            custom_arr_set_scr(true,local.stam_per,4,-1,-1); // Hardest
            custom_arr_set_scr(true,local.stam_per,5,-1,-1); // :)
            custom_arr_set_scr(false,local.stam_per,-1,-1,1); // OG
            custom_arr_set_scr(false,local.stam_per,-1,-1,2); // HD
    // Fall
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.fall = custom_add_scr("fall","fall","fall",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.fall,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.fall,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(false,local.fall,-1,-1,-1); // Default
            custom_arr_set_scr(true,local.fall,5,-1,-1); // :)
            custom_arr_set_scr(false,local.fall,-1,-1,1); // OG
            custom_arr_set_scr(false,local.fall,-1,-1,2); // HD
    // Lock
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.lock = custom_add_scr("lock","lock","lock",true,custom_enum_const,0,3,true,local.toggle,true);
            custom_add_label_scr(local.lock,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.lock,1,"alone",true,"");
            custom_add_label_scr(local.lock,2,"on",true,"");
            custom_add_label_scr(local.lock,3,"evil",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(2,local.lock,-1,-1,-1); // Default (Gold)
            custom_arr_set_scr(0,local.lock,0,-1,-1); // Easiest (Never)
            custom_arr_set_scr(1,local.lock,1,-1,-1); // Easy (Alone)
            custom_arr_set_scr(3,local.lock,5,-1,-1); // :) (Evil)
            custom_arr_set_scr(3,local.lock,-1,-1,1); // OG (Evil)
            custom_arr_set_scr(3,local.lock,-1,-1,2); // HD (Evil)
    // Damage Shake
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.dmg_shake = custom_add_scr("dmg_shake","dmg_shake","dmg_shake",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.dmg_shake,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.dmg_shake,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(false,local.dmg_shake,-1,-1,-1); // Default
            custom_arr_set_scr(true,local.dmg_shake,4,-1,-1); // Hardest
            custom_arr_set_scr(true,local.dmg_shake,5,-1,-1); // :)
            custom_arr_set_scr(true,local.dmg_shake,-1,-1,1); // OG
            custom_arr_set_scr(false,local.dmg_shake,-1,-1,1); // HD
    // Permadeath
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.permadeath = custom_add_scr("permadeath","permadeath","permadeath",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.permadeath,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.permadeath,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(false,local.permadeath,-1,-1,-1); // Default
            custom_arr_set_scr(true,local.permadeath,5,-1,-1); // :)
            custom_arr_set_scr(true,local.permadeath,-1,1,-1); // Endless
    // Locales
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.locale = custom_add_scr("locale","locale","locale",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.locale,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.locale,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(true,local.locale,-1,-1,-1); // Default
            custom_arr_set_scr(false,local.locale,5,-1,-1); // :)
            custom_arr_set_scr(false,local.locale,-1,1,1); // OG Endless
    // One Shot
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.one_shot = custom_add_scr("one_shot","one_shot","one_shot",true,custom_enum_const,false,true,true,local.toggle,false);
            custom_add_label_scr(local.one_shot,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.one_shot,true,"on",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(false,local.one_shot,-1,-1,-1); // Default
            custom_arr_set_scr(true,local.one_shot,5,-1,-1); // :)
// Chase
    // Monster Chance
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mon_chance = custom_add_scr("mon_chance","mon_chance","mon_chance",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(mon_chance_const,local.mon_chance,-1,-1,-1); // Default
    // Monster Chance Multiplier
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mon_chance_mult = custom_add_scr("mon_chance_mult","mon_chance_mult","mon_chance_mult",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(mon_chance_mult_const,local.mon_chance_mult,-1,-1,-1); // Default
    // Dupe
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.dupe = custom_add_scr("dupe","dupe","dupe",true,custom_enum_const,0,2,true,local.chase,true);
            custom_add_label_scr(local.dupe,dupe_always_const,"always",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.dupe,dupe_canon_const,"canon",true,"");
            custom_add_label_scr(local.dupe,dupe_never_const,"never",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(dupe_canon_const,local.dupe,-1,-1,-1); // Default (Canon)
            custom_arr_set_scr(dupe_never_const,local.dupe,0,-1,-1); // Easiest (Never)
            custom_arr_set_scr(dupe_always_const,local.dupe,4,-1,-1); // Hardest (Always)
            custom_arr_set_scr(dupe_always_const,local.dupe,5,-1,-1); // :) (Always)
            custom_arr_set_scr(dupe_always_const,local.dupe,-1,-1,1); // OG (Always)
            custom_arr_set_scr(dupe_always_const,local.dupe,-1,-1,2); // HD (Always)
    // Multichase Type
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mult_type = custom_add_scr("mult_type","mult_type","mult_type",true,custom_enum_const,0,3,true,local.chase,true);
            custom_add_label_scr(local.mult_type,0,"max",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.mult_type,1,"min",true,"");
            custom_add_label_scr(local.mult_type,2,"taper",true,"");
            custom_add_label_scr(local.mult_type,3,"always",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.mult_type,-1,-1,-1); // Default (Max)
            custom_arr_set_scr(1,local.mult_type,0,-1,-1); // Easiest (Min)
            custom_arr_set_scr(1,local.mult_type,1,-1,-1); // Easy (Min)
            custom_arr_set_scr(3,local.mult_type,4,-1,-1); // Hardest (Always)
            custom_arr_set_scr(3,local.mult_type,5,-1,-1); // :) (Always)
            custom_arr_set_scr(1,local.mult_type,-1,-1,1); // OG (Min)
            custom_arr_set_scr(0,local.mult_type,-1,-1,2); // HD (Max)
    // Multichase Min
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mult_min = custom_add_scr("mult_min","mult_min","mult_min",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(1,local.mult_min,-1,-1,-1); // Default
            custom_arr_set_scr(0,local.mult_min,0,-1,-1); // Easiest
    // Multichase Max
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mult_max = custom_add_scr("mult_max","mult_max","mult_max",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(5,local.mult_max,-1,-1,-1); // Default
    // Multichase Start
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mult_start = custom_add_scr("mult_start","mult_start","mult_start",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.mult_start,-1,-1,-1); // Default
    // Multichase End
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.mult_end = custom_add_scr("mult_end","mult_end","mult_end",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(1000,local.mult_end,-1,-1,-1); // Default
    // Count Type
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.count_type = custom_add_scr("count_type","count_type","count_type",true,custom_enum_const,0,4,true,local.chase,true);
            custom_add_label_scr(local.count_type,0,"rand",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.count_type,1,"max",true,"");
            custom_add_label_scr(local.count_type,2,"min",true,"");
            custom_add_label_scr(local.count_type,3,"taper",true,"");
            custom_add_label_scr(local.count_type,4,"taper_rand",true,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.count_type,-1,-1,-1); // Default (Random)
            custom_arr_set_scr(1,local.count_type,0,-1,-1); // Easiest (Max)
            custom_arr_set_scr(1,local.count_type,1,-1,-1); // Easy (Max)
            custom_arr_set_scr(2,local.count_type,3,-1,-1); // Hard (Min)
            custom_arr_set_scr(2,local.count_type,4,-1,-1); // Hardest (Min)
            custom_arr_set_scr(2,local.count_type,5,-1,-1); // :) (Min)
            custom_arr_set_scr(1,local.count_type,-1,-1,1); // OG (Max)
            custom_arr_set_scr(2,local.count_type,-1,-1,2); // HD (Min)
    // Count Min
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.count_min = custom_add_scr("count_min","count_min","count_min",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.count_min,-1,-1,-1); // Default
    // Count Max
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.count_max = custom_add_scr("count_max","count_max","count_max",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(20,local.count_max,-1,-1,-1); // Default
    // Count Start
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.count_start = custom_add_scr("count_start","count_start","count_start",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.count_start,-1,-1,-1); // Default
    // Count End
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.count_end = custom_add_scr("count_end","count_end","count_end",true,custom_min_clamp_num_const,0,-1,false,local.chase,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(1000,local.count_end,-1,-1,-1); // Default
// Rooms
    // Jumpscare Chance
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.js_chance = custom_add_scr("js_chance","js_chance","js_chance",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(js_chance_const,local.js_chance,-1,-1,-1); // Default
    // Rare Chance
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.rare_chance = custom_add_scr("rare_chance","rare_chance","rare_chance",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(16,local.rare_chance,-1,-1,-1); // Default
            custom_arr_set_scr(rare_chance_const,local.rare_chance,-1,0,-1); // Story Mode
            custom_arr_set_scr(0,local.rare_chance,-1,-1,1); // OG
            custom_arr_set_scr(rare_chance_const,local.rare_chance,-1,-1,2); // HD
    // Elevator Type
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.ele_type = custom_add_scr("ele_type","ele_type","ele_type",true,custom_enum_const,0,2,true,local.rm,true);
            custom_add_label_scr(local.ele_type,0,"1",false,""); /*Setting ID, Label ID, Label, Translate, Description*/
            custom_add_label_scr(local.ele_type,1,"2",false,"");
            custom_add_label_scr(local.ele_type,2,"3",false,"");
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(ele_type_const,local.ele_type,-1,-1,-1); // Default
            custom_arr_set_scr(2,local.ele_type,-1,-1,1); // OG
            custom_arr_set_scr(1,local.ele_type,-1,0,2); // HD Story
            custom_arr_set_scr(0,local.ele_type,-1,1,2); // HD Endless
    // Elevator End 1
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.ele_end_01 = custom_add_scr("ele_end_01","ele_end_01","ele_end_01",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(ele_end_01_const,local.ele_end_01,-1,-1,-1); // Default
    // Elevator End 2
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.ele_end_02 = custom_add_scr("ele_end_02","ele_end_02","ele_end_02",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(ele_end_02_const,local.ele_end_02,-1,-1,-1); // Default
    // Elevator Rate 1
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.ele_rate_01 = custom_add_scr("ele_rate_01","ele_rate_01","ele_rate_01",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(ele_rate_01_const,local.ele_rate_01,-1,-1,-1); // Default
            custom_arr_set_scr(100,local.ele_rate_01,-1,1,2); // HD Endless
    // Elevator Rate 2
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.ele_rate_02 = custom_add_scr("ele_rate_02","ele_rate_02","ele_rate_02",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(ele_rate_02_const,local.ele_rate_02,-1,-1,-1); // Default
    // Elevator Rate 3
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            local.ele_rate_03 = custom_add_scr("ele_rate_03","ele_rate_03","ele_rate_03",true,custom_min_clamp_num_const,0,-1,false,local.rm,false);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(ele_rate_03_const,local.ele_rate_03,-1,-1,-1); // Default
// Behaviors
    // Player
        local.player = type_add_scr("player",true,false,0,player_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
        local.player_set = type_add_set_scr(local.player,"player","player",local.type,false); /*ID, Variable Name, Description, Category, Can Disable*/
        // Types
            type_add_type_scr(local.player,local.player_set,"recode","",true); /*ID, Label, Description, Translate*/
            type_add_type_scr(local.player,local.player_set,"og","",true);
            type_add_type_scr(local.player,local.player_set,"hd","",true);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.player_set,-1,-1,-1); // Default (Recode)
            custom_arr_set_scr(1,local.player_set,-1,-1,1); // OG
            custom_arr_set_scr(2,local.player_set,-1,-1,2); // HD
            custom_arr_set_scr(-1,local.player_set,5,-1,-1); // :) (Random)
    // Axe
        local.axe = type_add_scr("axe",true,false,0,axe_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
        local.axe_set = type_add_set_scr(local.axe,"axe","axe",local.type,false); /*ID, Variable Name, Description, Category, Can Disable*/
        // Types
            type_add_type_scr(local.axe,local.axe_set,"recode","",true); /*ID, Label, Description, Translate*/
            type_add_type_scr(local.axe,local.axe_set,"og","",true);
            type_add_type_scr(local.axe,local.axe_set,"hd","",true);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.axe_set,-1,-1,-1); // Default (Recode)
            custom_arr_set_scr(1,local.axe_set,-1,-1,1); // OG
            custom_arr_set_scr(2,local.axe_set,-1,-1,2); // HD
            custom_arr_set_scr(-1,local.axe_set,5,-1,-1); // :) (Random)
    // Howard
        local.howard = type_add_scr("howard",true,false,0,howard_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
        local.howard_set = type_add_set_scr(local.howard,"howard","howard",local.type,false); /*ID, Variable Name, Description, Category, Can Disable*/
        // Types
            type_add_type_scr(local.howard,local.howard_set,"recode","",true); /*ID, Label, Description, Translate*/
            type_add_type_scr(local.howard,local.howard_set,"og","",true);
            type_add_type_scr(local.howard,local.howard_set,"hd","",true);
        // Defaults
            custom_arr_add_len_scr(0,1);
            custom_arr_set_scr(0,local.howard_set,-1,-1,-1); // Default (Recode)
            custom_arr_set_scr(1,local.howard_set,-1,-1,1); // OG
            custom_arr_set_scr(2,local.howard_set,-1,-1,2); // HD
            custom_arr_set_scr(-1,local.howard_set,5,-1,-1); // :) (Random)
    // Story Mode
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.spec,"spec","spec",true,custom_state_const,-1,-1,false,local.type,false);
        custom_arr_add_len_scr(0,1);
    // Karamari
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.mon,"mon","mon",true,custom_state_const,-1,-1,false,local.type,false);
        custom_arr_add_len_scr(0,1);
    // Dollhouse
        if file_exists(working_directory+"\The_Doll_House\SDH.exe")
        {
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
            custom_add_scr(local.doll,"doll","doll",true,custom_state_const,-1,-1,false,local.type,false);
            custom_arr_add_len_scr(0,1);
        }
    // Endless
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.endless,"endless","endless",true,custom_state_const,-1,-1,false,local.type,false);
        custom_arr_add_len_scr(0,1);
    // Unknown
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.unknown,"unknown","unknown",true,custom_state_const,-1,-1,false,local.type,false);
        custom_arr_add_len_scr(0,1);
    // Story Mode
        // Jumpscare
            local.js = type_add_scr("js",true,false,1,js_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.js_set = type_add_set_scr(local.js,"js","js",local.spec,false); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.js,local.js_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.js,local.js_set,"og","",true);
                type_add_type_scr(local.js,local.js_set,"hd","",true);
                type_add_type_scr(local.js,local.js_set,"alt","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.js_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.js_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.js_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.js_set,5,-1,-1); // :) (Random)
        // Gel
            local.gel = type_add_scr("gel",true,true,1,gel_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.gel_set = type_add_set_scr(local.gel,"gel","gel",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.gel,local.gel_set,"recode","",true); /*Type ID, Setting ID, Label, Description, Translate*/
                type_add_type_scr(local.gel,local.gel_set,"og","",true);
                type_add_type_scr(local.gel,local.gel_set,"hd","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.gel_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.gel_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.gel_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.gel_set,5,-1,-1); // :) (Random)
        // Brain
            local.brain = type_add_scr("brain",true,true,1,brain_chase_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.brain_set = type_add_set_scr(local.brain,"brain","brain",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.brain,local.brain_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.brain,local.brain_set,"og","",true);
                type_add_type_scr(local.brain,local.brain_set,"hd","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(-2,local.brain_set,-1,-1,-1); // Default (Off)
                custom_arr_set_scr(-2,local.brain_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(0,local.brain_set,-1,-1,0); // Recode
                custom_arr_set_scr(-1,local.brain_set,5,-1,-1); // :) (Random)
        // Bug
            local.bug = type_add_scr("bug",true,true,1,bug_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.bug_set = type_add_set_scr(local.bug,"bug","bug",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.bug,local.bug_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.bug,local.bug_set,"og","",true);
                type_add_type_scr(local.bug,local.bug_set,"hd","",true);
                type_add_type_scr(local.bug,local.bug_set,"rogue","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.bug_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.bug_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.bug_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.bug_set,5,-1,-1); // :) (Random)
        // Ringu
            local.ringu = type_add_scr("ringu",true,true,1,ringu_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.ringu_set = type_add_set_scr(local.ringu,"ringu","ringu",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.ringu,local.ringu_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.ringu,local.ringu_set,"og","",true);
                type_add_type_scr(local.ringu,local.ringu_set,"hd","",true);
                type_add_type_scr(local.ringu,local.ringu_set,"old","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.ringu_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.ringu_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.ringu_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.ringu_set,5,-1,-1); // :) (Random)
        // Bab
            local.bab = type_add_scr("bab",true,true,1,bab_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.bab_set = type_add_set_scr(local.bab,"bab","bab",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.bab,local.bab_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.bab,local.bab_set,"og","",true);
                type_add_type_scr(local.bab,local.bab_set,"hd","",true);
                type_add_type_scr(local.bab,local.bab_set,"old","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.bab_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.bab_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.bab_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.bab_set,5,-1,-1); // :) (Random)
        // Puppet
            local.pup = type_add_scr("pup",true,true,1,pup_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.pup_set = type_add_set_scr(local.pup,"pup","pup",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.pup,local.pup_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.pup,local.pup_set,"og","",true);
                type_add_type_scr(local.pup,local.pup_set,"hd","",true);
                type_add_type_scr(local.pup,local.pup_set,"old","",true);
                type_add_type_scr(local.pup,local.pup_set,"dh","",true);
                type_add_type_scr(local.pup,local.pup_set,"dh_hd","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.pup_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.pup_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.pup_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.pup_set,5,-1,-1); // :) (Random)
        // Flesh
            local.flesh = type_add_scr("flesh",true,true,1,flesh_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.flesh_set = type_add_set_scr(local.flesh,"flesh","flesh",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.flesh,local.flesh_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.flesh,local.flesh_set,"og","",true);
                type_add_type_scr(local.flesh,local.flesh_set,"hd","",true);
                type_add_type_scr(local.flesh,local.flesh_set,"alt","",true);
                type_add_type_scr(local.flesh,local.flesh_set,"remodeled","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.flesh_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.flesh_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.flesh_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.flesh_set,5,-1,-1); // :) (Random)
        // Deer Lord
            local.dl = type_add_scr("dl",true,true,1,dl_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.dl_set = type_add_set_scr(local.dl,"dl","dl",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.dl,local.dl_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.dl,local.dl_set,"og","",true);
                type_add_type_scr(local.dl,local.dl_set,"hd","",true);
                type_add_type_scr(local.dl,local.dl_set,"old","",true);
                type_add_type_scr(local.dl,local.dl_set,"rogue","",true);
                type_add_type_scr(local.dl,local.dl_set,"remodeled","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.dl_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.dl_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.dl_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.dl_set,5,-1,-1); // :) (Random)
        // Taker
            local.taker = type_add_scr("taker",true,false,1,taker_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.taker_set = type_add_set_scr(local.taker,"taker","taker",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.taker,local.taker_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.taker,local.taker_set,"og","",true);
                type_add_type_scr(local.taker,local.taker_set,"hd","",true);
                type_add_type_scr(local.taker,local.taker_set,"dh","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.taker_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.taker_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.taker_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.taker_set,5,-1,-1); // :) (Random)
        // Eel
            local.eel = type_add_scr("eel",true,true,1,eel_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.eel_set = type_add_set_scr(local.eel,"eel","eel",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.eel,local.eel_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.eel,local.eel_set,"og","",true);
                type_add_type_scr(local.eel,local.eel_set,"hd","",true);
                type_add_type_scr(local.eel,local.eel_set,"remodeled","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(-2,local.eel_set,-1,-1,-1); // Default (Off)
                custom_arr_set_scr(-2,local.eel_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(0,local.eel_set,-1,-1,0); // Recode
                custom_arr_set_scr(-1,local.eel_set,5,-1,-1); // :) (Random)

        // Parasite
            local.para = type_add_scr("para",true,true,1,para_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.para_set = type_add_set_scr(local.para,"para","para",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.para,local.para_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.para,local.para_set,"og","",true);
                type_add_type_scr(local.para,local.para_set,"hd","",true);
                type_add_type_scr(local.para,local.para_set,"old","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.para_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.para_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.para_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.para_set,5,-1,-1); // :) (Random)
        // Food Demon
            local.fd = type_add_scr("fd",true,true,1,fd_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.fd_set = type_add_set_scr(local.fd,"fd","fd",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.fd,local.fd_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.fd,local.fd_set,"og","",true);
                type_add_type_scr(local.fd,local.fd_set,"hd","",true);
                type_add_type_scr(local.fd,local.fd_set,"dh","",true);
                type_add_type_scr(local.fd,local.fd_set,"dh_hd","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.fd_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.fd_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.fd_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.fd_set,5,-1,-1); // :) (Random)
        // Killer
            local.killer = type_add_scr("killer",true,true,1,killer_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.killer_set = type_add_set_scr(local.killer,"killer","killer",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.killer,local.killer_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.killer,local.killer_set,"og","",true);
                type_add_type_scr(local.killer,local.killer_set,"hd","",true);
                type_add_type_scr(local.killer,local.killer_set,"old","",true);
                type_add_type_scr(local.killer,local.killer_set,"remodeled","",true);
                type_add_type_scr(local.killer,local.killer_set,"rogue","",true);
                type_add_type_scr(local.killer,local.killer_set,"alt_01","",true);
                type_add_type_scr(local.killer,local.killer_set,"alt_02","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.killer_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.killer_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.killer_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.killer_set,5,-1,-1); // :) (Random)
        // Mermaid
            local.mur = type_add_scr("mur",true,true,1,noone,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.mur_set = type_add_set_scr(local.mur,"mur","mur",local.spec,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.mur,local.mur_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.mur,local.mur_set,"og","",true);
                type_add_type_scr(local.mur,local.mur_set,"hd","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.mur_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(1,local.mur_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.mur_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.mur_set,5,-1,-1); // :) (Random)
    // Karamari
        if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
        {
            // Security Guard
                local.sg = type_add_scr("sg",true,true,2,sg_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.sg_set = type_add_set_scr(local.sg,"sg","sg",local.mon,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.sg,local.sg_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.sg,local.sg_set,"og","",true);
                    type_add_type_scr(local.sg,local.sg_set,"hd","",true);
                    type_add_type_scr(local.sg,local.sg_set,"kh","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(-2,local.sg_set,-1,-1,-1); // Default (Off)
                    custom_arr_set_scr(-2,local.sg_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(0,local.sg_set,-1,-1,0); // Recode
                    custom_arr_set_scr(-1,local.sg_set,5,-1,-1); // :) (Random)
            // Bodybag
                local.body = type_add_scr("body",true,true,2,bodybag_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.body_set = type_add_set_scr(local.body,"body","body",local.mon,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.body,local.body_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.body,local.body_set,"og","",true);
                    type_add_type_scr(local.body,local.body_set,"hd","",true);
                    type_add_type_scr(local.body,local.body_set,"kh","",true);
                    type_add_type_scr(local.body,local.body_set,"old","",true);
                    type_add_type_scr(local.body,local.body_set,"alt","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(0,local.body_set,-1,-1,-1); // Default (Recode)
                    custom_arr_set_scr(-2,local.body_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(-2,local.body_set,-1,-1,1); // OG (Off)
                    custom_arr_set_scr(2,local.body_set,-1,-1,2); // HD
                    custom_arr_set_scr(-1,local.body_set,5,-1,-1); // :) (Random)
        }
        // Stem
            local.stem = type_add_scr("stem",true,true,2,stem_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.stem_set = type_add_set_scr(local.stem,"stem","stem",local.mon,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.stem,local.stem_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.stem,local.stem_set,"og","",true);
                type_add_type_scr(local.stem,local.stem_set,"hd","",true);
                type_add_type_scr(local.stem,local.stem_set,"kh","",true);
                type_add_type_scr(local.stem,local.stem_set,"kh_hd","",true);
                type_add_type_scr(local.stem,local.stem_set,"old","",true);
                type_add_type_scr(local.stem,local.stem_set,"alt","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.stem_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.stem_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.stem_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.stem_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.stem_set,5,-1,-1); // :) (Random)
        // Patient
            local.patient = type_add_scr("patient",true,true,2,patient_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.patient_set = type_add_set_scr(local.patient,"patient","patient",local.mon,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.patient,local.patient_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.patient,local.patient_set,"og","",true);
                type_add_type_scr(local.patient,local.patient_set,"hd","",true);
                type_add_type_scr(local.patient,local.patient_set,"kh_hd","",true);
                type_add_type_scr(local.patient,local.patient_set,"alt","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.patient_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.patient_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.patient_set,-1,-1,2); // OG
                custom_arr_set_scr(2,local.patient_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.patient_set,5,-1,-1); // :) (Random)
        // Ghost Cow
            local.gc = type_add_scr("gc",true,true,2,gc_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.gc_set = type_add_set_scr(local.gc,"gc","gc",local.mon,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.gc,local.gc_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.gc,local.gc_set,"og","",true);
                type_add_type_scr(local.gc,local.gc_set,"hd","",true);
                type_add_type_scr(local.gc,local.gc_set,"kh","",true);
                type_add_type_scr(local.gc,local.gc_set,"kh_hd","",true);
                type_add_type_scr(local.gc,local.gc_set,"alt","",true);
                type_add_type_scr(local.gc,local.gc_set,"kh_recode","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.gc_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.gc_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.gc_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.gc_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.gc_set,5,-1,-1); // :) (Random)
        // Bekka
            local.bekka = type_add_scr("bekka",true,true,2,bekka_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.bekka_set = type_add_set_scr(local.bekka,"bekka","bekka",local.mon,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.bekka,local.bekka_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.bekka,local.bekka_set,"og","",true);
                type_add_type_scr(local.bekka,local.bekka_set,"hd","",true);
                type_add_type_scr(local.bekka,local.bekka_set,"remodeled","",true);
                type_add_type_scr(local.bekka,local.bekka_set,"rogue","",true);
                type_add_type_scr(local.bekka,local.bekka_set,"alt","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.bekka_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.bekka_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.bekka_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.bekka_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.bekka_set,5,-1,-1); // :) (Random)
    // Dollhouse
        if file_exists(working_directory+"\The_Doll_House\SDH.exe")
        {
            // Husk Swarm
                local.husk = type_add_scr("husk_swarm",true,true,3,husk_swarm_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.husk_set = type_add_set_scr(local.husk,"husk","husk",local.doll,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.husk,local.husk_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.husk,local.husk_set,"og","",true);
                    type_add_type_scr(local.husk,local.husk_set,"hd","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(0,local.husk_set,-1,-1,-1); // Default (Recode)
                    custom_arr_set_scr(-2,local.husk_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(-2,local.husk_set,-1,-1,1); // OG (Off)
                    custom_arr_set_scr(2,local.husk_set,-1,-1,2); // HD
                    custom_arr_set_scr(-1,local.husk_set,5,-1,-1); // :) (Random)
            // Woormy Charles
                local.wc = type_add_scr("wc",true,true,3,wc_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.wc_set = type_add_set_scr(local.wc,"wc","wc",local.doll,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.wc,local.wc_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.wc,local.wc_set,"og","",true);
                    type_add_type_scr(local.wc,local.wc_set,"hd","",true);
                    type_add_type_scr(local.wc,local.wc_set,"remodeled","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(0,local.wc_set,-1,-1,-1); // Default (Recode)
                    custom_arr_set_scr(-2,local.wc_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(-2,local.wc_set,-1,-1,1); // OG (Off)
                    custom_arr_set_scr(2,local.wc_set,-1,-1,2); // HD
                    custom_arr_set_scr(-1,local.wc_set,5,-1,-1); // :) (Random)
            // Clown
                local.clown = type_add_scr("clown",true,true,3,clown_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.clown_set = type_add_set_scr(local.clown,"clown","clown",local.doll,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.clown,local.clown_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.clown,local.clown_set,"og","",true);
                    type_add_type_scr(local.clown,local.clown_set,"hd","",true);
                    type_add_type_scr(local.clown,local.clown_set,"alt","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(0,local.clown_set,-1,-1,-1); // Default (Recode)
                    custom_arr_set_scr(-2,local.clown_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(-2,local.clown_set,-1,-1,1); // OG (Off)
                    custom_arr_set_scr(2,local.clown_set,-1,-1,2); // HD
                    custom_arr_set_scr(-1,local.clown_set,5,-1,-1); // :) (Random)
            // Hooked Doll
                local.hk = type_add_scr("hk",true,true,3,hk_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.hk_set = type_add_set_scr(local.hk,"hk","hk",local.doll,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.hk,local.hk_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.hk,local.hk_set,"og","",true);
                    type_add_type_scr(local.hk,local.hk_set,"hd","",true);
                    type_add_type_scr(local.hk,local.hk_set,"rogue","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(0,local.hk_set,-1,-1,-1); // Default (Recode)
                    custom_arr_set_scr(-2,local.hk_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(-2,local.hk_set,-1,-1,1); // OG (Off)
                    custom_arr_set_scr(2,local.hk_set,-1,-1,2); // HD
                    custom_arr_set_scr(-1,local.hk_set,5,-1,-1); // :) (Random)
            // Frenzy
                local.frenzy = type_add_scr("frenzy",true,true,3,frenzy_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
                local.frenzy_set = type_add_set_scr(local.frenzy,"frenzy","frenzy",local.doll,true); /*ID, Variable Name, Description, Category, Can Disable*/
                // Types
                    type_add_type_scr(local.frenzy,local.frenzy_set,"recode","",true); /*ID, Label, Description, Translate*/
                    type_add_type_scr(local.frenzy,local.frenzy_set,"og","",true);
                    type_add_type_scr(local.frenzy,local.frenzy_set,"hd","",true);
                // Defaults
                    custom_arr_add_len_scr(0,1);
                    custom_arr_set_scr(-2,local.frenzy_set,-1,-1,-1); // Default (Off)
                    custom_arr_set_scr(-2,local.frenzy_set,-1,0,-1); // Story Mode (Off)
                    custom_arr_set_scr(0,local.frenzy_set,-1,-1,0); // Recode
                    custom_arr_set_scr(-1,local.frenzy_set,5,-1,-1); // :) (Random)
        }
    // Endless
        // Real Ringu
            local.real_ringu = type_add_scr("real_ringu",true,true,4,real_ringu_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.real_ringu_set = type_add_set_scr(local.real_ringu,"real_ringu","real_ringu",local.endless,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.real_ringu,local.real_ringu_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.real_ringu,local.real_ringu_set,"og","",true);
                type_add_type_scr(local.real_ringu,local.real_ringu_set,"hd","",true);
                type_add_type_scr(local.real_ringu,local.real_ringu_set,"old","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.real_ringu_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.real_ringu_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.real_ringu_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.real_ringu_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.real_ringu_set,5,-1,-1); // :) (Random)
        // Tirsiak
            local.tiri = type_add_scr("tiri",true,true,5,tiri_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.tiri_set = type_add_set_scr(local.tiri,"tiri","tiri",local.unknown,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.tiri,local.tiri_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.tiri,local.tiri_set,"og","",true);
                type_add_type_scr(local.tiri,local.tiri_set,"hd","",true);
                type_add_type_scr(local.tiri,local.tiri_set,"old","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.tiri_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.tiri_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.tiri_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.tiri_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.tiri_set,5,-1,-1); // :) (Random)
        // Lisa
            local.lisa = type_add_scr("lisa",true,true,5,lisa_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.lisa_set = type_add_set_scr(local.lisa,"lisa","lisa",local.unknown,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.lisa,local.lisa_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.lisa,local.lisa_set,"og","",true);
                type_add_type_scr(local.lisa,local.lisa_set,"hd","",true);
                type_add_type_scr(local.lisa,local.lisa_set,"alt","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.lisa_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.lisa_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.lisa_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.lisa_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.lisa_set,5,-1,-1); // :) (Random)
        // Otto
            local.otto = type_add_scr("otto",true,true,5,otto_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.otto_set = type_add_set_scr(local.otto,"otto","otto",local.unknown,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.otto,local.otto_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.otto,local.otto_set,"og","",true);
                type_add_type_scr(local.otto,local.otto_set,"hd","",true);
                type_add_type_scr(local.otto,local.otto_set,"old","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.otto_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.otto_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.otto_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.otto_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.otto_set,5,-1,-1); // :) (Random)
        // Spooper
            local.spooper = type_add_scr("spooper",true,true,5,spooper_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.spooper_set = type_add_set_scr(local.spooper,"spooper","spooper",local.unknown,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.spooper,local.spooper_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.spooper,local.spooper_set,"og","",true);
                type_add_type_scr(local.spooper,local.spooper_set,"hd","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.spooper_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.spooper_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.spooper_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.spooper_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.spooper_set,5,-1,-1); // :) (Random)
        // White Face
            local.wf = type_add_scr("wf",true,true,5,wf_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
            local.wf_set = type_add_set_scr(local.wf,"wf","wf",local.unknown,true); /*ID, Variable Name, Description, Category, Can Disable*/
            // Types
                type_add_type_scr(local.wf,local.wf_set,"recode","",true); /*ID, Label, Description, Translate*/
                type_add_type_scr(local.wf,local.wf_set,"og","",true);
                type_add_type_scr(local.wf,local.wf_set,"hd","",true);
                type_add_type_scr(local.wf,local.wf_set,"old","",true);
                type_add_type_scr(local.wf,local.wf_set,"old_hd","",true);
                type_add_type_scr(local.wf,local.wf_set,"imscared","",true);
                type_add_type_scr(local.wf,local.wf_set,"alt","",true);
                type_add_type_scr(local.wf,local.wf_set,"imscared_recode","",true);
            // Defaults
                custom_arr_add_len_scr(0,1);
                custom_arr_set_scr(0,local.wf_set,-1,-1,-1); // Default (Recode)
                custom_arr_set_scr(-2,local.wf_set,-1,0,-1); // Story Mode (Off)
                custom_arr_set_scr(1,local.wf_set,-1,-1,1); // OG
                custom_arr_set_scr(2,local.wf_set,-1,-1,2); // HD
                custom_arr_set_scr(-1,local.wf_set,5,-1,-1); // :) (Random)

// Reverse array
    globalvar mon_obj_arr;
    globalvar mon_rm_arr;
    for (local.i=0; local.i<global.mon_len_var; local.i+=1;)
    {
        if mon_arr[local.i,4] != noone { mon_obj_arr[mon_arr[local.i,4]] = local.i; }
        if mon_arr[local.i,5] != noone { mon_rm_arr[mon_arr[local.i,5]] = local.i; }
    }
draw_load_scr("Loaded config!");