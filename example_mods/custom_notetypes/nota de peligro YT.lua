function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'nota de peligro YT' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'cool_NOTES_YT'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'nota de peligro YT' then
		playSound('notice', 1)
		setProperty('health', getProperty('health') + 0.2)
		doTweenColor('color', 'boyfriend', '00cc00', 0.3, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'color' then
		doTweenColor('color2', 'boyfriend', 'ffffff', 0.3, 'linear');
	end
end