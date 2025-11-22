ini_open(global.lang_var);
if global.note_override_var { return global.note_override_str_var; }
else if global.mode_var == 0
{
    if global.rm_count_var < 20 || global.note_var > 17 || global.note_var != 7 { return -1; }
    else
    {
        switch global.note_var
        {
            case 0: { return ini_read_string("NOTE","story_a_01","NOTE_story_a_01"); }
            case 1: { return ini_read_string("NOTE","story_a_02","NOTE_story_a_02"); }
            case 2: { return ini_read_string("NOTE","story_a_03","NOTE_story_a_03"); }
            case 3: { return ini_read_string("NOTE","story_a_04","NOTE_story_a_04"); }
            case 4: { return ini_read_string("NOTE","story_a_05","NOTE_story_a_05"); }
            case 5: { return ini_read_string("NOTE","story_a_06","NOTE_story_a_06"); }
            case 6: { return ini_read_string("NOTE","story_a_07","NOTE_story_a_07"); }
            case 7: { return ini_read_string("NOTE","story_b_01","NOTE_story_b_01"); }
            case 8: { return ini_read_string("NOTE","story_b_02","NOTE_story_b_02"); }
            case 9: { return ini_read_string("NOTE","story_b_03","NOTE_story_b_03"); }
            case 10: { return ini_read_string("NOTE","story_b_04","NOTE_story_b_04"); }
            case 11: { return ini_read_string("NOTE","story_b_05","NOTE_story_b_05"); }
            case 12: { return ini_read_string("NOTE","story_b_06","NOTE_story_b_06"); }
            case 13: { return ini_read_string("NOTE","story_c_01","NOTE_story_c_01"); }
            case 14: { return ini_read_string("NOTE","story_c_02","NOTE_story_c_02"); }
            case 15: { return ini_read_string("NOTE","story_c_03","NOTE_story_c_03"); }
            case 16: { return ini_read_string("NOTE","story_c_04","NOTE_story_c_04"); }
            case 17: { return ini_read_string("NOTE","story_c_05","NOTE_story_c_05"); }
            default: { return ini_read_string("NOTE","default","NOTE_default"); }
        }
    }
}
else
{
    global.note_var = mod_scr(global.note_var,43);
    switch global.note_var
    {
        case 0: { return ini_read_string("NOTE","em_a_01","NOTE_em_a_01"); }
        case 1: { return ini_read_string("NOTE","em_a_02","NOTE_em_a_02"); }
        case 2: { return ini_read_string("NOTE","em_a_03","NOTE_em_a_03"); }
        case 3: { return ini_read_string("NOTE","em_a_04","NOTE_em_a_04"); }
        case 4: { return ini_read_string("NOTE","em_a_05","NOTE_em_a_05"); }
        case 5: { return ini_read_string("NOTE","em_a_06","NOTE_em_a_06"); }
        case 6: { return ini_read_string("NOTE","em_a_07","NOTE_em_a_07"); }
        case 7: { return ini_read_string("NOTE","em_b_01","NOTE_em_b_01"); }
        case 8: { return ini_read_string("NOTE","em_b_02","NOTE_em_b_02"); }
        case 9: { return ini_read_string("NOTE","em_b_03","NOTE_em_b_03"); }
        case 10: { return ini_read_string("NOTE","em_b_04","NOTE_em_b_04"); }
        case 11: { return ini_read_string("NOTE","em_b_05","NOTE_em_b_05"); }
        case 12: { return ini_read_string("NOTE","em_b_06","NOTE_em_b_06"); }
        case 13: { return ini_read_string("NOTE","em_c_01","NOTE_em_c_01"); }
        case 14: { return ini_read_string("NOTE","em_c_02","NOTE_em_c_02"); }
        case 15: { return ini_read_string("NOTE","em_c_03","NOTE_em_c_03"); }
        case 16: { return ini_read_string("NOTE","em_c_04","NOTE_em_c_04"); }
        case 17: { return ini_read_string("NOTE","em_c_05","NOTE_em_c_05"); }
        case 18: { return ini_read_string("NOTE","em_c_06","NOTE_em_c_06"); }
        case 19: { return ini_read_string("NOTE","em_c_07","NOTE_em_c_07"); }
        case 20: { return ini_read_string("NOTE","em_d_01","NOTE_em_d_01"); }
        case 21: { return ini_read_string("NOTE","em_d_02","NOTE_em_d_02"); }
        case 22: { return ini_read_string("NOTE","em_d_03","NOTE_em_d_03"); }
        case 23: { return ini_read_string("NOTE","em_d_04","NOTE_em_d_04"); }
        case 24: { return ini_read_string("NOTE","em_d_05","NOTE_em_d_05"); }
        case 25: { return ini_read_string("NOTE","em_d_06","NOTE_em_d_06"); }
        case 26: { return ini_read_string("NOTE","em_d_07","NOTE_em_d_07"); }
        case 27: { return ini_read_string("NOTE","em_d_08","NOTE_em_d_08"); }
        case 28: { return ini_read_string("NOTE","em_e_01","NOTE_em_e_01"); }
        case 29: { return ini_read_string("NOTE","em_e_02","NOTE_em_e_02"); }
        case 30: { return ini_read_string("NOTE","em_e_03","NOTE_em_e_03"); }
        case 31: { return ini_read_string("NOTE","em_e_04","NOTE_em_e_04"); }
        case 32: { return ini_read_string("NOTE","em_e_05","NOTE_em_e_05"); }
        case 33: { return ini_read_string("NOTE","em_e_06","NOTE_em_e_06"); }
        case 34: { return ini_read_string("NOTE","em_e_07","NOTE_em_e_07"); }
        case 35: { return ini_read_string("NOTE","em_f_01","NOTE_em_f_01"); }
        case 36: { return ini_read_string("NOTE","em_f_02","NOTE_em_f_02"); }
        case 37: { return ini_read_string("NOTE","em_f_03","NOTE_em_f_03"); }
        case 38: { return ini_read_string("NOTE","em_f_04","NOTE_em_f_04"); }
        case 39: { return ini_read_string("NOTE","em_f_05","NOTE_em_f_05"); }
        case 40: { return ini_read_string("NOTE","em_f_06","NOTE_em_f_06"); }
        case 41: { return ini_read_string("NOTE","em_f_07","NOTE_em_f_07"); }
        case 42: { return ini_read_string("NOTE","em_f_08","NOTE_em_f_08"); }
    }
}
ini_close();