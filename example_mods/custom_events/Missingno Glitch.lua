local shaderName = "glitch"
function onCreate()
    if shadersEnabled then
        shaderCoordFix() 
        runHaxeCode([[
            var shaderName = "]] .. shaderName .. [[";

            game.initLuaShader(shaderName);
            
            shader0 = game.createRuntimeShader(shaderName);
            game.camGame.setFilters([new ShaderFilter(shader0)]);
        ]])
    end
end

local glitching = false
function onUpdate()
    songi = getPropertyFromClass('Conductor', 'songPosition')
    if glitching then
        runHaxeCode([[
            shader0.setFloat("time", ]] .. (songi / 1000) .. [[);
            shader0.setFloat("prob", ]] .. "0.25" .. [[);
        ]])
    end
end

function onEvent(name,value1,value2)
    if name == 'Missingno Glitch' then
        if value1 == '' then
            runHaxeCode([[
                shader0.setFloat("prob", ]] .. getRandomFloat(0.10,0.50) .. [[);
                shader0.setFloat("time", ]] .. songi .. [[);
            ]])
        end
    end

    if string.lower(value1) == 'glitching' then
        string.lower(value2) == 'on' then
            glitching = true
        elseif string.lower(value2) == 'off' then
            glitching = false
            runHaxeCode([[
                shader0.setFloat("prob", ]] .. "0" .. [[);
            ]])
        end
    end
    
    if string.lower(value1) == 'chromatic' then
        runHaxeCode([[
            shader0.setFloat("intensityChromatic", ]] .. tonumber(value2) .. [[);
        ]])
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