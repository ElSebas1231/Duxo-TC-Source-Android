function onCreate()
	-- background shit
	makeLuaSprite('expurgation', 'tiky/expurgation', -450, 160);
	setLuaSpriteScrollFactor('expurgation', 1, 1);
	scaleObject('expurgation', 1.3, 1.4);
	addLuaSprite('expurgation', false);

	makeAnimatedLuaSprite('andreh_amarrado', 'tiky/andreh_amarrado', 50, 540);
	scaleObject('andreh_amarrado', 0.8, 0.8);
	addLuaSprite('andreh_amarrado', false);
	addAnimationByPrefix('andreh_amarrado', 'idle', 'yo que se instancia', 24, false);
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		playAnim('andreh_amarrado', 'idle')
	end
end

function onStepHit()
	if curStep % 2 == 0 then
		playAnim('andreh_amarrado', 'idle')
	end
end