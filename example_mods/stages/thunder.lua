function onCreate()
	-- background shit
	makeLuaSprite('stage', 'cuzvy/stage', -400, -80);
	setLuaSpriteScrollFactor('stage', 1, 1);
	scaleObject('stage', 0.9, 0.9);
	addLuaSprite('stage', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end