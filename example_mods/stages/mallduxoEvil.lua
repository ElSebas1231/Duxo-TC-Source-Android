function onCreate()
    makeLuaSprite('bg', 'mallduxo/BGC_evil', -550, -500)
    setScrollFactor('bg', 0.2, 0.2)
    addLuaSprite('bg')

    makeLuaSprite('snow', 'mallduxo/evilSnow', -400, 700)
    addLuaSprite('snow')
    
    makeLuaSprite('lay', 'mallduxo/BGC2', 0, 0)
    setObjectCamera('lay', 'hud')
    addLuaSprite('lay')
end