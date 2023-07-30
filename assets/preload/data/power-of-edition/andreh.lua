-- script by ItsCapp, Modified by ElSebas1231

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'53', '-26'} -- I recommend you have your idle offset at 0
leftoffsets = {'48', '-26'}
downoffsets = {'37', '-21'}
upoffsets = {'48', '-27'}
rightoffsets = {'52', '-26'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'IDLE'
left_xml_name = 'LEFT'
down_xml_name = 'DOWN'
up_xml_name = 'UP'
right_xml_name = 'RIGHT'

-- basically horizontal and vertical positions
x_position = 100
y_position = 400

-- scales your character (set to 1 by default)
xScale = 1
yScale = 1


-- pretty self-explanitory
name_of_character_xml = 'solo_andreh'
name_of_character = 'andreh'
name_of_notetype = 'Natanotes'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);

	addAnimationByIndices(name_of_character, 'danceLeft', idle_xml_name, '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24); 
	addAnimationByIndices(name_of_character, 'danceRight', idle_xml_name, '14,15,16,17,18,19,20,21,22,23,24,25,26,27', 24); 
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	setObjectOrder(name_of_character, getObjectOrder('dadGroup') + 1)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local idle = true
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype then
		playAnim(name_of_character, singAnims[direction + 1], true);
		idle = false
		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
			if isSustainNote then
				playAnim(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
			if isSustainNote then
				playAnim(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
			if isSustainNote then
				playAnim(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
			if isSustainNote then
				playAnim(name_of_character, singAnims[direction + 1], true);
			end
		end
	end
end

function onStepHit()
	if curStep % 1 == 0 then
		if getProperty(name_of_character..'.animation.curAnim.finished') and getProperty(name_of_character..'.animation.curAnim.name'):find('sing') then
			playAnim(name_of_character, 'danceLeft')
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
	if curStep % 2 == 0 then
		if getProperty(name_of_character..'.animation.curAnim.finished') and getProperty(name_of_character..'.animation.curAnim.name'):find('sing') then
			playAnim(name_of_character, 'danceRight')
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
		idle = true
	end
end

function onBeatHit()
	if curBeat % 1 == 0 and idle then
        playAnim(name_of_character, 'danceLeft')
	end
	if curBeat % 2 == 0 and idle then
        playAnim(name_of_character, 'danceRight')
	end
end

function onCountdownTick(counter)
	if counter % 1 == 0 then
        playAnim(name_of_character, 'danceLeft')
	end
	if counter % 2 == 0 then
        playAnim(name_of_character, 'danceRight')
	end
end