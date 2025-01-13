-- gets length of a table, used in Ob:voicelineTableFill()
function tableLength(tbl)
    local count = 0
    local i = 1
    while tbl[i] ~= nil do
        count = count + 1
        i = i + 1
    end
    return count
end

function FordAnnoyer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --controls time between voicelines, in seconds
        Ob.announcementTime = 10  
        Ob.TIMER_ANNOUNCEMENT = '7005'
    end

    --used to avoid max lua variable limitations
    function Ob:voicelineTableFill()
        -- A table full of Ford's Global Hints. MUST BE GLOBAL to load in any level
        local voicelinebaseTable = {
            "/GLAU003FO/",--DIALOG=<<Not much to do here except clean up all the cobwebs, collect all the figments, and get any vaults that are left.>>
            "/GLAU000FO/",--DIALOG=<<Don\'t turn up your nose at recycling. You gather up those PSI Cards, and get your self some Cores, and come down to my lab and we\'ll rank you up quick!>>
            "/GLAU001FO/",--DIALOG=<<Maybe if you were a higher rank, you could get some psi powers that could help you out.>>
            "/GLAU002FO/",--DIALOG=<<You can rank up if you collect more figments, sort more emotional baggage, or collect more mental cobwebs.>>
            "/GLAJ011FO/",--DIALOG=<<We have to get by that creepy guard and take that elevator upstairs. >>
            "/GLAJ012FO/",--DIALOG=<<I\'ll bet that\'s where oleander has the girl.>>
            "/GLAJ013FO/",--DIALOG=<<Maybe you could make some kind of a disguise...>>
            "/GLAJ014FO/",--DIALOG=<<What are we doing down here? We need to be up in the tower, trying to free your girlfriend!>>
            "/GLAJ005FO/",--DIALOG=<<We\'re by the old, abandoned insane asylum. I\'ll bet Oleander has his headquarters up inside.>>
			"/GLAJ006FO/",--DIALOG=<<And keep your eyes peeled for stolen brains.>>
			"/GLAJ007FO/",--DIALOG=<<The thief might have dropped some along the way.>>
			"/GLAJ008FO/",--DIALOG=<<I\'ll bet those crows can see where some of them are...>>
            "/GLAJ009FO/",--DIALOG=<<Go into this guard\'s mind, and see if you can find a way to make him open the gate!>>
            "/GLAJ010FO/",--DIALOG=<<Lets find a way into that asylum!>>
            "/GLAJ026FO/",--DIALOG=<<Let\'s help Sasha and Milla blast your girlfriend out of that chair!>>
            "/GLAJ025FO/",--DIALOG=<<Use telekinesis to put that little turtle\'s brain in that tank\'s cockpit!>>
            "/GLAJ024FO/",--DIALOG=<<Let\'s give this turtle back to that sad girl with the oven mitts on.>>
            "/GLAJ023FO/",--DIALOG=<<He\'s coming for the cake! Lure him under that hatch in his cage, and then use telekinesis to lift him out!>>
            "/GLAJ022FO/",--DIALOG=<<We need to free the turtle hostage. Perhaps that chocolate cake could be deployed in a rescue capacity.>>
            "/GLAJ016FO/",--DIALOG=<<Keep moving up! We gotta get to the top!>>
            "/GLAJ017FO/",--DIALOG=<<Watch out for that guard crow. >>
            "/GLAJ018FO/",--DIALOG=<<He might not be too alert if you smacked him with a confusion grenade I\'ll bet...>>
            "/GLAS000FO/",--DIALOG=<<You have to TK rubble against rubble!>>
            "/GLAS001FO/",--DIALOG=<<Break a hole big enough in the first ring so you can get in and set fire to the inner ring.>>
            "/GLAS002FO/",--DIALOG=<<Then TK a hunk of masonry right on that idiot\'s brain!>>
            "/GLAJ015FO/",--DIALOG=<<Try to shoot those rats before they get too close!>>
            "/GLAR005FO/",--DIALOG=<<You can TK those spears into that bull, well, see if that slows him down.>>
            "/GLAR006FO/",--DIALOG=<<Man, get those spears out of Edgar\'s back! What kind of friend are you?>>
            "/GLAR007FO/",--DIALOG=<<And see if you can confuse that matador.>>
            "/GLAR008FO/",--DIALOG=<<While that matador thinks he\'s a bull, he\'s probably vulnerable like a bull. >>
            "/GLAR009FO/",--DIALOG=<<Try sticking him with those barbed poles.>>
            "/GLAR004FO/", --<<Throw a confusion grenade at that Bull. That should buy you some time.
            "/GLAR000FO/", --<<Buy all the paintings you can, and look for hooks to hang them on.
            "/GLAR001FO/", --<<And for crying out loud STAY OFF THE STREET.
            "/GLAR002FO/", --<<You can't outrun that bull. You're going to have to sneak around on side streets.
            "/GLAR003FO/", --<<Maybe you can hide out in a window if those ladies don't see you coming.
            "/GLAI000FO/",--DIALOG=<<Well, if you\'re up for some experimental training, you should go see Sasha in his lab, under the GPC. Should be marked on your map.>>
            "/GLAI001FO/",--DIALOG=<<Looks like you need some better firepower. Better come see me in my lab for your Marksmanship merit badge.>>
            "/GLAI002FO/",--DIALOG=<<Go take Sasha\'s marksmanship training! Why else did I give you that learner\'s permit?>>
            "/GLAI003FO/",--DIALOG=<<Well, now that your mind is a deadly weapon, why not go teach that garbage-spitter a lesson.>>
            "/GLAI004FO/",--DIALOG=<<The one in your vision. Not Sasha.>>
            "/GLAI005FO/",--DIALOG=<<Well it is about time you got some levitation instruction.>>
            "/GLAI006FO/",--DIALOG=<<Go take a canoe out to see Agent Vodello. She\'s teaching class right now.>>
            "/GLAI007FO/",--DIALOG=<<I\'m a little worried about your foil-headed friend. Now he\'s not alone!>>
            "/GLAI009FO/",--DIALOG=<<I mean more and more kids are acting just like him. Sitting inside on such a nice day, watching TV up in the lodge.>>
            "/GLAI010FO/",--DIALOG=<<I\'m afraid something very wrong is going on.>>
            "/GLAI011FO/",--DIALOG=<<Better get back to that vision you had in the brain tumbler, and use our levitation to get a closer look.>>
            "/GLAI012FO/",--DIALOG=<<Why are you just standing here when you should be running down to the lake to make sure your girlfriend isn\'t being kidnapped by the monster that lives in the water?>>
            "/GLAI014FO/",--DIALOG=<<Oh, well. That changes everything. Just let her get eaten then.>>
            "/GLAI015FO/",--DIALOG=<<Get to the end of the docks and get in that bathysphere quick! Before that fish gets away!>>
            "/GLAJ004FO/",--DIALOG=<<We have to get back to the other side of the lake. That's where oleander took the girl.>>
            "/GLAE003FO/", --DIALOG=<<Talk to me when you want me to put you back where you were.>>
            "/GLAG007FO/",--DIALOG=<<It never hurts, in situations like this, to be invisible.>>									
			"/GLAG003FO/",--DIALOG=<<Punch!!>>	
            "/GLAD000FO/",--DIALOG=<<Mmmmm, bacon!>>
			"/GLAD001FO/",--DIALOG=<<There\'s that smell again.>>
			"/GLAD002FO/",--DIALOG=<<Deeeelicious.>>
			"/GLAD003FO/",--DIALOG=<<Hey, why don\'t you just take a little nibble of that and see if I can taste it too?>>
			"/GLAD004FO/",--DIALOG=<<Okay, what\'s the situation?>>
			"/GLAD005FO/",--DIALOG=<<*ahem*>>
            "/GLAG016FO/",--DIALOG=<<Hey, it looks like you\'re ready to take on a new psychic power!>>
			"/GLAG017FO/",--DIALOG=<<Ready to come back and get your new merit badge?>>
            "/GLAF044FO/",--DIALOG=<<You gotta feed them some of their own medicine.>>
			"/GLAF045FO/",--DIALOG=<<Avoid their grab attacks and try to hurt them to the point that they split open.>>
			"/GLAF046FO/",--DIALOG=<<And then grab any chunks of their victims that you can find--use TK to throw them into the gaping hole and that should choke up it's system.>>
            "/GLAE002FO/",--DIALOG=<<Affirmative. Prepare for extraction.>>
            "/GLAE010FO/",--DIALOG=<<Cruller out.>>
            "/GLAF083FO/",--DIALOG=<<Good luck!>>
            "/GLAE006FO/",--DIALOG=<<What kind?>>
            "/GLAH000FO/",--DIALOG=<<Hope that makes you feel pretty. >>
            "/GLAE008FO/", --DIALOG=<<Like, say... to what?>>
            "/GLAF081FO/",--DIALOG=<<At this point, I say just beat the heck out of em. Something like that shouldn\'t even exist!>>
            "/GLAF077FO/",--DIALOG=<<Ah youth. I remember the first time I asked that very question.>>
            "/GLAF078FO/",--DIALOG=<<You can\'t kill something like that. But you might be able to use his weapons to your own advantage.>>
            "/GLAF079FO/",--DIALOG=<<Once his swords go into the wall, I\'ll bet you could swing on them in that way you do so well.>>
            "/GLAF075FO/",--DIALOG=<<Yeah, that concentration yap he\'s giving don\'t mean a thing if you can hit him with a nice confusion grenade. While he\'s trying to remember his name, he\'s vulnerable.>>
            "/GLAF066FO/",--DIALOG=<<Well, I mean. That\'s really one word isn\'t it?>>
            "/GLAF068FO/",--DIALOG=<<C-a-hyphen-c-a-w.>>
            "/GLAF070FO/",--DIALOG=<<It\'s a hyphenated word. One, hyphenated word. Like half-wit.>>
            "/GLAF072FO/",--DIALOG=<<Watch his shadow, and when you see him coming down, turn on your shield for a real back-breaking landing.>>
            "/GLAF064FO/",--DIALOG=<<That\'s the thing. You gotta be off the floor when that happens. As soon as he starts to let out a roar, you jump as high as you can and PSI Float. Then he can\'t get you.>>
            "/GLAF061FO/",--DIALOG=<<Yeah, but it\'s not so mean if you shield at the right moment.>>
            "/GLAF062FO/",--DIALOG=<<And if you\'re invisible then he\'s just out of luck.>>
            "/GLAF055FO/",--DIALOG=<<Well, remember you can tumble fast when you\'re using your mental focus...>>
            "/GLAF056FO/",--DIALOG=<<That should help you avoid their cannonballs.>>
            "/GLAF057FO/",--DIALOG=<<And when you get up close, punch them, and when they\'re all sealed up like a pill bug...>>
            "/GLAF058FO/",--DIALOG=<<Light the fuse on their head and see what happens when that cannon goes off inside their armor.>>
            "/GLAF059FO/",--DIALOG=<<And when you\'re tired of that, pick them up with TK and throw them in the water. Snails can\'t swim!>>
            "/GLAF053FO/",--DIALOG=<<Shoot! Shoot em. Blast them in the head. We\'re trying to save the world here, not start an aviary!>>
            "/GLAF051FO/",--DIALOG=<<If a dog did that to me, I\'d shoot it. From a distance. With my PSI Blast.>>
            "/GLAF049FO/",--DIALOG=<<They\'re only invulnerable while they\'re spinning, but if you can\'t wait, try fire.>>
            "/GLAF042FO/",--DIALOG=<<Oh, be careful with people\'s nightmares, son.>>
            "/GLAF043FO/",--DIALOG=<<They\'ll pull you into their nightmare world and never let go.>>
            "/GLAF047FO/",--DIALOG=<<When it turns to glass you can shatter it with one good punch.>>
            "/GLAF039FO/",--DIALOG=<<Go invisible quick. Those mutant PSI cougars can firestart at quite a distance, but they can\'t burn what they can\'t see.>>
            "/GLAF040FO/",--DIALOG=<<And also, if you pick them up with TK you can actually distract them for a little bit, and use that to your advantage.>>
            "/GLAF034FO/",--DIALOG=<<Not just any bears, but bears that have been mutated by PSI Tanium.>>
            "/GLAF035FO/",--DIALOG=<<Now they know telekinesis!>>
            "/GLAF036FO/",--DIALOG=<<When you see that TK claw come out you have to dodge it quick.>>
            "/GLAF037FO/",--DIALOG=<<And PSI Blast those bears from a distance, or set their tails on fire.>>
            "/GLAF032FO/",--DIALOG=<<Shield! After your enemy takes a shot, advance. When you see them about to shoot again, shield up! Get real close that way, and you can take any shot you want.>>
            "/GLAF030FO/",--DIALOG=<<Yeah, RUN AWAY. That\'s my advice there. PSI Blast them from a distance, or run around the side of them and smack them with you monster claw.>>
            "/GLAF028FO/",--DIALOG=<<Well you gotta shield until you see an opening, and then PSI Blast em out of the sky!>>
            "/GLAF024FO/",--DIALOG=<<Do what any self-respecting monster would do!>>
            "/GLAF025FO/",--DIALOG=<<Pick them up! Throw them at something! Boom!>>
            "/GLAF026FO/",--DIALOG=<<But if you\'re surrounded, don\'t forget your shield. And try to time it right.>>
            "/GLAF022FO/",--DIALOG=<<All the time, until I figured out that if you firestart them, they don\'t set off a cloud of confusion.>>
            "/GLAF019FO/",--DIALOG=<<That\'s the PSI Tanium in the water. Makes a lot of the animals around here a little different.>>
            "/GLAF020FO/", --DIALOG=<<At least those crayfish are fun to punch!>>
            "/GLAF017FO/",--DIALOG=<<oh, they can give you a nasty hickee. But if you jump twice and spin, you might be able to shake them off a little quicker.>>
            "/GLAF014FO/",--DIALOG=<<Ah, the Palm Bomb! Just jump up in the air and then punch!>>
            "/GLAF015FO/", --DIALOG=<<You\'ll come down so hard those little guys just pop like popcorn!>>
            "/GLAF011FO/",--DIALOG=<<It\'s best if they can\'t see you, so go invisble when they come around.>>
            "/GLAF012FO/",--DIALOG=<<Or burn them, or hit them with a confusion grenade if you\'re going for entertainment value.>>
            "/GLAF009FO/",--DIALOG=<<Oh, you gotta grab those guys with your Mental Focus Lock, then you can jump left or right to avoid their shots, while PSI Blasting them from a distance.>>
            "/GLAF004FO/",--DIALOG=<<Ah, anything works on those guys. You can punch \'em, PSI Blast \'em...>>
            "/GLAF005FO/",--DIALOG=<<It\'s fun to set fire to them or confuse \'em too. >>
            "/GLAF006FO/",--DIALOG=<<Pick \'em up with TK and throw them. Make your self invisible and sneak up on them. >>
            "/GLAF007FO/",--DIALOG=<<Lottsa fun, those guys.>>
            "/GLAF001FO/",--DIALOG=<<Oh, yeah. The kind that\'s impervious to attack when it\'s curled up? Hate those.>>
			"/GLAF002FO/",--DIALOG=<<You gotta walk up just close enough to wake them up, and then PSI Blast \'em, real quick!>>
            "/GLAC000FO/",--DIALOG=<<Now don\'t pull that out while I\'m physically near by, or I\'m telling you I\'m gonna eat it!>>
            "/GLAJ002FO/",--DIALOG=<<Take that little door you found in Sasha\'s lab and use it on the monster.>>
            "/GLAJ003FO/",--DIALOG=<<We have to get in it\'s head if we\'re going to find out where it took the girl!>>
            "/GLAJ000FO/",--DIALOG=<<Dodge that garbage it\'s spitting out!>>
            "/GLAJ001FO/",--DIALOG=<<And when it\'s sucking it back up, bust open one of those nail boxes and see how it likes the taste of those!>>
			"/GLAN013FO/",--DIALOG=<<Okay, now get up that tower and take out the communications equipment at the top!>>
            "/GLAN010FO/",--DIALOG=<<If you pay attention to this guys actions, you can tell how he\'s about to attack.>>
            "/GLAN011FO/",--DIALOG=<<Wait for him to let down his shield, and then attack.>>
            "/GLAN012FO/",--DIALOG=<<And don\'t forget to use your own shield!>>
            "/GLAN009FO/", --DIALOG=<<You can use those super tankers to get across the channel.>>
			"/GLAN014FO/", --DIALOG=<<Why don\'t you just pick up those pesky tanks and throw them at each other?>>
			"/GLAN000FO/", --DIALOG=<<Well, if I were a monster, 50 stories high, I\'d probably start smashing stuff.>>
			"/GLAN001FO/", --DIALOG=<<You hear em. Bust open that prison over there.>>
			"/GLAN006FO/", --DIALOG=<<Your PSI Shield would protect you in that tunnel, and maybe even do some damage to the emitters.>>
			"/GLAN007FO/", --DIALOG=<<We have to find someone to pilot this blimp for us so we can get over this dam!>>
			"/GLAN008FO/", --DIALOG=<<Get up on top of these buildings and take out those planes!>>
            "/GLAT003FO/",--DIALOG=<<Next time his cleaver gets stuck in the ground, run up his arm and punch him in his fat head.>>
            "/GLAT004FO/",--DIALOG=<<Listen to your father! Keep moving or you\'re going to drown!>>
            "/GLAT005FO/",--DIALOG=<<Okay, do NOT run up the flaming arms. >>
            "/GLAT006FO/",--DIALOG=<<Hmm. Try TKing some of your Dad\'s flaming clubs into the butcher.>>
            "/GLAT007FO/",--DIALOG=<<And then, if he ends up, say, curled up in agony, THEN you can punch him in his fat head.>>
            "/GLAT008FO/",--DIALOG=<<Yeah, put your head between your legs and kiss your ass good bye!>>
            "/GLAT009FO/",--DIALOG=<<Hang onto that power your dad gave you, because it\'s the only chance we\'ve got.>>
            "/GLAT002FO/",--DIALOG=<<You can\'t kill those knife throwers. And somebody\'s already ripped their arms off, but you can swing on their knives once they\'re stuck in the board.>>
            "/GLAT001FO/",--DIALOG=<<Use your TK to grab those bunnies! Or try confusing them! >>
            "/GLAT000FO/",--DIALOG=<<Follow that kid! Don\'t let him get hurt while your brains are connected!>>
            "/GLAL001FO/",--DIALOG=<<Stay on your bubble, Raz.>>
            "/GLAL002FO/",--DIALOG=<<Keep trying to get higher, and if you see any of those big rings, keep \'em spinning.>>
            "/GLAL000FO/",--DIALOG=<<Do whatever Milla says, young man. You\'re in her classroom now.>>
            "/GLAL006FO/",--DIALOG=<<Get those rings spinning!>>
            "/GLAL005FO/",--DIALOG=<<Use your PSI Float in those columns of bubbles to float up to the top of the room, and then figure out how to turn the big fan on.>>
            "/GLAL003FO/",--DIALOG=<<Don\'t forget you can still PSI Blast when your on the ball. >>
            "/GLAL004FO/",--DIALOG=<<Ranged weapons are always useful in a race.>>
            "/GLAO026FO/",--DIALOG=<<Shoot those exploding cookie boxes.>>
            "/GLAO027FO/",--DIALOG=<<And turn on your shield when you see her throwing stuff at you!>>
            "/GLAO024FO/",--DIALOG=<<You can\'t see in the dark but she can!>>
            "/GLAO025FO/",--DIALOG=<<Clairvoyance will let you see what she sees!>>
            "/GLAO021FO/",--DIALOG=<<Every play doorbell ditch? >>
            "/GLAO022FO/",--DIALOG=<<Let/'s make sure we/'re out of sight before she makes it to the door. >>
            "/GLAO023FO/",--DIALOG=<<And when she opens it, take her out!>>
            "/GLAO018FO/",--DIALOG=<<Looks like they got a sniper. If you time it right, your shield should get you through there.>>
            "/GLAO016FO/",--DIALOG=<<I can/'t see a thing.>>
            "/GLAO017FO/",--DIALOG=<<Try your clairvoyance on those security cameras. I/'ll bet they can see in the dark.>>
            "/GLAO011FO/",--DIALOG=<<You could probably burn those big vines off that mausoleum.>>
            "/GLAO012FO/",--DIALOG=<<Lets get inside that mausoleum!>>
            "/GLAO010FO/",--DIALOG=<<If you used clairvoyance on the that crow feather, you might get a birds-eye view of the situation.>>
            "/GLAO009FO/",--DIALOG=<<Lets search this place for flowers.>>
            "/GLAO020FO/",--DIALOG=<<That telephone would be a good disguise for getting up to those phone company wires.>>
            "/GLAO019FO/",--DIALOG=<<Use your clairvoyance on one of those helicopters and we/'ll be able to search for the Milkman from the air.>>
            "/GLAO015FO/",--DIALOG=<<I forgot the combo. If you forgot it too, we/'re going to have to make that G Man come out again.>>
            "/GLAO014FO/",--DIALOG=<<I/'ll bet if we could see what that G-man sees, we would know the right combination.>>
            "/GLAO013FO/",--DIALOG=<<We have to find a way through the sewers to the book depository.>>
            "/GLAO002FO/",--DIALOG=<<Lets go to the graveyard!>>
            "/GLAO005FO/",--DIALOG=<<Hmmm. Looks like we/'ll need some flowers as a disguise.>>
            "/GLAO006FO/",--DIALOG=<<To the Arboretum!>>
            "/GLAO008FO/",--DIALOG=<<The plant place. It/'s like a garden, but more shrubby and scientific.>>
            "/GLAO002FO/",--DIALOG=<<Lets go to the graveyard!>>
            "/GLAO003FO/",--DIALOG=<<That is the worst road crew disguise I have ever seen.>>
            "/GLAO004FO/",--DIALOG=<<But if it works for them, it should work for us. We just gotta hold up one of those signs.>>
            "/GLAO001FO/",--DIALOG=<<Use you Clairvoyance power on that loony. I/'d like to see what color the sky is in his world.>>
            "/GLAO000FO/",--DIALOG=<<Open the fridge! Like he said!>>
            "/GLAM009FO/",--DIALOG=<<Get as high as you can, and float in shooting!>>
            "/GLAM006FO/",--DIALOG=<<You can hide behind those pillars to break his target-locking on you.>>
            "/GLAM007FO/",--DIALOG=<<Wait until he rears up to charge, and then blast him in his soft pink underbelly!>>
            "/GLAM008FO/",--DIALOG=<<And then when he\'s upside down, get him!>>
            "/GLAM000FO/",--DIALOG=<<Let\'s check out what\'s inside that caravan. Don\'t be afraid of your past.>>
            "/GLAM005FO/",--DIALOG=<<We gotta get up to the top of that vine tower!>>
            "/GLAM001FO/",--DIALOG=<<Hey, you heard the man. Follow the bunny.>>
            "/GLAM002FO/",--DIALOG=<<Keep after that bunny!>>
            "/GLAM003FO/",--DIALOG=<<Watch out for those killer plants. You can\'t hurt them when they\'re all coiled up.>>
            "/GLAM004FO/",--DIALOG=<<Stay on the ground if you want to fight, but you could probably avoid some of it if you took the higher route. >>
            "/GLAK000FO/",--DIALOG=<<Why don\'t you just do what Sasha said. Listen to your teacher young man!>>
            "/GLAK001FO/",--DIALOG=<<Well, you might get your merit badge a little faster if you turn up the censor output all the way...>>
            "/GLAK002FO/",--DIALOG=<<You gotta find all those leaks that are squirting out censors, and take \'em out!>>
            "/GLAK003FO/",--DIALOG=<<And when you\'re fighting these guys, don\'t forget to lock your mental focus on them for accuracy.>>
            "/GLAK004FO/",--DIALOG=<<Those little censors seem to be restoring the big guy\'s health. >>
            "/GLAK005FO/",--DIALOG=<<You gotta shut down the leaks the little censors are coming out of!>>
            "/GLAK006FO/",--DIALOG=<<Take the big guy out! >>
            "/GLAK007FO/",--DIALOG=<<Don\'t forget to hold mental focus while you\'re blasting!>>
            "/GLAK008FO/",--DIALOG=<<Locking focus on him will also make it easier to circle around and get behind him!>>
		    "/GLAP012FO/", --<<Let's turn a light on this guy so we can see who he is.
            "/GLAP011FO/", --<<Those spotlights couldn't find you if you were invisible.	
            "/GLAP013FO/", --<<Let's float up to the catwalks and blind him with those spotlights so he'll let down his guard.
            "/GLAP014FO/", --<<Zig zag on the way up to avoid the fat man's attacks.
			"/GLAP000FO/", --<<Let's go back to the dressing rooms and see if we can't get this Bonita person to take the stage.
			"/GLAP001FO/", --<<Somewhere in that storage room is a candle that we need.
			"/GLAP002FO/", --<<Let's put this candle in that spotlight so the show can begin!
            "/GLAP003FO/", --<<Well, I think you should go talk to that blowhard up in the balcony and give him a piece of your mind.
            "/GLAP004FO/", --<<...and see if he knows anything.
            "/GLAP005FO/", --<<Let's give this script to Becky and see if it's any good.
			"/GLAP006FO/", --<<I wonder if those prop doors on the set really work?
			"/GLAP007FO/", --<<I'll bet if you punched that strange spotlight with the faces on it, you could change what's going on on stage.
            "/GLAP008FO/", --<<We have to get up to the catwalks and get rid of that Phantom character.
            "/GLAP009FO/", --<<I'll bet the right script played on the right set would do it!
            "/GLAP010FO/", --<<Let's take that prop magic cloud elevator thing up to the catwalks.
			"/GLAG006FO/",--DIALOG=<<I would use telekinesis here.>>
            "/GLAQ000FO/",--DIALOG=<<Well, we\'ll never get our troops over that river while the bridge is out.>>
            "/GLAQ001FO/",--DIALOG=<<We need to get a carpenter to fix it!>>
            "/GLAQ002FO/",--DIALOG=<<If I were there I would use telekinesis to move the game pieces around.>>
            "/GLAQ003FO/",--DIALOG=<<You can\'t win a war without soldiers. >>
            "/GLAQ004FO/",--DIALOG=<<Let\'s go see if we can sign up a standing army.>>
            "/GLAQ005FO/",--DIALOG=<<Put our militia man next to Napoleon\'s soldier piece so they can fight!>>
			"/GLAQ006FO/",--DIALOG=<<Ooh, we gotta get that guy some money before he\'ll fight.>>
            "/GLAQ007FO/",--DIALOG=<<Heh heh! Let\'s ransack Fred\'s parlor!>>
			"/GLAQ008FO/",--DIALOG=<<We gotta go through that building over there and find that guy\'s musket!>>
			"/GLAQ009FO/",--DIALOG=<<Okay, we just gotta get that drawbridge down, and get a hearty knight to storm Napoleon\'s stronghold and we\'ll win.>>
            "/GLAQ010FO/",--DIALOG=<<We gotta get some fancy food for that fat guy to eat.>>
            "/GLAQ012FO/",--DIALOG=<<He sounds fat.>>
            "/GLAQ014FO/",--DIALOG=<<We\'re going to have to infiltrate the grounds of the stronghold and see if we can\'t get the drawbridge down for fatty. >>

        }     
        
        --write results to new tables
        self.voicelineTable = voicelinebaseTable
    end

    function Ob:onBeginLevel()		
        %Ob.Parent.onBeginLevel(self)
        self:voicelineTableFill()
        --create a timer for the voicelines, multiply by 1000 for game time
        self:createTimer(self.announcementTime*1000, self.TIMER_ANNOUNCEMENT)
        --create something to show Ford's Janitor Sayline Head
        self.voicelinePlayer = SpawnScript('Global.Props.Geometry', 'FordAnnouncer', 'self.collSphereRadius = 1 self.startCollidee = 0 self.charName=\'FordNinja_sayline\'')
        self.voicelinePlayer:makeInvisible()
    end

    function Ob:stateAnnounce()
        --pick a random voiceline from the list
        local n = tableLength(self.voicelineTable)
        local i = random(1,n)
        local randomVoiceline = self.voicelineTable[i]
        --play the chosen voiceline
        self.voicelinePlayer:sayLine(randomVoiceline,1,1, nil, 1, nil, 1)
        --create a timer for the voicelines, multiply by 1000 for game time
        self:createTimer(self.announcementTime*1000, self.TIMER_ANNOUNCEMENT)
        self:setState(nil)
    end

    function Ob:onTimer(data,from)
        self:killTimer(data)
		if data == self.TIMER_ANNOUNCEMENT then
            --not during cutscenes
            if Global.cutsceneScript.cutscenePlaying ~= 1 then
                self:setState('Announce')
			else
				--if we were prevented from announcing, set up a timer for 1 second until we do announce
				self:createTimer(1000, self.TIMER_ANNOUNCEMENT)
			end
        end
    end
    return Ob
end



