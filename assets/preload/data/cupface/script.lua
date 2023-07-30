function onCreate()
    makeAnimatedLuaSprite('wallop', 'c3jo/ready_wallop', -600, -50)
    addAnimationByPrefix('wallop', 'idle', 'Ready? WALLOP!', 12, false)
    setObjectCamera('wallop', 'other')
    addLuaSprite('wallop',true)
    setProperty('wallop.visible', false)

    makeAnimatedLuaSprite('wallop2', 'c3jo/ready_wallop', -600, -50)
    addAnimationByPrefix('wallop2', 'idle', 'Ready? WALLOP!', 20, false)
    setObjectCamera('wallop2', 'other')
    addLuaSprite('wallop2',true)
    setProperty('wallop2.visible', false)

    makeAnimatedLuaSprite('wallop3', 'c3jo/ready_wallop2', -600, -50)
    addAnimationByPrefix('wallop3', 'idle', 'Ready? WALLOP!', 24, false)
    setObjectCamera('wallop3', 'other')
    addLuaSprite('wallop3',true)
    setProperty('wallop3.visible', false)

    makeAnimatedLuaSprite('wallop4', 'c3jo/ready_wallop', -600, -50)
    addAnimationByPrefix('wallop4', 'idle', 'Ready? WALLOP!', 34, false)
    setObjectCamera('wallop4', 'other')
    addLuaSprite('wallop4',true)
    setProperty('wallop4.visible', false)

    makeLuaSprite('ready', 'c3jo/ready', 200, 200)
    setObjectCamera('ready','other')
    addLuaSprite('ready', true)
    setProperty('ready.visible', false)

    makeLuaSprite('set', 'c3jo/set', 300, 200)
    setObjectCamera('set','other')
    addLuaSprite('set', true)
    setProperty('set.visible', false)

    makeLuaSprite('go', 'c3jo/go', 350, 180)
    setObjectCamera('go','other')
    addLuaSprite('go', true)
    setProperty('go.visible', false)
end

function onStepHit()
    if curStep == 16 then
        setProperty('wallop2.visible', true)
        objectPlayAnimation('wallop2','idle',true)
    end
    if curStep == 60 then
        setProperty('wallop2.visible', false)
    end
    if curStep == 80 then
        setProperty('wallop.visible', true)
        objectPlayAnimation('wallop','idle',true)
    end
    if curStep == 140 then
        setProperty('wallop.visible', false)
    end
    if curStep == 592 then
        setProperty('wallop3.visible', true)
        objectPlayAnimation('wallop3','idle',true)
    end
    if curStep == 605 then
        setProperty('wallop3.visible', false)
    end
    if curStep == 610 then
        setProperty('wallop4.visible', true)
        objectPlayAnimation('wallop4','idle',true)
    end
    if curStep == 636 then
        setProperty('wallop4.visible', false)
    end
    if curStep == 644 then
        setProperty('ready.visible', true)
    end
    if curStep == 647 then
        doTweenAlpha('readyfade', 'ready', 0, 0.1, 'linear')
        setProperty('set.visible', true)
    end
    if curStep == 652 then
        doTweenAlpha('setfade', 'set', 0, 0.1, 'linear')
        setProperty('go.visible', true)
    end
        if curStep == 655 then
        doTweenAlpha('gofade', 'go', 0, 0.1, 'linear')
    end
end


local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end