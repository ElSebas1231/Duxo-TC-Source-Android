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

function onSongStart()
	if isStoryMode and not seenCutscene then
		triggerEvent('Intro3', 'Creisi y Andreh', 'Editores Corruptos')
	else
		triggerEvent('Intro3', 'Sonando:', 'Madcow\nDe: Jomei Kujo')
	end
	doTweenAlpha('blackbg', 'blackbg', 0, 4, 'sineInOut')
end

function onCreatePost()
	makeLuaSprite('blackbg', '', screenWidth * -0.5, screenHeight * -0.5)
	makeGraphic('blackbg', screenWidth * 2, screenHeight * 2, '000000')
	setScrollFactor('blackbg', 0)
	setObjectCamera('blackbg', 'other')
	setProperty('blackbg.alpha', 0.9)
	addLuaSprite('blackbg')
end

function onStepHit()
	if isStoryMode and not seenCutscene then
		if curStep == 40 then
			triggerEvent('Intro3', 'Sonando:', 'Madcow\nDe: Jomei Kujo')
		end
	end
	if curStep == 313 then
		doTweenAlpha('blackbg', 'blackbg', 0.9, 1, 'sineInOut')
	end
	if curStep == 418 then
		doTweenAlpha('blackbg', 'blackbg', 0, 2, 'sineInOut')
	end
	if curStep == 704 then
		doTweenAlpha('blackbg', 'blackbg', 1, 13, 'sineInOut')
	end
end