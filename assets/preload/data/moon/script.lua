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
	makeLuaSprite('colors', 'funny', 0, 0)
	setObjectCamera('colors', 'Other')
	addLuaSprite('colors', true)
	setProperty('colors.visible', false)
end

function onSongStart()
	if isStoryMode and not seenCutscene then
		triggerEvent('Intro', 'Natalan', 'Amigo olvidado')
	else
		triggerEvent('Intro3', 'Sonando:', 'Moon\nDe: Laleritose')
	end	
end

function onStepHit()
	if isStoryMode and not seenCutscene then
		if curStep == 35 then
			triggerEvent('Intro3', 'Sonando:', 'Moon\nDe: Laleritose')
		end	
	end
	if curStep == 64 then
		setProperty('colors.visible', true)
	end
	if curStep == 79 then
		removeLuaSprite('colors')
	end
end