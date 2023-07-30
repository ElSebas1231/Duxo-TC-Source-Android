function onCreate()
	--background boi
	makeLuaSprite('nat0', 'week17/nat0', -300, 200);
	setLuaSpriteScrollFactor('nat0', 1, 1);
	scaleObject('nat0', 0.9, 0.9);
	addLuaSprite('nat0', false);

	if not lowQuality then
    	makeAnimatedLuaSprite('BlueDepreySuNovia', 'week17/BlueDepreySuNovia', -330, 200);
		setLuaSpriteScrollFactor('nat0', 1, 1);
		scaleObject('BlueDepreySuNovia', 0.9, 0.9);
		addLuaSprite('BlueDepreySuNovia', false);
		addAnimationByPrefix('BlueDepreySuNovia', 'dance', 'Boping', 24, false);
		objectPlayAnimation('BluedepreySuNovia', 'dance')
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		if value1 == 'changebg' then
			setProperty('nat0.visible', false);
			setProperty('BlueDepreySuNovia.visible', false);
			setProperty('nemo2.visible', false);
			setProperty('nemo3.visible', false);
		end
		if value1 == 'changebgnormal' then
			setProperty('nat0.visible', true);
			setProperty('BlueDepreySuNovia.visible', true);
			setProperty('nemo2.visible', false);
			setProperty('nemo3.visible', false);
		end
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		playAnim('BlueDepreySuNovia', 'dance')
	end
end

function onStepHit()
	if curStep % 2 == 0 then
		playAnim('BlueDepreySuNovia', 'dance')
	end
end