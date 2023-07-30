function onCreate()
    setProperty('camHUD.visible',false)
    addCharacterToList('missingno')
    addCharacterToList('bf-pixel2')
    setProperty('skipCountdown', true)
end

function onCreatePost()
    triggerEvent('Camera Follow Pos', '500', '470')
end

function onUpdatePost()
	noteTweenAlpha("NoteAlpha1", 0, 0, 0.3, 'smootherStepOut')
	noteTweenAlpha("NoteAlpha2", 1, 0, 0.3, 'smootherStepOut')
	noteTweenAlpha("NoteAlpha3", 2, 0, 0.3, 'StepOut')
	noteTweenAlpha("noteAlpha4", 3, 0, 0.4, 'StepOut')
end

function onStepHit()
    if curStep == 240 then
        playSound('missingnospawn', 1)
	    triggerEvent('Play Animation', 'intro', 'dad')
        setHealthBarColors('807098', '7300ff')
	end
    if curStep == 242 then
        setProperty('iconP2.alpha',1)
        setProperty('dad.alpha', 1)
        setProperty('camHUD.visible',true)
    end
    if curStep == 251 then
		triggerEvent('Camera Follow Pos', '', '')
    end
end