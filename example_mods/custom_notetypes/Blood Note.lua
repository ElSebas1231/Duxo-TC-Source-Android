function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blood Note' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_blood');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 10);
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
			end
		end
	end
end

local healthDrain = 0;
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Blood Note' then
		healthDrain = healthDrain + 50.0;
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.0 * elapsed;
		setProperty('health', getProperty('health') - 0.1 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end