local shaderName = "demon_blur"
function onCreatePost()
	if shadersEnabled then
        shaderCoordFix()

    	initLuaShader(shaderName)

    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)
    	setSpriteShader("temporaryShader", shaderName)

    	addHaxeLibrary("ShaderFilter", "openfl.filters")
    	runHaxeCode([[
        	game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    	]])

    	setShaderFloat("temporaryShader", "u_size", 1)
    	setShaderFloat("temporaryShader", "u_alpha", 1)
	end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end