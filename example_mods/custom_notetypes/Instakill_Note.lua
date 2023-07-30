function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Instakill Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURT_NOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Instakill Note' then
		setProperty('health', -500);
	end
    end
end