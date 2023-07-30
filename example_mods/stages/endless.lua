function onCreate()
	-- background shit
	makeLuaSprite('Endlessfondo3', 'endless/Endlessfondo3', -320, -320);
	setLuaSpriteScrollFactor('Endlessfondo3', 0.9, 0.9);
	addLuaSprite('Endlessfondo3', false);

	makeLuaSprite('Endlessfondo2', 'endless/Endlessfondo2', -400, -50);
	setLuaSpriteScrollFactor('Endlessfondo2', 0.9, 0.9);
	addLuaSprite('Endlessfondo2', false);

	makeLuaSprite('Endlessfondo4','endless/Endlessfondo4', -340, -350)
    addLuaSprite('Endlessfondo4',false)
	setLuaSpriteScrollFactor('Endlessfondo4', 0.9, 0.9) 

	makeLuaSprite('Endlessfondo1', 'endless/Endlessfondo1', -340, 200);
	setLuaSpriteScrollFactor('Endlessfondo1', 1, 1);
	addLuaSprite('Endlessfondo1', false);

	makeLuaSprite('Endlessfondo5','endless/Endlessfondo5', 0, -350)
    addLuaSprite('Endlessfondo5',false)
	setLuaSpriteScrollFactor('Endlessfondo5', 0.9, 0.9) 

	makeLuaSprite('Endlessfondo0', 'endless/Endlessfondo0', -550, 350);
	setLuaSpriteScrollFactor('Endlessfondo0', 1, 1);
	addLuaSprite('Endlessfondo0', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end