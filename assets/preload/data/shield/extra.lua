local colormalo = "811896";
local textObj = nil;
local textTimer = 0;

function onCreate()
	makeLuaText('lyric','placeholder',screenWidth,0,screenHeight/2);
	setTextFont('lyric','CURLZ___.ttf');
	setTextBorder('lyric',5,'18172e');
	setTextSize('lyric',100);
	setTextAlignment('lyric','center')
	setObjectCamera('lyric', 'camOther')
	addCharacterToList('pico')
	addCharacterToList('bf-duxo')
end

function onStepHit()
	if curStep == 956 then
		doTweenAlpha('asco', 'camHUD', 1, 0.01, 'smootherStepOut')
	end
	--Oh no! Corruption!
	if curStep == 380 then
		setTextColor('lyric',colormalo);
		setTextString('lyric','La pesadilla...');
		addLuaText('lyric');
		doTweenAlpha('asco', 'camHUD', 0, 2, 'smootherStepOut')
	end
	if curStep == 390 then 
		for i = 0, getProperty('playerStrums.length') do
			setPropertyFromGroup('playerStrums', i, 'texture', 'Corrupnote_assets');
		end
		for i = 0, getProperty('unspawnNotes.length') do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'CorrupnoteSplashes');
			end
		end
		for i = 0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'CorrupnoteSplashes');
            end
        end
	end
	if curStep == 400 then
		setTextColor('lyric',colormalo);
		setTextString('lyric','No debe terminar.');
		addLuaText('lyric');
	end
	if curStep == 405 then
		triggerEvent('Set Cam Zoom', '1.15', '')
	end
	if curStep == 415 then
		doTweenAlpha('asco', 'camHUD', 1, 0.01, 'smootherStepOut')
		removeLuaText('lyric',true);
	end	
	if curStep == 416 then
		triggerEvent('Intro3', 'Lucasta', 'A.K.A Peruano mortal')
	end
	if curStep == 481 then
		triggerEvent('Intro3', 'Duxorethey', '(Forma corrupta)')
	end
	if curStep == 930 then
		doTweenAlpha('asco', 'camHUD', 0, 2, 'smootherStepOut')
		for i = 0, getProperty('playerStrums.length') do
			setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
		end
		for i = 0, getProperty('unspawnNotes.length') do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
			end
		end
		for i = 0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
            end
        end
	end
end