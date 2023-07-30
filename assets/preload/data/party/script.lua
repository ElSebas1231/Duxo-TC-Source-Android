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
		startDialogue('dialogue', 'clownso');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onCreate()
	removeLuaSprite('gente2')
end

function onSongStart()
	if isStoryMode and not seenCutscene then
		triggerEvent('Intro', 'Clownso', 'Creado por: Lavendett')
	else
		triggerEvent('Intro2', 'Sonando:', 'Party\nDe: Koifee')
	end	
end

function onStepHit()
	if isStoryMode and not seenCutscene then
		if curStep == 35 then
			triggerEvent('Intro2', 'Sonando:', 'Party\nDe: Koifee')
		end
	end
end