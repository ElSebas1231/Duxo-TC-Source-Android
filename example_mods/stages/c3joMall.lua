function onCreate()
    makeLuaSprite('bg', 'c3jo/mall_bg', -500, -310)
    scaleObject('bg', 0.9, 0.9)
    setScrollFactor('bg', 0.5, 0.5)
    addLuaSprite('bg')

    makeAnimatedLuaSprite('gente', 'c3jo/bg_persons', -500, 130)
    scaleObject('gente', 2, 2)
    setScrollFactor('gente', 0.8, 1)
    addLuaSprite('gente', false)
    addAnimationByPrefix('gente', 'idle', 'coso  instancia', 24, false);
end

function onCountdownTick(counter)
    if counter == 1 then
        objectPlayAnimation('gente','idle',true)
        end
    if counter == 4 then
        objectPlayAnimation('gente','idle',true)
        objectPlayAnimation('wallop','idle',true)
    end
end

function onBeatHit()
    if getProperty('curBeat') % 2 == 0 then
        playAnim('gente','idle',true)
    end
end