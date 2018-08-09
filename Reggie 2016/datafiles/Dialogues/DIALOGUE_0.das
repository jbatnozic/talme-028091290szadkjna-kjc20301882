//Reggie (mc) se nalazi na cistini ispred grada koji je trenutna meta opsade, zajedno sa sadrugom i najboljim prijateljem, <names_are_hard>-om (nah)

//Ovaj pocetak, osim sto uspostavlja odnos izmedju Reggie-a i buduceg plot point-a, tj. oca klinca (WiP), takodje predstavlja priliku za osnovni tutorial - kretanje, combat, etc

BEGIN 1, 1 
PCODE txt_obj_name_1('Reggie'); txt_obj_name_2('Richard');
{[fnt:bold:Finally!] [spr:sword] I was beginning to think you'd never come!}
{If the punishment for deserting wasn't a noose, I'd gladly let you have all the fun...}
{What, and let you have all the fun? Dream on!}
{I wouldn't leave you to guard a toilet without supervision, let alone carry out an important mission.}
END

	BEGIN 2, 1
	{Man, three years in the army and you're still as grumpy and unwilling as the first day. Well, can't say that I don't share the sentiment, from time to time, but still, let's not have that get in the way of our mission, alright?}
	{(continue)}
	END
	
		BEGIN 3, 1
		{Our first assignment is to scout out the enemy territory, find where they're hiding, their numbers, all the number crunching data no one gives a rat's ass about, but fills out the paperwork.}
		{(continue)}
		END
			
			BEGIN 4, 1
			{The sooner we start, the sooner we'll be able to get some grub! Let's go!}
			{(continue)} EOP
			END

	BEGIN 2, 2
	{Now that's the winning attitude I carry you around for! Well, maybe a bit too enthusiastic, but at least your heart's in the right place. At least I hope so.}
	{(continue)} EOP
	END
	PATH 1->3, 1

	BEGIN 2, 3
	{Do you have to keep bringing that up? It was just one tiny screwup! I swear I didn't know the pipes could jet out <b>that</b> much water! Let's just let bygones be bygones, and focus on the now!}
	{(continue)} EOP
	END
	PATH 1->3, 1




//osnovni movementi objasnjeni - kretanje, skakanje, takve stvari

//ovde pretpostavljam da se resetuje brojanje u stablu, tj. pocinjem novo

