function onCreate()
    makeLuaSprite('bg', 'feriapayasito/Clownso_corrupto_fondo', -250, -150);
    setLuaSpriteScrollFactor('bg', 0.9, 0.9);
    addLuaSprite('bg', false);
    
    if not lowQuality then
        makeLuaSprite('xd', '')
        makeGraphic('xd', 1280,720, '78176c')
        setObjectCamera('xd', 'hud')
        addLuaSprite('xd')
        setProperty('xd.alpha', 0.35)
    end
end

function onUpdatePost()
    if not lowQuality then
        setSpriteShader('bg','wavybu')
        setShaderFloat('bg','wavy',10)
        setShaderFloat('bg','iTime',os.clock())
    end
end

function onUpdate()
    if getProperty('xd.alpha') == 0.35 then
        doTweenAlpha('dothetweenvg', 'xd', 0, 1, 'quadInOut');
    end
end

function onTweenCompleted(tag)
    if tag == 'dothetweenvg' then
        doTweenAlpha('dothetweenvgagain', 'xd', 0.35, 1, 'quadInOut');
    end
end