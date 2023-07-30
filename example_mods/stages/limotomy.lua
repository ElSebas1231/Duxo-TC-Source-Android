function onCreate()
    makeLuaSprite('limotomy', 'tommy/limoSunset', -280 , -200);
    setScrollFactor('limotomy', 0.1, 0.1)
    addLuaSprite('limotomy', false);

    setProperty("defaultCamZoom", 0.9)

    if not lowQuality then
        makeLuaSprite('circo', 'tommy/BGCircus', 400, -20)
        setScrollFactor('circo', 0.2, 0.2)
        addLuaSprite('circo',false)

        makeLuaSprite('bg', 'tommy/BgStreet', -280 , -500);
        setScrollFactor('bg', 0.1, 0.1)
        addLuaSprite('bg', false);
    
        makeAnimatedLuaSprite('road', 'tommy/Mom_Road', -400, 680)
        scaleObject('road', 2, 1)
        addLuaSprite('road', false)
        addAnimationByPrefix('road', 'idle', 'ROAD', 20, true)
        
		makeAnimatedLuaSprite('limo1', 'tommy/bgLimo', -210, 390);
		addAnimationByPrefix('limo1', 'background limo pink', 'background limo pink', 24, true);
		setScrollFactor('limo1', 0.4, 0.4);
		addLuaSprite('limo1', false);

        makeAnimatedLuaSprite('dancer1', 'tommy/limoDancer', 150, -10)
        setScrollFactor('dancer1', 0.4, 0.4)
        addLuaSprite('dancer1', false)
        addAnimationByIndices('dancer1', 'danceLeft', 'bg dancer sketch PINK',"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15", 24); 
	    addAnimationByIndices('dancer1', 'danceRight', 'bg dancer sketch PINK',"16,17,18,19,20,21,22,23,24,25,26,27,28,29", 24); 

        makeAnimatedLuaSprite('dancer2', 'tommy/limoDancer', getProperty('dancer1.x')+400, getProperty('dancer1.y'))
        setScrollFactor('dancer2', 0.4, 0.4)
        addLuaSprite('dancer2', false)
        addAnimationByIndices('dancer2', 'danceLeft', 'bg dancer sketch PINK',"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15", 24); 
	    addAnimationByIndices('dancer2', 'danceRight', 'bg dancer sketch PINK',"16,17,18,19,20,21,22,23,24,25,26,27,28,29", 24); 

        makeAnimatedLuaSprite('dancer3', 'tommy/limoDancer', getProperty('dancer2.x')+400, getProperty('dancer2.y'))
        setScrollFactor('dancer3', 0.4, 0.4)
        addLuaSprite('dancer3', false)
        addAnimationByIndices('dancer3', 'danceLeft', 'bg dancer sketch PINK',"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15", 24); 
	    addAnimationByIndices('dancer3', 'danceRight', 'bg dancer sketch PINK',"16,17,18,19,20,21,22,23,24,25,26,27,28,29", 24); 

        makeAnimatedLuaSprite('dancer4', 'tommy/limoDancer', getProperty('dancer3.x')+400, getProperty('dancer3.y'))
        setScrollFactor('dancer4', 0.4, 0.4)
        addAnimationByIndices('dancer4', 'danceLeft', 'bg dancer sketch PINK',"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15", 24); 
	    addAnimationByIndices('dancer4', 'danceRight', 'bg dancer sketch PINK',"16,17,18,19,20,21,22,23,24,25,26,27,28,29", 24); 
        addLuaSprite('dancer4', false)

        makeLuaSprite('fastCar', 'tommy/fastCarLol', -300, -160);
        addLuaSprite('fastCar', false);
        resetFastCar();

        setProperty('circo.y', -50)
        setProperty("defaultCamZoom", 0.8)
    end

    makeAnimatedLuaSprite('limo2', 'tommy/limoDrive', -120, 550);
	addAnimationByPrefix('limo2', 'idle', 'Limo stage', 24, true);

    setObjectOrder('limo2', getObjectOrder('gfGroup') + 1)
end

function onBeatHit()
    if curBeat % 1 == 0 then
        playAnim('dancer1', 'danceLeft')
        playAnim('dancer2', 'danceLeft')
        playAnim('dancer3', 'danceLeft')
        playAnim('dancer4', 'danceLeft')
    end
    if curBeat % 2 == 0 then
        playAnim('dancer1', 'danceRight')
        playAnim('dancer2', 'danceRight')
        playAnim('dancer3', 'danceRight')
        playAnim('dancer4', 'danceRight')
    end
    if getRandomBool(10) and fastCarCanDrive and not lowQuality then
		fastCarDrive();
	end
end

function onCountdownTick(counter)
    if counter % 1 == 0 then
        playAnim('dancer1', 'danceLeft')
        playAnim('dancer2', 'danceLeft')
        playAnim('dancer3', 'danceLeft')
        playAnim('dancer4', 'danceLeft')
    end
    if counter % 2 == 0 then
        playAnim('dancer1', 'danceRight')
        playAnim('dancer2', 'danceRight')
        playAnim('dancer3', 'danceRight')
        playAnim('dancer4', 'danceRight')
    end
end

fastCarCanDrive = true;
function resetFastCar()
	setProperty('fastCar.x', -12600);
	setProperty('fastCar.y', getRandomInt(140, 250));
	setProperty('fastCar.velocity.x', 0);
	fastCarCanDrive = true;
end

function fastCarDrive()
	playSound('carPass'..getRandomInt(0, 1), 0.7);
	setProperty('fastCar.velocity.x', (getRandomInt(170, 220) / (1 / framerate)) * 3);
	runTimer('reset car timer', 2);
	fastCarCanDrive = false;
end

function onPause()
    pauseSound('car')
end

function onResume()
    resumeSound('car')
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'reset car timer' then
		resetFastCar();
	end
end