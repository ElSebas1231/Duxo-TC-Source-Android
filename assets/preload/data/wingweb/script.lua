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
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

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

function onSongStart()
	if isStoryMode and not seenCutscene then
		triggerEvent('Intro3', 'Youtube', 'La plataforma corrupta')
	else
		triggerEvent('Intro3', 'Sonando:', 'Wing Web\nDe: Laleritose')
	end
end

function onStepHit()
	if isStoryMode then
		if curStep == 50 then
			triggerEvent('Intro3', 'Sonando:', 'Wing Web\nDe: Laleritose')
		end
	end
end

function onCreatePost()
	for i = 2, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
	end
	for w = 0,getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', w, 'mustPress') then
        	if getPropertyFromGroup('unspawnNotes', w, 'noteData') == 2 or getPropertyFromGroup('unspawnNotes',w,'noteData') == 3 then
            	setPropertyFromGroup('unspawnNotes', w, 'texture', 'Corrupnote_assets');
				setPropertyFromGroup('unspawnNotes', w, 'noteSplashTexture', 'CorrupnoteSplashes');
			end
        end
    end
end