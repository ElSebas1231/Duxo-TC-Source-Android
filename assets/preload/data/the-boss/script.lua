function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.01);
    end
end

local allowCountdown = false;
local playDialogue = false;

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('animatic');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = false;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end


local allowEndShit = false

function onEndSong()
	if not allowEndShit and isStoryMode and not seenCutscene then
	 	setProperty('inCutscene', true);
	 	startDialogue('dialogue2');
		setProperty('strumLineNotes.visible', false)
		removeLuaText('score', true)
		removeLuaText('acc', true)
		setProperty('healthBarBG.visible', false)
		setProperty('healthBar.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
	 	allowEndShit = true;
	 	return Function_Stop;
	end
	return Function_Continue;
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
		triggerEvent('Intro3', 'Aquino Corrupto', '(Tercera Forma)')
	else
		triggerEvent('Intro3', 'Sonando:', 'The Boss\nDe: Laleritose')
	end	
end

function onStepHit()
	if isStoryMode and not seenCutscene then
		if curStep == 60 then
			triggerEvent('Intro3', 'Sonando:', 'The Boss\nDe: Laleritose')
		end
	end
end