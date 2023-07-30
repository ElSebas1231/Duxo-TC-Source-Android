local t = 0
local s = 0

local rings = 0
local ringIndex = 0
local ringSpeed = 0
local initRingWidth = 0
local cur = 0
local ringFlashIndex = 0
local allowCountdown = false

function onStartCountdown()
    if not allowCountdown then
        runTimer('startText', 0.1);
        allowCountdown = true
        startCountdown();
        return Function_Stop
    end
    return function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('blackscreen', 'blackscreen', 0, 0);
		setObjectCamera('blackscreen', 'hud');
		addLuaSprite('blackscreen', true);
		makeLuaSprite('circle', 'CircleTripleTrouble', 777, 0);
		setObjectCamera('circle', 'hud');
		addLuaSprite('circle', true);
		makeLuaSprite('text', 'TextTripleTrouble', -1100, 0);
		setObjectCamera('text', 'hud');
		addLuaSprite('text', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
		runTimer('sonic1', 3,1);
	elseif tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.2, 'linear');
		doTweenX('texttween', 'text', 0, 0.2, 'linear');
	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	elseif tag == 'sonic1' then
		doTweenAlpha('circlefade', 'circle', 0, 2, 'linear');
		doTweenAlpha('textfade', 'text', 0, 2, 'linear');
		doTweenX('circletween', 'circle', 2000, 0.5, 'linear');
		doTweenX('texttween', 'text', -2000, 0.5, 'linear');
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Rings Note' then
    rings = rings + 1
    end
end

function noteMiss(id, data, type, SustainNote)
    if not SustainNote then
        if data == 2 then
            setProperty('songMisses', getProperty('songMisses') - 1)
        else
            if rings > 0 then
                rings = rings - 1
                setProperty('songMisses', getProperty('songMisses') - 1)
                playSound('sonic-hurt', 0.5)
            end
        end
    end
end

function onCreate()
    makeLuaSprite('ring', 'Counter', screenWidth * 0.9 - 10, screenHeight * 0.8)
    setGraphicSize('ring', 120)
    setProperty('ring.visible', false)
    addLuaSprite('ring', true)
    setObjectCamera('ring', 'other')
    initRingWidth = getProperty('ring.width')

    if not downscroll then
        setProperty('ring.y', screenHeight * 0.8 + 40)
    else
        setProperty('ring.y', screenHeight * 0.1 - 60)
    end

    makeLuaText('rings', 'Rings: '..rings, 0, 0, 0)
    setTextSize('rings', 62)
    setTextBorder('rings', 2, 'cc6600')
    setTextColor('rings', 'ffcc33')
    setTextAlignment('rings', 'center')
    setTextFont('rings', 'sonic4.ttf')
    addLuaText('rings')
    setProperty('rings.visible', false)
    setObjectCamera('rings', 'other')

    setProperty('rings.x', getProperty('ring.x') + 60)
    setProperty('rings.y', getProperty('ring.y') - 3)
end

function onCreatePost()
    setProperty('timeBar.color',getColorFromHex('2e292d'))
end

function onSongStart()
    doTweenZoom('camTween', 'camGame', 1, 1, 'circOut')
end

function onUpdate(elapsed)
    setTextString('rings', ''..rings)

    if rings < 0 then
        rings = 0
    end

    if rings > 9 then
        setProperty('rings.x', getProperty('ring.x') + 40)
    else
        setProperty('rings.x', getProperty('ring.x') + 80)
    end

    setProperty('introSoundsSuffix', 'nada')

    ringIndex = ringIndex + elapsed
    ringSpeed = getPropertyFromClass('Conductor', 'stepCrochet') / 100 * 8
    ringFlashIndex = ringFlashIndex + elapsed
    cur = math.sin(ringIndex * ringSpeed) * initRingWidth
end

function onStepHit()
    if curStep == 16 then
        setProperty('rings.visible', true)
        setProperty('ring.visible', true)
    end
    if curStep == 1040 then
        setProperty('timeBar.color',getColorFromHex('ae3895'))
    end
        if curStep == 1295 then
        setProperty('timeBar.color',getColorFromHex('a65f00'))
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
            setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
        end
    end
    if curStep == 2318 then
        setProperty('timeBar.color',getColorFromHex('ae3895'))
    end
    if curStep == 2832 then
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i])
            setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i])
        end
    end
    if curStep == 2830 then
        setProperty('timeBar.color',getColorFromHex('362852'))
    end
    if curStep == 4110 then
        setProperty('timeBar.color',getColorFromHex('ae3895'))
    end
end