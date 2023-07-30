local shaderName = "glitch"
function onCreate()
	-- background shit
    makeLuaSprite('realbg', 'missingcat/bg', -980, -300);
    setScrollFactor('realbg', 0.9, 0.9);
    scaleObject('realbg', 8.05, 8.05);
    addLuaSprite('realbg', false);

    makeAnimatedLuaSprite('bg', 'missingcat/BG_Assets', -970, -300);
	setScrollFactor('bg', 0.9, 0.9);
    scaleObject('bg', 8.05, 8.05);
    addLuaSprite('bg', false);
    addAnimationByPrefix('bg', 'idle', 'Bg Ocean', 26, true)
    
    makeAnimatedLuaSprite('ground', 'missingcat/BG_Assets', -985, -295);
    scaleObject('ground', 8.05, 8.05);
    addLuaSprite('ground', false)
    addAnimationByPrefix('ground', 'idle', 'Bg Wave', 26, true)

    makeAnimatedLuaSprite("bgshadown't", "missingcat/noshadow", -970, -300);
	setScrollFactor("bgshadown't", 0.9, 0.9);
    scaleObject("bgshadown't", 8.05, 8.05);
    addLuaSprite("bgshadown't", false);
    addAnimationByPrefix("bgshadown't", "idle", "Bg Ocean", 26, true)

    makeAnimatedLuaSprite("groundshadown't", "missingcat/noshadow", -985, -295);
    scaleObject("groundshadown't", 8.05, 8.05);
    addLuaSprite("groundshadown't", false)
    addAnimationByPrefix("groundshadown't", "idle", "Bg Wave", 26, true)

    setProperty('bg.visible',false)
    setProperty('ground.visible',false)
end

function onCreatePost()
    setProperty('dad.alpha', 0)
    setProperty('iconP2.alpha',0)
    setHealthBarColors('7300ff', '7300ff')
end

function onUpdatePost()
    if songName == 'Maussigno' then
	    if curStep == 241 then
            setProperty('bg.visible',true)
            setProperty('ground.visible',true)
            setProperty("bgshadown't.visible",false)
            setProperty("groundshadown't.visible",false)
        end
	end
end