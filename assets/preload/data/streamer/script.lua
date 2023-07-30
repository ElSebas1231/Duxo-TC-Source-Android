function onStepHit()
	if curStep == 363 then
		for i = 0, getProperty('opponentStrums.length') do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
		end
		for i = 0, getProperty('unspawnNotes.length') do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
			end
		end
	end
	if curStep == 375 then
		for i = 0, getProperty('playerStrums.length') do
			setPropertyFromGroup('playerStrums', i, 'texture', 'Corrupnote_assets');
		end
		for i = 0, getProperty('unspawnNotes.length') do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'CorrupnoteSplashes');
			end
		end
	end
	if curStep == 384 then
		cameraFlash('hud', 'b61fbf', 0.5)
	end
end

function noteMiss()
	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.3)
	runTimer('miss', 0.5)
end
		
function goodNoteHit()
	cancelTimer('miss')
	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
end

function onTimerCompleted(t,l,ll)
	if t == 'miss' then
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
	end
end