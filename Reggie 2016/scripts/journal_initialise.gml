///journal_initialise()
/*
INITIALISES THE JOURNAL SYSTEM.

No arguments.

Returns nothing.
*/

//Entry name - number - Chosen keyword - Description - Keyword [1..8]

//BASIC SETUP:
global.journal_grid=ds_grid_create(12,0);
global.journal_list=ds_list_create();
global.journal_counter=0;

//ENTRY DEFINITIONS:
journal_define_entry("DefaultEntry1","DefaultDesc1","k1","k2","k3");
journal_define_entry("DefaultEntry2","DefaultDesc2","w1","w2");
journal_define_entry("DefaultEntry3","DefaultDesc3","b1","b2");
journal_define_entry("DefaultEntry15","DefaultDesc3","b1","b2");
journal_define_entry("DefaultEntry16","The band was formed in November 1996 by Glenn Morten Nordbø, Arild Christensen and Stig Johansen. The band was initially called Purgatory but they soon decided to change their name to something less common. The Sins Of Thy Beloved is often compared to gothic metal bands such as Tristania and early Theatre of Tragedy, mainly because of the band's combination of a female soprano voice with male death grunts; this trait is common to gothic metal in general, and is known as beauty and the beast vocals.","b1","b2");

 journal_unlock_entry("DefaultEntry1");
 journal_unlock_entry("DefaultEntry2");
 journal_unlock_entry("DefaultEntry3"); 
 journal_unlock_entry("DefaultEntry15");
 journal_unlock_entry("DefaultEntry16");
  
journal_add_note("NOTE_1:=abc asohior oiqhoei 1 e1p3190 31j1 o1iho diahdqui sqihs qohsoqhs oqosi s1hs189s9 skj nasiquhisuq ishqihs iiwyqiuhs qiushqis qsyqiuhsq isuiqhisqs a s f f h u t r d v hg y . abc asohior oiqhoei 1 e1p3190 31j1 o1iho diahdqui sqihs qohsoqhs oqosi s1hs189s9 skj nasiquhisuq ishqihs iiwyqiuhs qiushqis qsyqiuhsq isuiqhisqs a s f f h u t r d v hg y . abc asohior oiqhoei 1 e1p3190 31j1 o1iho diahdqui sqihs qohsoqhs oqosi s1hs189s9 skj nasiquhisuq ishqihs iiwyqiuhs qiushqis qsyqiuhsq isuiqhisqs a s f f h u t r d v end .");
journal_add_note("NOTE_2:=def");
journal_add_note("NOTE_3:=ghi");
