function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Natanotes' then
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.hue', -80)
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.brightness', 0)
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.saturation', -50)
			setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0.4)
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true)
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end