function onEvent(n, v1, v2)
    if n == 'Change Icon' then
        if v1 == 'andreh' then
			setHealthBarColors('eb025f', rgbToHex(getProperty('boyfriend.healthColorArray')))
			runHaxeCode([[
				game.iconP2.changeIcon('icon-andreh');
			]])
        elseif v1 == 'creisi' then
			setHealthBarColors('5e2852', rgbToHex(getProperty('boyfriend.healthColorArray')))
			runHaxeCode([[
				game.iconP2.changeIcon('icon-creisi');
			]])
        elseif v1 == 'duo' then
			setHealthBarColors('eb025f', rgbToHex(getProperty('boyfriend.healthColorArray')))
			runHaxeCode([[
				game.iconP2.changeIcon('icon-explotadorychuletas');
			]])
        end
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end