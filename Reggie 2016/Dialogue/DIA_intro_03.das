//nakon sto prodju izvidnicu
BEGIN 1, 1
{Richard: Well, seems like there aren't that many of them after all. Can you scout ahead while I take stock of their position?}
{[Continue.\]}
END

//razdvoje se, tj. richard se vrati nazad, a reggie ostane i pocinje sledeci dijalog

	BEGIN 2, 1
	{Reggie: It's always been this way, ever since we were kids - Rich would come up with a plan, and I'd follow it without a second thought. Why wouldn't I?
	 He's always been the smarter one.}
	
	//ne mogu da koristim seksi dijalog tipa he was ever the smart one, ne bi se uklapalo u pezntli redzija -prim. pis. (primedba pisstaker-a)
	{I'm fine with that.}
	{I don't really care.}
	{I hate it.}
	END

		BEGIN 3, 1
		{Reggie: I was never cut out for leadership anyway, it's good to have someone you know has a good head calling the shots.}
		{[Continue.\]}
		END
		
			//walkie-talkie or some shitty coms device, idk
			BEGIN 4, 1
			{WTOSSCDIDK: Reggie, this is Richard, do you copy? Over.}
			{I hear you loud and clear, what's the status? Over.}
			END

				BEGIN 5, 1
				{WTOSSCDIDK: There's a group of people heading your way, ten to fifteen of them, possibly enemy combatants. Retreat, I repeat, retreat.}
				{[Continue.\]}
				END

					BEGIN 6, 1
					{WTOSSCDIDK: Reggie, be careful. This is not the time to play the hero, just come back and we'll report to HQ. Over.}
					{Copy that, you big wuss. I'm heading back. Over.} EOP
					END

					//kako igrac krene nazad, tako pocne da se <nesto desava, mozda sruse daske na kojima je stajao? nesto se dogodi sa terrain-om tako da on zavrsi ispred grupe

					//nadje se ispred nekoliko muskaraca, zena i dece. jednako su zbunjeni koliko i on, ako ne i vise


		BEGIN 3, 2
		{Reggie: The job's gotta be done, why does it matter if I do the planning or someone else? At least it's a person who'll have my interests in mind.}
		{[Continue.\]} EOP
		END
		PATH 1 -> 4, 1

		BEGIN 3, 3
		{Reggie: Rich is my brother, and I love him... well, like a brother, but I wish that, for once, he'd let me do the planning. It's not that much to ask for, is it?}
		{[Continue.\]} EOP
		END
		PATH 1 -> 4, 1
		
		