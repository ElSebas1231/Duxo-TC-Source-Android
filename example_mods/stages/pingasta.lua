function onCreate()
	-- background shit
	makeLuaSprite('lucasta_02', 'pingasta/city_bg', -398, 0);
	setScrollFactor('lucasta_02', 0.9, 1)
	scaleObject('lucasta_02', 1.1, 1.1);
	addLuaSprite('lucasta_02', false);

	makeLuaSprite('lucasta_01', 'pingasta/escaleras_bg', -280, 0);
	scaleObject('lucasta_01', 1, 0.9);
	addLuaSprite('lucasta_01', false);

	makeLuaSprite('lucasta15_05', 'pingasta/lucasta15_001', -220, -120);
	setScrollFactor('lucasta15_05', 0.9, 0.9);
	scaleObject('lucasta15_05', 0.75, 0.75);
	addLuaSprite('lucasta15_05', false);
	
	makeLuaSprite('lucasta15_04', 'pingasta/lucasta15_04', -220, -120);
	setScrollFactor('lucasta15_04', 0.9, 0.9);
	scaleObject('lucasta15_04', 0.75, 0.75);
	addLuaSprite('lucasta15_04', false);

	makeLuaSprite('lucasta15_03', 'pingasta/lucasta15_03', -190, -120);
	setScrollFactor('lucasta15_03', 1, 1);
	scaleObject('lucasta15_03', 0.75, 0.75);
	addLuaSprite('lucasta15_03', false);

	makeLuaSprite('lucasta15_02', 'pingasta/lucasta15_02', -190, -120);
	setScrollFactor('lucasta15_02', 1, 1);
	scaleObject('lucasta15_02', 0.75, 0.75);
	addLuaSprite('lucasta15_02', false);

	makeLuaSprite('lucasta15_00', 'pingasta/lucasta15_00', -220, -120);
	setScrollFactor('lucasta15_00', 0.9, 0.9);
	scaleObject('lucasta15_00', 0.75, 0.75);
	addLuaSprite('lucasta15_00', true);

	setProperty('lucasta_02.visible', false);
	setProperty('lucasta_01.visible', false);
	setProperty('lucasta15_05.visible', true);
	setProperty('lucasta15_04.visible', true);
	setProperty('lucasta15_03.visible', true);
	setProperty('lucasta15_02.visible', true);
	setProperty('lucasta15_00.visible', true);

	if lowQuality then
		removeLuaSprite('lucasta15_00')
		removeLuaSprite('lucasta15_04')
	end
end

local shaderName = "chromaticAbberation"
function onCreatePost()
	if shadersEnabled then
    	initLuaShader(shaderName)

    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)
    	setSpriteShader("temporaryShader", shaderName)

    	setShaderInt("temporaryShader", "amount", 3)
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		if value1 == 'changebgl' then
			setProperty('lucasta_02.visible', true);
			setProperty('lucasta_01.visible', true);
			setProperty('lucasta15_05.visible', false);
			setProperty('lucasta15_04.visible', false);
			setProperty('lucasta15_03.visible', false);
			setProperty('lucasta15_02.visible', false);
			setProperty('lucasta15_00.visible', false);
			cameraFlash('hud', 'b61fbf', 0.5)
			setCharacterX('dad', 100)

			if shadersEnabled then
				addHaxeLibrary("ShaderFilter", "openfl.filters")
            	runHaxeCode([[
                	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
                	game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
                	game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            	]])
			end
		end

		if value1 == 'changebgn' then
			setProperty('lucasta_02.visible', false);
			setProperty('lucasta_01.visible', false);
			setProperty('lucasta15_05.visible', true);
			setProperty('lucasta15_04.visible', true);
			setProperty('lucasta15_03.visible', true);
			setProperty('lucasta15_02.visible', true);
			setProperty('lucasta15_00.visible', true);
			cameraFlash('hud', 'ffffff', 0.5)
			setCharacterY('dad', 140)
			setCharacterX('dad', 200)
			if shadersEnabled then
				setShaderInt("temporaryShader", "amount", 0)
			end
		end
	end
end