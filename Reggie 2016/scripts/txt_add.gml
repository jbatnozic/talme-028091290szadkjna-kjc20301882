///txt_add(Text, Code Prim, Code Sec, Choice 1, ...)
/*

argument0 - (String) Main text of the conversation entry.
argument1 - (String) Code to execute upon opening the entry.
argument2 - (String) Code to execute upon closing the entry.
argument3 - (String) Player choice #1. ([Cond] Is the condition keyword.)
argument4 - (String) Optional: Further choices.
...

*/
var i,e,stage,branch,choices,suffix;

//Setup:
stage=txt_map_get("stage");
branch=txt_map_get("branch");
choices=argument_count-3;

suffix="_s"+string(stage)+"b"+string(branch);

txt_map_set("stage_prev",stage);
txt_map_set("branch_prev",branch);

//Main data:
txt_map_set("main"+suffix,argument[0]);
txt_map_set("code_p"+suffix,argument[1]); //Primary code
txt_map_set("code_s"+suffix,argument[2]); //Secondary code
txt_map_set("choices"+suffix,choices);

//Next stage branches:
if ds_map_exists(global.textbox_map,"branches_s"+string(stage+1))=false
 txt_map_set("branches_s"+string(stage+1),0);

//Choices:
e=0;
for (i=1; i<=choices; i+=1) begin

 txt_map_set("choice_"+string(i)+suffix,argument[2+i]);
 txt_map_set("path_s_"+string(i)+suffix,stage+1);
 txt_map_set("path_b_"+string(i)+suffix, txt_map_get("branches_s"+string(stage+1)) +i );
 
 if string_pos("{End}",argument[2+i])>0 e+=1;
 
end;

//Finalization:
choices-=e;
 
txt_map_add("branches_s"+string(stage+1),choices);

txt_refresh_target(stage,choices==0);
