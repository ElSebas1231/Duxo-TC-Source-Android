function onStepHit()
	if not middlescroll then
		if curStep == 2 then
			noteTweenY("NoteMove2", 0, -120, 0.2, 'sineOut')
			noteTweenAlpha('a', 0, 0, 0.1, 'smootherStepOut')
		end
		if curStep == 4 then
			noteTweenY("NoteMove2", 1, -120, 0.2, 'sineOut')
			noteTweenAlpha('e', 1, 0, 0.1, 'smootherStepOut')
		end
		if curStep == 6 then
			noteTweenY("NoteMove2", 2, -120, 0.2, 'sineOut')
			noteTweenAlpha('p', 2, 0, 0.1, 'smootherStepOut')
		end
		if curStep == 8 then
			noteTweenY("NoteMove2", 3, -120, 0.2, 'sineOut')
			noteTweenAlpha("NoteAlpha", 3, 0, 0.1, 'sineOut')
			noteTweenX('l1', 4, 412, 3, 'elasticOut')
			noteTweenX('d2', 5, 524, 3.1, 'elasticOut')
			noteTweenX('u3', 6, 636, 3.2, 'elasticOut')
			noteTweenX('l4', 7, 748, 3.3, 'elasticOut')
		end
		if curStep == 60 then
			setProperty('updateTime', false)
			setTextString('timeTxt', '¡Mira la lyric!')
		end
		if curStep == 80 then
			setProperty('updateTime', false)
			setTextString('timeTxt', 'Temazo')
		end
		if curStep == 90 then
			setProperty('updateTime', false)
			setTextString('timeTxt', '¡Vuelve el tiempo!')
		end
		if curStep == 100 then
			setProperty('updateTime', true)
		end
		if curStep == 1080 then
			noteTweenY("NoteMove2", 0, 50, 0.1, 'sineOut')
			noteTweenAlpha("NoteAlpha", 0, 1, 0.1, 'sineOut')
		end
		if curStep == 1082 then
			noteTweenY("NoteMove2", 1, 50, 0.1, 'sineOut')
			noteTweenAlpha("NoteAlpha", 1, 1, 0.1, 'sineOut')
		end
		if curStep == 1084 then
			noteTweenY("NoteMove2", 2, 50, 0.1, 'sineOut')
			noteTweenAlpha("NoteAlpha", 2, 1, 0.1, 'sineOut')
			noteTweenX('l1', 4, 732, 1.1, 'sineOut')
			noteTweenX('d2', 5, 844, 1.1, 'sineOut')
			noteTweenX('u3', 6, 956, 1.1, 'sineOut')
			noteTweenX('l4', 7, 1068, 1.1, 'sineOut')
		end
		if curStep == 1086 then
			noteTweenY("NoteMove2", 3, 50, 0.1, 'linear')
			noteTweenAlpha("NoteAlpha", 3, 1, 0.1, 'linear')
		end
	end
if middlescroll then
	if curStep == 2 then
		noteTweenY("NoteMove2", 0, -120, 0.2, 'sineOut')
		noteTweenAlpha('a', 0, 0, 0.1, 'smootherStepOut')
	end
    if curStep == 4 then
        noteTweenY("NoteMove2", 1, -120, 0.2, 'sineOut')
		noteTweenAlpha('e', 1, 0, 0.1, 'smootherStepOut')
    end
    if curStep == 6 then
        noteTweenY("NoteMove2", 2, -120, 0.2, 'sineOut')
		noteTweenAlpha('p', 2, 0, 0.1, 'smootherStepOut')
    end
    if curStep == 8 then
        noteTweenY("NoteMove2", 3, -120, 0.2, 'sineOut')
        noteTweenAlpha("NoteAlpha", 3, 0, 0.1, 'sineOut')
    end
	if curStep == 60 then
		setProperty('updateTime', false)
		setTextString('timeTxt', '¡Mira la lyric!')
	end
	if curStep == 80 then
		setProperty('updateTime', false)
		setTextString('timeTxt', 'Temazo')
	end
	if curStep == 90 then
		setProperty('updateTime', false)
		setTextString('timeTxt', '¡Vuelve el tiempo!')
	end
	if curStep == 100 then
		setProperty('updateTime', true)
	end
    if curStep == 1080 then
        noteTweenY("NoteMove2", 0, 50, 0.1, 'sineOut')
        noteTweenAlpha("NoteAlpha", 0, 0.2, 0.1, 'sineOut')
    end
    if curStep == 1082 then
        noteTweenY("NoteMove2", 1, 50, 0.1, 'sineOut')
        noteTweenAlpha("NoteAlpha", 1, 0.2, 0.1, 'sineOut')
    end
    if curStep == 1084 then
        noteTweenY("NoteMove2", 2, 50, 0.1, 'sineOut')
        noteTweenAlpha("NoteAlpha", 2, 0.2, 0.1, 'sineOut')
    end
    if curStep == 1086 then
        noteTweenY("NoteMove2", 3, 50, 0.1, 'linear')
        noteTweenAlpha("NoteAlpha", 3, 0.2, 0.1, 'linear')
    end
end
	if downscroll then
		if curStep == 2 then
			noteTweenY("NoteMove2", 0, 800, 0.2, 'sineOut')
		end
		if curStep == 4 then
			noteTweenY("NoteMove2", 1, 800, 0.2, 'sineOut')
		end
		if curStep == 6 then
			noteTweenY("NoteMove2", 2, 800, 0.2, 'sineOut')
		end
		if curStep == 8 then
			noteTweenY("NoteMove2", 3, 800, 0.2, 'sineOut')
		end
		if curStep == 1080 then
			noteTweenY("NoteMove2", 0, 570, 0.1, 'sineOut')
		end
		if curStep == 1082 then
			noteTweenY("NoteMove2", 1, 570, 0.1, 'sineOut')
		end
		if curStep == 1084 then
			noteTweenY("NoteMove2", 2, 570, 0.1, 'sineOut')
		end
		if curStep == 1086 then
			noteTweenY("NoteMove2", 3, 570, 0.1, 'sineOut')
		end
		if curStep == 1086 then
			noteTweenX('l1', 4, 732, 1.1, 'elasticOut')
			noteTweenX('d2', 5, 844, 1.1, 'elasticOut')
			noteTweenX('u3', 6, 956, 1.1, 'elasticOut')
			noteTweenX('l4', 7, 1068, 1.1, 'elasticOut')
		end
	end
end