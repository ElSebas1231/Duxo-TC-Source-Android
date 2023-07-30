function onUpdate()
    setProperty('introSoundsSuffix', 'nada')
	if curStep == 886 then
		triggerEvent('Camera Follow Pos', '600', '250')
	end
	if curStep == 888 then
		makeLuaSprite('three', 'three', 250, 50)
		setObjectCamera('three','hud')
		addLuaSprite('three', true)
		triggerEvent('Add Camera Zoom', '', '')
	end
	if curStep == 893 then
		doTweenAlpha('threefun', 'three', 0, 0.01, 'linear')
		makeLuaSprite('two', 'two', 250, 50)
		setObjectCamera('two','hud')
		addLuaSprite('two', true)
		triggerEvent('Add Camera Zoom', '', '')
	end
	if curStep == 896 then
		doTweenAlpha('twofun', 'two', 0, 0.01, 'linear')
		makeLuaSprite('one', 'one', 250, 50)
		setObjectCamera('one','hud')
		addLuaSprite('one', true)
		triggerEvent('Add Camera Zoom', '', '')
	end
	if curStep == 900 then
		doTweenAlpha('onefun', 'one', 0, 0.01, 'linear')
		makeLuaSprite('go', 'gofun', 250, 50)
		setObjectCamera('go','hud')
		addLuaSprite('go', true)
		triggerEvent('Add Camera Zoom', '', '')
	end
	if curStep == 902 then
		doTweenAlpha('gofun', 'go', 0, 0.1, 'linear')
	end
	if curStep == 906 then
		removeLuaSprite('three')
		removeLuaSprite('two')
		removeLuaSprite('one')
		removeLuaSprite('go')
		triggerEvent('Camera Follow Pos', '', '')
	end
end

function onStepHit()
	if curStep == 890 then
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', 'Majin_Notes');
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
		setPropertyFromGroup('unspawnNotes', i, 'texture', 'Majin_Notes');
		end
	end
	for i = 0, getProperty('playerStrums.length')-1 do
	setPropertyFromGroup('playerStrums', i, 'texture', 'Majin_Notes');
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
		setPropertyFromGroup('unspawnNotes', i, 'texture', 'Majin_Notes');
		end
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
		setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Majin_Splashes');
		end
	end
end
	if curStep == 901 then
		doTweenColor('timeBar', 'timeBar', '7b32a7', 0.5, 'linear'); 
		doTweenColor('timeTxt', 'timeTxt', '7b32a7', 0.5, 'linear'); 
	end
	if curStep == 902 then
		makeLuaSprite('flash', '', 0, 0);
		makeGraphic('flash',1920,1080,'031479')
		cameraFlash('hud', '031479', 0.5)
		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -36.5)
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -90)
		end
	end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.01);
    end
end

local allowCountdown = false

function onStartCountdown()
    if not allowCountdown then
        runTimer('startText', 0.1);
        allowCountdown = true
        startCountdown();
        return Function_Stop
    end
    return function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('blackscreen', 'blackscreen', 0, 0);
		setObjectCamera('blackscreen', 'hud');
		addLuaSprite('blackscreen', true);
		makeLuaSprite('circle', 'CircleMajin', 777, 0);
		setObjectCamera('circle', 'hud');
		addLuaSprite('circle', true);
		makeLuaSprite('text', 'TextMajin', -1100, 0);
		setObjectCamera('text', 'hud');
		addLuaSprite('text', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
		runTimer('sonic1', 3,1);
	elseif tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.2, 'linear');
		doTweenX('texttween', 'text', 0, 0.2, 'linear');
	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	elseif tag == 'sonic1' then
		doTweenAlpha('circlefade', 'circle', 0, 2, 'linear');
		doTweenAlpha('textfade', 'text', 0, 2, 'linear');
		doTweenX('circletween', 'circle', 2000, 0.5, 'linear');
		doTweenX('texttween', 'text', -2000, 0.5, 'linear');
	end
end

function onCountdownTick(counter)
	if counter == 1 then
		doTweenColor('bfColorTween', 'dad', '0xFF3b74b4', 0.1, 'expoInOut')
		doTweenColor('dadColorTween', 'boyfriend', '0xFF3b74b4', 0.1, 'expoInOut')
	end
end