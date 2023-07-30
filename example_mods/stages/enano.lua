function onCreate()
	-- background shit
	makeLuaSprite('enano_01', 'enano/enano_0', -390, -10);
	setLuaSpriteScrollFactor('enano_01', 1, 1);
	scaleObject('enano_01', 1.1, 1.1);
	
	makeLuaSprite('enano_1', 'enano/enano_1', -390, -10);
	setLuaSpriteScrollFactor('enano_1', 1, 1);
	scaleObject('enano_1', 1.1, 1.1);

	addLuaSprite('enano_01', false);
	addLuaSprite('enano_1', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end