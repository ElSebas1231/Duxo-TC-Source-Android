function onCreate()
	setProperty('dad.visible', false)
	setProperty('camHUD.visible',false)
	setTextString('botplayTxt', 'Restless')

	makeAnimatedLuaSprite('notacel', 'Note_asset', getCharacterX('gf') - 20, getCharacterY('gf') - 50)
	addLuaSprite('notacel', true)
	addAnimationByPrefix('notacel', 'dance', 'Note Full', 24, false)

	makeAnimatedLuaSprite('notacel2', 'Note_asset', getProperty('notacel.x')+50, getProperty('notacel.y')+190)
	addLuaSprite('notacel2', true)
	addAnimationByPrefix('notacel2', 'dance', 'Note Full', 24, false)

	makeAnimatedLuaSprite('notacel3', 'Note_asset', getProperty('notacel2.x')+100, getProperty('notacel.y')+70)
	addLuaSprite('notacel3', true)
	addAnimationByPrefix('notacel3', 'dance', 'Note Full', 24, false)
	
	setProperty('notacel.visible',false)
	setProperty('notacel2.visible',false)
	setProperty('notacel3.visible',false)
end

function onSongStart()
	setProperty('dad.visible', true)
	triggerEvent('Play Animation', 'fadeIn', 'dad')
	triggerEvent('Play Animation', 'fadeIn', 'dad')
	if dadName == 'Lost_mau' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'Lost_mau-death')
		setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Lost_mau-death')
		setPropertyFromClass('GameOverSubstate', 'endSoundName', 'MissingnoDone')
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'nadda')
	end
end

function onStepHit()
	if getProperty('curBeat') >= 32 then -- Don't ask me why is this in onStepHit bc idk
		setProperty('camHUD.visible',true)
		setProperty('boyfriend.stunned', false)
	end
	if curStep == 368 then
		setProperty('updateTime', false)
		doTweenColor('timeBar', 'timeBar', 0.5, 'linear'); 
		doTweenColor('timeTxt', 'timeTxt', 0.5, 'linear'); 
		setTextString('timeTxt', 'Restless')
	end
	if curStep == 384 then
		setProperty('updateTime', true)
	end
	if curStep == 816 then
		setProperty('updateTime', false)
		doTweenColor('timeBar', 'timeBar', 0.5, 'linear'); 
		doTweenColor('timeTxt', 'timeTxt', 0.5, 'linear'); 
		setTextString('timeTxt', 'Restless')
	end
	if curStep == 832 then
		setProperty('updateTime', true)
	end
	if curStep == 1264 then
		setProperty('updateTime', false)
		doTweenColor('timeBar', 'timeBar', 0.5, 'linear'); 
		doTweenColor('timeTxt', 'timeTxt', 0.5, 'linear'); 
		setTextString('timeTxt', 'Restless')
	end
	if curStep == 1280 then
		setProperty('updateTime', true)
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		if value1 == 'Spawn' and value2 == 'gf' then
			objectPlayAnimation('notacel','dance',true)
			objectPlayAnimation('notacel2','dance',true)
			objectPlayAnimation('notacel3','dance',true)
			setProperty('notacel.visible', true)
			setProperty('notacel2.visible', true)
			setProperty('notacel3.visible', true)
			runTimer('perish1', 1)
			runTimer('perish2', 1)
			runTimer('perish3', 1)
		end
	end
	if name == 'startUnown' then
		triggerEvent('Play Animation', 'ataque', 'dad')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'perish1' then
		doTweenAlpha('fade1', 'notacel', 0, 0.4, 'linear');
		runTimer('appear1', 1)
	elseif tag == 'perish2' then
		doTweenAlpha('fade2', 'notacel2', 0, 0.4, 'linear');
		runTimer('appear2', 1)
	elseif tag == 'perish3' then
		doTweenAlpha('fade3', 'notacel3', 0, 0.4, 'linear');
		runTimer('appear3', 1)
	elseif tag == 'appear1' then
		doTweenAlpha('appear1', 'notacel', 1, 0.4, 'linear');
		setProperty('notacel.visible',false)
	elseif tag == 'appear2' then
		doTweenAlpha('appear2', 'notacel2', 1, 0.4, 'linear');
		setProperty('notacel2.visible',false)
	elseif tag == 'appear3' then
		doTweenAlpha('appear3', 'notacel3', 1, 0.4, 'linear');
		setProperty('notacel3.visible',false)
	end
end