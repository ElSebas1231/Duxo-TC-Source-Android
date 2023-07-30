local active = false
local curWord = ''
local position = 0
local timer = 10
local useSpecificWord = false
local curWordAsLetters = {}
local wordLength = 0

local words = {
	'WAZAAAA',
	'KIMAGOD',
	'VETE!',
	'AYUDAME',
	'WTF',
	'CREISIZZZ',
	'ESCLAVIZADO',
	'VTUBERS?',
	'AY WTF',
	'DUCO',
	'DUPLO',
	'AQUINO',
	'AQUISI',
	'BOO!',
	'WTF UN PORT?',
	'DUCHSO',
	'ABANDONADO',
	'ENSERIO VETE',
	'LO VISTE?',
	'CANSANCIO',
	'INUTIL',
	'PESADILLA',
	'TE VEO',
	'XXXXX',
	'AAAAA',
	'CORRE',
	'HUYE',
}

local onePercentWords = {
	'MI PICHULA!',
	'DUCSO MOD',
	'AQUINOGOD',	
	'FARAGOD',
	'ELPEPE',
	'POTAXIO',
	'ESO TILIN',
	'WAZAAA',
	'AMOGUS SUS',
}

local pointOnePercentWords = {
	'MASTURBIN',
	'DUXIN',
	'EL DE LOS CLIPS',
	'CODIGO CEJO',
	'HUGGY HUGGIES CAPTADOS EN CAMARA',
}

function onCreatePost()
	-- end of "create"
	makeAnimatedLuaSprite('preload', 'Unown_Alphabet', 0, 0);
	addAnimationByPrefix('preload', 'idle', 'A', 24, true);
	objectPlayAnimation('preload', 'idle');
	addLuaSprite('preload');
	removeLuaSprite('preload');
end

function onGameOverStart()
	closeUnown();
end

function onSoundFinished(tag)
	if active then 
	end
end

function onPause()
	if active then 
		return Function_Stop;
	end
end

function onUpdatePost(elapsed)
	if active then 
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ANY') then
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..curWordAsLetters[position + 1]) then
				correctLetter()
			else 
				playSound('buzzer', 1, 'buzz')
			end
		end
	else 
	end
end

function correctLetter()
	position = position + 1
	setProperty('line'..position..'.visible', false)
	if position >= string.len(curWord) then 
		win()
		closeUnown()
	end
end

function win()
	--debugPrint('won')
end

function lose()
	setProperty('health', -10)
	closeUnown();
end



function onStepHit()
	-- triggered 16 times per section

end

function onBeatHit()
	-- triggered 4 times per section
	if active then 
		if timer > 0 then 
			timer = timer - 1
			setTextString('timer', timer)
		else 
			lose();
		end
	end

end

function open()
	active = true
	setProperty('boyfriend.stunned', true)
	setPropertyFromClass('ClientPrefs', 'noReset', true);

	makeLuaSprite('overlay', '', -100, -100)
	makeGraphic('overlay', 2000, 2000, 'ff0000')
	setScrollFactor('overlay', 0,0)
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.alpha', 0.4)
	addLuaSprite('overlay', true)

	makeLuaText('timer', timer, 100, (screenWidth / 2) - 5, 430)
	setTextSize('timer', 32)
	setTextAlignment('timer', 'center')
	setTextFont('timer', 'metro.otf')
	addLuaText('timer')
	
	position = 0
	curWordAsLetters = {}
	--debugPrint(curWord)
	wordLength = string.len(curWord)

	for i = 1, wordLength do 
		curWordAsLetters[i] = string.upper(string.sub(curWord, i, i))
		--debugPrint(curWordAsLetters[i])
		if (curWordAsLetters[i] ~= ' ') then 
			--debugPrint(curWordAsLetters[i])
			createLetterSprite(curWordAsLetters[i], i);
		end
	end
end

function getWord()
	if getRandomBool(0.1) then 
		local wordListLength = #(pointOnePercentWords)
		return tostring(pointOnePercentWords[getRandomInt(1, wordListLength)])	
	end
	if getRandomBool(1) then 
		local wordListLength = #(onePercentWords)
		return tostring(onePercentWords[getRandomInt(1, wordListLength)])	
	end

	local wordListLength = #(words)
	return tostring(words[getRandomInt(1, wordListLength)])	
end

function closeUnown()
	for i = 1, wordLength do 
		removeLuaSprite('unown'..i)
		removeLuaSprite('line'..i)
	end
	removeLuaSprite('overlay')
	removeLuaText('timer')
	active = false
	setProperty('boyfriend.stunned', false)
	setPropertyFromClass('ClientPrefs', 'noReset', false);
end


function createLetterSprite(letter, id)
	local xpos = 0

	if (260 - (15 * wordLength) <= 0) then
		xpos = 40 * id
	else
		xpos = (260 - (15 * wordLength)) * id
		--xpos = 40 * id
	end
	local realscale = 1 - (0.05 * wordLength)
	
	if (realscale < 0.2) then
		realscale = 0.2
	end
	--debugPrint(xpos)

	local sprName = 'unown'..id
	makeAnimatedLuaSprite(sprName, 'Unown_Alphabet', 0, 90);
	addAnimationByPrefix(sprName, 'idle', letter, 24, true);
	objectPlayAnimation(sprName, 'idle');
	setProperty(sprName..'.scale.x', realscale)
	setProperty(sprName..'.scale.y', realscale)
	
	updateHitbox(sprName)
	addLuaSprite(sprName, true);
	setObjectCamera(sprName, 'hud')

	local lineName = 'line'..id
	makeLuaSprite(lineName, 'line', 0, 590);
	setProperty(lineName..'.scale.x', realscale)
	setProperty(lineName..'.scale.y', realscale)
	updateHitbox(lineName)
	addLuaSprite(lineName, true);
	setObjectCamera(lineName, 'hud')


	local mid = 0
	if (260 - (15 * wordLength) <= 0) then
		mid = 40 * (wordLength / 2)
	else
		mid = (260 - (15 * wordLength)) * (wordLength / 2)
	end

	local dif = xpos - mid
	xpos = ((screenWidth - getProperty(sprName..'.width')) / 2) + dif

	setProperty(sprName..'.x', xpos)
	setProperty(lineName..'.x', xpos)
end

function onEvent(name, value1, value2)
	if name == 'startUnown' then 
		if active then 
			closeUnown()
		end
		if value1 == '' then 
			curWord = string.upper(getWord());
		else 
			curWord = tostring(value1)
		end
		if value2 == '' then 
			timer = 10
		else 
			timer = tonumber(value2)
		end
		open();
	end
end



