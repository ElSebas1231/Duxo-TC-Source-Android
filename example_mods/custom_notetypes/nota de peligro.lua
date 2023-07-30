function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'nota de peligro' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Nota de alerta'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'nota de peligro' then
			playSound('golpe', 1)
			setProperty('health', -900);
			playAnim('boyfriend', 'dodge fail', true);
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'nota de peligro' then
		playSound('silbato', 1)
		triggerEvent('Play Animation', 'dodges', 'bf');
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'nota de peligro' then
		playSound('silbato', 1)
		playAnim('boyfriend', 'dodges', true);
	end
end