function onCreatePost()
    shader = 'snowfall'
    initLuaShader(shader)

    makeLuaSprite("temporaryShader")
    makeGraphic("temporaryShader", screenWidth, screenHeight)
    setSpriteShader("temporaryShader", shader)

    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    ]])

    setShaderFloat("temporaryShader", "intensity", 0.25)
    setShaderInt("temporaryShader", "amount", 25)
end

function onUpdatePost()
    songPos = getPropertyFromClass('Conductor', 'songPosition')
    sCrochet = getPropertyFromClass('Conductor', 'stepCrochet')
    setShaderFloat("temporaryShader", "time", songPos / (sCrochet * 8))
end