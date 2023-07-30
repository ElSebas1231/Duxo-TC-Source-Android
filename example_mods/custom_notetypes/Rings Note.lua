function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Rings Note' then
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true)
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'rings_assets')
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
			end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Rings Note' then
	    setProperty('health', getProperty('health') +0.3)
		playSound('Ring', 0.5)
	end
end