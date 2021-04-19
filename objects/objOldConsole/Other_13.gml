/// @description  Delete selection
/*
if (cursor_pos1 != cursor_pos2) {
    
    var minpos, maxpos;
    minpos = min(cursor_pos1, cursor_pos2);
    maxpos = max(cursor_pos1, cursor_pos2);
    value = string_delete(value, minpos+1, maxpos-minpos);
    cursor_pos1 = minpos;
    cursor_pos2 = minpos;
    
}

