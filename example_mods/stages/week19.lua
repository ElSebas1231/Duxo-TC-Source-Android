function onCreate()
	-- background shit
	makeLuaSprite('aquino19_00', 'week19/aquino19_00', -340, 50);
	setLuaSpriteScrollFactor('aquino19_00', 0.9, 0.9);
	scaleObject('aquino19_00', 0.8, 0.74);
	addLuaSprite('aquino19_00', false);

	makeLuaSprite('aquino19_01', 'week19/aquino19_01', -340, 80);
	setLuaSpriteScrollFactor('aquino19_01', 0.9, 0.9);
	scaleObject('aquino19_01', 0.8, 0.74);
	addLuaSprite('aquino19_01', false);

	makeLuaSprite('aquino19_02', 'week19/aquino19_02', -340, 80);
	setLuaSpriteScrollFactor('aquino19_02', 1, 1);
	scaleObject('aquino19_02', 0.8, 0.74);
	addLuaSprite('aquino19_02', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end