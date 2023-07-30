function onCreate()
	makeLuaSprite('nemox', 'newnemo/nemox', -600, -40);
	setLuaSpriteScrollFactor('nemox', 1, 1);
	scaleObject('nemox', 1, 1);
	addLuaSprite('nemox', false);

	makeLuaSprite('week_13', 'newnemo/week_13', -425, 130);
	setLuaSpriteScrollFactor('week_13', 1, 1);
	scaleObject('week_13', 0.9, 0.9);
	addLuaSprite('week_13', false);

	setProperty('nemox.visible', false)

	if not lowQuality then
    	makeLuaSprite('nemo1', 'newnemo/nemo1', -600, -40);
		setLuaSpriteScrollFactor('nemo1', 1, 1);
		scaleObject('nemo1', 1, 1);
		addLuaSprite('nemo1', false);

		makeLuaSprite('nemo2', 'newnemo/nemo2', -600, -40);
		setLuaSpriteScrollFactor('nemo2', 1, 1);
		scaleObject('nemo2', 1, 1);
		addLuaSprite('nemo2', false);

		makeLuaSprite('nemo3', 'newnemo/nemo3', -600, -80);
		setLuaSpriteScrollFactor('nemo3', 1, 1);
		scaleObject('nemo3', 1, 1);
		addLuaSprite('nemo3', false);
		setProperty('nemo1.visible', false)
		setProperty('nemo2.visible', false)
		setProperty('nemo3.visible', false)
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		if value1 == 'changebg' and not lowQuality then
			setProperty('week_13.visible', false);
			setProperty('nemo1.visible', true);
			setProperty('nemo2.visible', true);
			setProperty('nemo3.visible', true);
		elseif value1 == 'changebg' and lowQuality then
			setProperty('week_13.visible', false);
			setProperty('nemox.visible', true);
		end
		if value1 == 'changebgnormal' and not lowQuality then
			setProperty('week_13.visible', true);
			setProperty('nemo1.visible', false);
			setProperty('nemo2.visible', false);
			setProperty('nemo3.visible', false);
		elseif value1 == 'changebgnormal' and lowQuality then
			setProperty('week_13.visible', true);
			setProperty('nemox.visible', false);
		end
	end
end