//Reggie se budi u krevetu u klasicnoj bolnickoj sobi - stajaznam kakve su sobe bile u doticnom periodu, smislicemo nesto

BEGIN 1, 1
{I wake up to an unfamiliar sight. I'd grown so used to living on the front
that I've all but forgotten the pleasures of a good night's rest in a bed.
Shaking off my drowsiness, I take in my surroundings, and face myself with an obvious question:}
{Where the hell am I?}
END

	BEGIN 2, 1
	{No one is around, but from the sterile feeling of the place,
	coupled with the hospital gown I'm dressed in,
	it's not hard to guess my whereabouts.}
	{What happened?}
	END

//mozda brzi image flashbackovi, mozda samo kratak period gde se nista ne dogadja, nije ni bitno, ali stvara utisak desavanja

		BEGIN 3, 1
		{What an awful nightmare... Is what I wish i could say. Sadly,
		I can feel the shrapnel wounds tighten when I yawn, making it hard to just dismiss the memories.}
		{What have I done?}
		END

			BEGIN 4, 1
			{I should've realized as soon as I've seen the children,
			but the instincts that've kept me alive for these years kicked in before I could get them in order...}

			{They were just innocent bystanders. There were women and children, for god's sake. I am a monster...}
			
			{It... It had to be done. If I reacted differently,
			I'd've been a dead man long ago. They were just in the wrong place at the wrong time.}
			
			{They were obviously cooperating with the enemy. I mean,
			what other reason would they have, walking towards their encampment so openly?}
			END
			
//KARMA_POINTS yay or nay? vote now!
				BEGIN 5, 1
				//KARMA_POINTS += 1
				{I... Even if I cannot be forgiven for what I've done,
				I have to keep living on. Richard would kill me if I just up and died.}
				{[Continue\]}
				END
				
					BEGIN 6, 1
					{Maybe I'm not objective enough to judge. I should ask Rich,
					he should be able to put my mind at ease. I wonder where he's at.}
					{How long have I been here?}
					END
					
				
				
						BEGIN 7, 1
						{The sun's setting, so it's been at least a couple of hours, and my beard is still shaven...}
						{[Continue\]} EOP
						END
						
						//vrata se otvaraju, doktor ulazi
						
				BEGIN 5, 2
				{God, that's a fucked up way of approaching it. But I have to. I've seen how regret changes people.}
				{[Continue\]} EOP
				END
				PATH 1 -> 6, 1
				
				BEGIN 5, 3
				//RATIONALIZING += 1
				{Is that really right? Does being an enemy really make human life so cheap?}
				{It can't be helped. It's either us or them.}
				{Of course not. But in these times, being able to moralize is a privilege I cannot afford.} EOP
				END
				PATH 2 -> 6, 1
				
					BEGIN 6, 2
					//KARMA_POINTS -=1
					{It's not as if I killed innocent bystanders. What makes them different from armed enemies?}
					{[Continue\]} EOP
					END
					PATH 1 -> 6, 1
									