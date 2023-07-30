function onEvent(name, value1, value2)
    if name == 'Estatica' then
        makeAnimatedLuaSprite('image', value1, 490, 275)
        addAnimationByPrefix('image', 'image', value2, 24, false)
        addLuaSprite('image', true)
        setProperty('image.scale.x', getProperty('image.scale.x')+2.5)
        setProperty('image.scale.y', getProperty('image.scale.y')+2.5)
        objectPlayAnimation('image', 'image')
        doTweenColor('hello', 'image', 'FFFFFFFF', 0.1, 'quartIn')
        setObjectCamera('image', 'other')
        runTimer('wait', 1.60)
    end
function onTimerCompleted(tag, loops, loopsleft)
        if tag == 'wait' then
        doTweenAlpha('byebye', 'image',0,0.1, 'linear');
        end
    end
function onTweenCompleted(tag)
        if tag == 'byebye' then
        removeLuaSprite('image', true);
        end
    end
end