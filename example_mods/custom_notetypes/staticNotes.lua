function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'staticNotes' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'staticNotes');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'staticNotes' then
        playSound('hitStatic1', 1);
		triggerEvent('YOU MISSED THE STATIC NOTE NOW GET FUCKED');
		
		makeAnimatedLuaSprite("estaticaqlia", "hitStatic", -100, -100)addAnimationByPrefix("estaticaqlia", "hitStatic", "staticANIMATION", 24, true);
		setObjectCamera('estaticaqlia', 'other');
		scaleObject('estaticaqlia', 2, 2);
		addLuaSprite('estaticaqlia', true);

		runTimer("estaticaqlia", 0.25, 1);
	end
end


function onTimerCompleted(tag, loops, loopslet)
	if tag == 'estaticaqlia' then
		doTweenAlpha('bye bye', 'estaticaqlia', 0, 0.1, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'bye bye' then
		removeLuaSprite('estaticaqlia', true);
	end
end