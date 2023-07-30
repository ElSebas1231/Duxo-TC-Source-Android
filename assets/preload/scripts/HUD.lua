local things = {
	'acc', 'miss', 'rating',
	'combo', 'sick','good',
	'bad', 'shit'
}

function onCreatePost()
	makeLuaText('score','', 1000, 350, 670)
	setTextSize('score', 25)
	setTextBorder('score', 2, '000000')
	addLuaText('score')

	makeLuaText('miss','', 200, 800, getProperty('score.y'))
	setTextSize('miss', 25)
	setTextBorder('miss', 2, '000000')
	addLuaText('miss')

	makeLuaText('rating','', 1000, 10, 540)
	setTextSize('rating', 25)
	setTextBorder('rating', 2, '000000')
	addLuaText('rating')

	makeLuaText('acc','', 1000, 10, getProperty('rating.y') - 25)
	setTextSize('acc', 25)
	setTextBorder('acc', 2, '000000')
	addLuaText('acc')

	makeLuaText('combo',' ', 0, 10, 370)
	setTextSize('combo', 25)
	setTextBorder('combo', 2, '000000')
	addLuaText('combo')

	makeLuaText('sick','', 200, getProperty('combo.x'), getProperty('combo.y') + 25)
	setTextSize('sick', 25)
	setTextBorder('sick', 2, '000000')
	addLuaText('sick')

	makeLuaText('good','', 200, getProperty('sick.x'), getProperty('sick.y') + 25)
	setTextSize('good',25)
	setTextBorder('good', 2, '000000')
	addLuaText('good')

	makeLuaText('bad','', 200, getProperty('good.x'), getProperty('good.y') + 25)
	setTextSize('bad',25)
	setTextBorder('bad', 2, '000000')
	addLuaText('bad')

	makeLuaText('shit','', 200, getProperty('bad.x'), getProperty('bad.y') + 25)
	setTextSize('shit',25)
	setTextBorder('shit', 2, '000000')
	addLuaText('shit')

	makeLuaText('song','', 400, 42 + screenWidth/2 - 248, screenHeight/2 -335)
	setTextSize('song', 20)
	setTextBorder('song', 2, '000000')
	addLuaText('song')

	for i = 0, #things do
		setTextAlignment(things[i], 'left')
		setObjectCamera(things[i], 'hud')
		setTextFont(things[i], 'Dimbo Regular.ttf')
		setTextFont('score', 'Dimbo Regular.ttf')
		setTextFont('song', 'Dimbo Italic.ttf')
	end

	setTextAlignment('score', 'left')
	setTextAlignment('song', 'center')

	setProperty('scoreTxt.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('rating.alpha', 0)
	setProperty('combo.alpha', 0)
	setProperty('sick.alpha', 0)
	setProperty('good.alpha', 0)
	setProperty('bad.alpha', 0)
	setProperty('shit.alpha', 0)
	setProperty('song.alpha', 0)
	setProperty('acc.alpha', 0)
	
	setObjectCamera('shit', 'hud')

	setObjectOrder('song', getObjectOrder('timeTxt'))
	setObjectOrder('score', getObjectOrder('scoreTxt'))

	setProperty('score.y', getProperty('healthBarBG.y') + 35)
	setProperty('miss.y', getProperty('healthBarBG.y') + 35)
	setProperty('song.y', getProperty('timeBar.y') - 8)

	if getProperty('timeTxt.visible') then
		removeLuaText('score', true)
	elseif getProperty('scoreTxt.visible') then
		removeLuaText('score', true)
		removeLuaText('miss', true)
	end
end


function onUpdate(elasped)
	-- Credits to the BloxxinHUD script by n_bonnie2 for this part of the code
    timeElapsed = math.floor(getProperty('songTime')/1000)
    timeTotal = math.floor(getProperty('songLength')/1000)
    curTime = timeTotal - timeElapsed
	--------------------------- [[End]] ---------------------------------------
	Rating = ratingName

	setTextString('song', '' .. songName .. ' | [' .. string.upper(difficultyName) .. '] | ' .. string.format("%.2d:%.2d", curTime/60%60, curTime%60))
	setTextString('combo','Combo: '..getProperty('combo'))
	setTextString('sick','Sick!: ' .. getProperty('sicks'))
	setTextString('good','Good!: ' ..getProperty('goods'))
	setTextString('bad','Bad: ' .. getProperty('bads'))
	setTextString('shit','Shit: ' .. getProperty('shits'))
	setTextString('score','Puntuación: '..score)
	setTextString('miss','Fallos: '..misses)
	setTextString('acc','Precisión: '..round(rating * 100, 2)..'%')
	setTextString('rating','Rango: (' .. Rating .. ')')

	if botPlay then
		ratingName = 'BotPlay'
	end
	if ratingName == '?' then
		ratingName = 'N/A'
	end
	--If you're using this in normal psych, just change 'Tiempo transcurrido' for 'Time Elapsed', 'Nombre de la canción' for 'Song Name' and ' Desactivado' for 'Disabled'
	if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Tiempo transcurrido' then
		songCalc = timeTotal - curTime
		setTextString('song', '' .. songName .. ' | [' .. string.upper(difficultyName) .. '] | ' .. string.format("%.2d:%.2d", songCalc/60%60, songCalc%60))
	end
	if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Nombre de la canción' then
		setTextString('song', '' .. songName .. ' | [' .. string.upper(difficultyName) .. ']')
	end
	if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Desactivado' then
		removeLuaText('song', true)
	end
	if hideHud then
		for i = 0, #things do
			removeLuaText(things[i], true)
		end
		removeLuaText('score', true)
	end
end

function onSongStart()
	doTweenAlpha('atsong', 'song', 1, 0.5, 'circOut')
	if not hideHud then
		doTweenAlpha('atacc', 'acc', 1, 0.5, 'circOut')
		doTweenAlpha('atrating', 'rating', 1, 0.5, 'circOut')
		doTweenAlpha('atcombo', 'combo', 1, 0.5, 'circOut')
		doTweenAlpha('atsick', 'sick', 1, 0.5, 'circOut')
		doTweenAlpha('atsgood', 'good', 1, 0.5, 'circOut')
		doTweenAlpha('atbad', 'bad', 1, 0.5, 'circOut')
		doTweenAlpha('atshit', 'shit', 1, 0.5, 'circOut')
	end
end

function onEndSong()
	removeLuaText('song', true)
	if not hideHud then
		for i = 0, #things do
			removeLuaText(things[i], true)
		end
	end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end