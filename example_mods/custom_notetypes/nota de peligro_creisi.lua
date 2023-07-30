function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'nota de peligro_creisi' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'bad_NOTES_creisi');
		end
	end
end

function noteMiss(id, i, noteType, isSustainNote)
	if noteType == 'nota de peligro_creisi' then
		playSound('creisideath', 0.5)
		setProperty('health', 0);
		triggerEvent('Play Animation', 'ataque', 'dad')
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'nota de peligro_creisi' then
		playSound('creisiattack', 1)
		triggerEvent('Play Animation', 'ataque', 'dad')
		triggerEvent('Play Animation', 'defense', 'bf')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'nota de peligro_creisi' then
		playSound('creisiattack', 1)
		triggerEvent('Play Animation', 'ataque', 'dad')
		triggerEvent('Play Animation', 'defense', 'bf')
	end
end