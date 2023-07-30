Chromacrap = 2;

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)
    return from+(to-from)*i 
end

function setChrome(chromeOffset)
    if shadersEnabled then
        setShaderInt("temporaryShader", "amount", chromeOffset);
    end
end

function opponentNoteHit()
    if shadersEnabled then
        Chromacrap = Chromacrap + 3
    end
end

function noteMiss()
    if shadersEnabled then
        Chromacrap = Chromacrap + 2
    end
end

local shaderName = 'chromaticAbberation'
function onCreatePost()
	if shadersEnabled then
    	initLuaShader(shaderName)

    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)
    	setSpriteShader("temporaryShader", shaderName)

    	addHaxeLibrary("ShaderFilter", "openfl.filters")
    	runHaxeCode([[
        	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        	game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        	game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    	]])
    end
end

function onUpdate(elapsed)
    if shadersEnabled then
        Chromacrap = math.lerp(Chromacrap, 0, boundTo(elapsed * 20, 0, 1))
        setChrome(Chromacrap)
    end
end