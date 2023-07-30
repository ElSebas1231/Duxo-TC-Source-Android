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

local glitchi = {
	[1081] = 1081, [1083] = 1083, [1085] = 1085, [1087] = 1087, [1172] = 1172, [1177] = 1177, [1179] = 1179, 
    [1208] = 1208, [1210] = 1210, [1213] = 1213, [1215] = 1215, [1401] = 1401, [1403] = 1403, [1405] = 1405,
    [1407] = 1407, [1549] = 1549, [1552] = 1552, [1593] = 1593, [1595] = 1595, [1597] = 1597, [1599] = 1599, 
    [2057] = 2057, [2059] = 2059, [2060] = 2060, [2061] = 2061, [2062] = 2062, [2063] = 2063, [2064] = 2064,
}

function onStepHit()
    songi = getPropertyFromClass('Conductor', 'songPosition')
    if shadersEnabled then
        if curStep == glitchi[curStep] then
            runHaxeCode([[
                shader0.setFloat("prob", ]] .. getRandomFloat(0.10,0.50) .. [[);
                shader0.setFloat("time", ]] .. songi .. [[);
            ]])
        end
    end
    if curStep <= 127 then
        runHaxeCode([[
            shader0.setFloat("prob", ]] .. getRandomFloat(0.01,0.05) .. [[);
            shader0.setFloat("time", ]] .. songi .. [[);
        ]])
    elseif curStep <= 241 then
        runHaxeCode([[
            shader0.setFloat("prob", ]] .. getRandomFloat(0.01,0.10) .. [[);
            shader0.setFloat("time", ]] .. songi .. [[);
        ]])
    elseif curStep <= 1080 then
        runHaxeCode([[
            shader0.setFloat("prob", "0");
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