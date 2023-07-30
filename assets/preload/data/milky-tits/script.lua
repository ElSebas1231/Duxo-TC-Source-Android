-- OMG!!! DADBATTLE LIGHTS IN LUA?!?!? NO WAY
-- Also, created by ElSebas1231, obviously you don't have to credit this

function onCreatePost()
	makeLuaSprite('blackbg', '', screenWidth * -0.5, screenHeight * -0.5)
	makeGraphic('blackbg', screenWidth * 2, screenHeight * 2, '000000')
	setScrollFactor('blackbg', 0)
    setProperty('blackbg.alpha', 0)
	addLuaSprite('blackbg', true)
	
    makeLuaSprite('light', 'spotlight', 400, 200)
    setProperty('light.alpha', 0)
    setBlendMode('light', 'add')
    addLuaSprite('light', true)
end

function onStepHit()
    if curStep == 1072 then
        doTweenAlpha('blackbg', 'blackbg', 0.42, 2, 'quadInOut')
        setProperty('light.x', getMidpointX('dadGroup') - getProperty('light.width') / 1.9)
        doTweenAlpha('light', 'light', 0.375, 1.5, 'quadInOut')
        doTweenAlpha('final01', 'final01', 0, 1.5, 'quadInOut')
    end
    if curStep == 1311 then
        doTweenAlpha('light', 'light', 0, 1.49, 'elasticInOut')
    end
    if curStep == 1328 then
        setProperty('light.x', getMidpointX('boyfriendGroup') - getProperty('light.width') / 2)
    end
    if curStep == 1329 then
        doTweenAlpha('light', 'light', 0.375, 1.37, 'quadInOut')
    end
    if curStep == 1584 then
        doTweenAlpha('blackbg', 'blackbg', 0, 1.5, 'elasticInOut')
        doTweenAlpha('light', 'light', 0, 1.5, 'elasticInOut')
        doTweenAlpha('final01', 'final01', 1, 1.5, 'quadInOut')
    end
end