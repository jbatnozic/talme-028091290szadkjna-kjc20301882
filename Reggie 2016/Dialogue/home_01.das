//ulazi u osvetljenu sobu polako, puskom ispred sebe, vidi coveka kako stoji
//i gleda slike na zidu/negde, sta god ti je lakse da uradis

BEGIN 1, 1
{Turn around. Slowly.}
{[Continue\]}
END

	BEGIN 2, 1
	{[col:navy:The person pulls his head away from the displayed pictures,
	and slowly turns around]}
	{??? - Is that how you greet old friends, uncle Reggie?}
	END
//neki skok iznenadjenja od strane Reggie-a, znak pitanja smenjen znakom uzvika iznad
//glave, nesto u tom fazonu, da prikaze shock
		
		BEGIN 3, 1
		{[col:navy:Reggie stood at the door, mouth agape, too shocked to form a sentence. 
		His nephew, who he took care of since he was born, was standing in front of him. 
		But this wasn't the young lad of (koliko?) he and Richard had left when they went
		to the front. This was an almost grown man. He was the spitting image of his father 
		back when he was a boy, and he had the same, mischievous air around him. Finally, 
		Reggie managed to blurt out: }
		{Reggie: It... It can't be. Raskol?}
		END
		
			BEGIN 4, 1
			{Raskol: I knew you grew old, but I'd never imagine you'd grow senile
			in the process as well, uncle Reggie.}
			{Reggie: With a mouth as foul as that, it ain't hard to guess whose kid you are. 
			God, what'd your poor mother say?}
			END
			
				BEGIN 5, 1
				{Raskol: Well, I wager she'd be more interested in the gun you're pointing 
				at her only son.}
				{Reggie: God's sake kid, you scared the shit out of me! What got into you, 
				sneaking around in people's homes?!}
				END
				
//reggie spusta pusku (unequip, da ne moras da cutscene ubacujes)
					BEGIN 6, 1
					{Raskol: And here I hoped you'd be happy to see your strapping young nephew. 
					I guess a cup of tea would be too much to ask for? It's a long story uncle, 
					and I'll need something to drink.}
					{Reggie: Pushy as ever, aren't you? Fine, I was about to make some anyway. Guess
					it wouldn't hurt if I added another cup to it.} EOP
					END

//tu se zavrsava scena, mozes fade to black pa fade do verande, gde sede za stolom nekim,
//ili pak nazad u istu prostoriju, samo opet za stolom.