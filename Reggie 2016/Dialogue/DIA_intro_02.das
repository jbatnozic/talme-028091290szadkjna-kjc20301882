BEGIN 1, 1
{Richard: Now, I don't know about you, but I'm not really itching to shoot anyone I don't have to, so here's what I suggest:}

//sledeci deo ce recimo imati neprijateljsku izvidnicu cim izadju iz sume, ali takodje i neki
//prokop ili tunel ispod, koji im omogucava stealthy approach

{I've seen my share of bloodied corpses, let's try to keep the killing to a minimum.}
{Do we really have the time to spare? The command did say that we should report as soon as possible.}
{I didn't know the army hired girl scouts now! It's war, one or ten more casualties won't hurt anyone. Well, besides them.}
END

	BEGIN 2, 1
	{Richard: Glad to see we're on the same page. Here's how we'll go about it...}
	{[End Dialogue.\]} EOP
	END
	
	BEGIN 2, 2
	{Richard: The command can do the scouting themselves if they're so pressed for time. I'm not going to kill a guy just because 
	some paper pushers can't wait a bit longer!}
	{It's hard to disagree when you put it that way.} EOP	
	END
	PATH 1->2, 1
	
	BEGIN 2, 3
	{Richard: ... Sometimes you really scare me man. Then I realise how glad I am that you're on my side. 
	You know how I feel about killing, so let's at least try to avert it this time, alright?}
	{Fine, you big pansy.} EOP
	END
	PATH 1->2, 1



