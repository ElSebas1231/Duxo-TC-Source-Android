function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.01);
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

function onCreatePost()
	--black bg
	makeLuaSprite('blackbg', '', screenWidth * -0.5, screenHeight * -0.5)
	makeGraphic('blackbg', screenWidth * 2, screenHeight * 2, '000000')
	setScrollFactor('blackbg', 0)
	setObjectOrder('blackbg', getObjectOrder('gfGroup') -1)
	addLuaSprite('blackbg', false)
	setProperty('blackbg.alpha', 0)
end

function onStepHit()
	if not isStoryMode then
		if curStep > 0 and curStep < 20 and mousePressed('right') then
			loadSong('4mesesdesub', 'normal')
		end
	end
	if curStep == 255 then
		if flashingLights then
			cameraFlash('hud', '794ec8', 0.5)
		end
		doTweenColor('colordad', 'dad', '0xFF794ec8', 0.1, 'expoInOut')
		doTweenColor('colorbf', 'boyfriend', '0xFF794ec8', 0.1, 'expoInOut')
		doTweenColor('colorgf', 'gf', '0xFF794ec8', 0.1, 'quadInOut')
		doTweenColor('creisibg1', 'creisi14_00', '0xFF794ec8', 0.1, 'quadInOut')
		doTweenColor('creisibg2', 'creisi14_02', '0xFF794ec8', 1, 'quadInOut')
	end
	if curStep == 513 then
		doTweenColor('colordad', 'dad', '0xFF6d3acb', 0.1, 'expoInOut')
		doTweenColor('colorbf', 'boyfriend', '0xFF6d3acb', 0.1, 'expoInOut')
		doTweenColor('colorgf', 'gf', '0xFF6d3acb', 1, 'quadInOut')
		doTweenAlpha('blackbg', 'blackbg', 0.5, 1, 'quadInOut')
		doTweenColor('creisibg1', 'creisi14_00', '0xFF6d3acb', 1, 'quadInOut')
		doTweenColor('creisibg2', 'creisi14_02', '0xFF6d3acb', 1, 'quadInOut')
	end
	if curStep == 641 then
		doTweenColor('colordad', 'dad', '0xffffffff', 1, 'expoInOut')
		doTweenColor('colorbf', 'boyfriend', '0xffffffff', 1, 'expoInOut')
		doTweenColor('colorgf', 'gf', '0xffffffff', 1, 'quadInOut')
		doTweenColor('creisibg1', 'creisi14_00', '0xffffffff', 1, 'quadInOut')
		doTweenColor('creisibg2', 'creisi14_02', '0xffffffff', 1, 'quadInOut')
		doTweenAlpha('blackbg', 'blackbg', 0, 1, 'quadInOut')
	end
end