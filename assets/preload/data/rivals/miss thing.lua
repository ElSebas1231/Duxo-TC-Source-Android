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