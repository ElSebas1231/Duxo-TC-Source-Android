bob = 0
function onCreate()
	setProperty('camHUD.visible',false)
end

function onCreatePost()
	setProperty('boyfriend.alpha', 0);
	setProperty('aquinochiquito.alpha', 0);
end


function onStartCountdown()
	runTimer('songg',3)
	if bob == 0 then
		bob = 1
		runTimer('appear',1)
		return Function_Stop;
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'songg' then
		startCountdown()
		setProperty('camHUD.visible',true)
	end
	if t == 'appear' then
		doTweenAlpha('alphatween', 'boyfriend', 1, 0.8, 'linear');
		playSound('sm64_warp', 1)
	end
end

local esquizo = {
	[196] = 196, [356] = 356, [422] = 422, [485] = 485, [708] = 708, [901] = 901, [965] = 965, [1029] = 1029, [1251] = 1251,
}

local frenia = {
	[316] = 316, [390] = 390, [454] = 454, [523] = 523, [828] = 828, [930] = 930, [998] = 988, [1068] = 1068, [1337] = 1337,
}

function onStepHit()
	if curStep == esquizo[curStep] then
		doTweenAlpha('esquizofrenia', 'aquinochiquito', 0.4, 0.5, 'linear')
	end
	if curStep == frenia[curStep] then
		doTweenAlpha('esquizofrenia', 'aquinochiquito', 0, 0.5, 'linear')
	end
end