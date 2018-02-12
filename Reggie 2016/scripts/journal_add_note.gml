///journal_add_note(Title:=Note);
/*

*/
if ds_list_find_index(global.journal_list,argument0)=-1
 ds_list_add(global.journal_list,argument0);
