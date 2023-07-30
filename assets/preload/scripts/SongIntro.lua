-- [Script made by Sir Top Hat] --
-- [Modified by ElSebas1231 for FNF X DUXO: Complete Trilogy]

--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroTagColor = '7300ff' --Color of the tag at the end of the box.
IntroColorWhite = 'ffffff' -- Color White lmao
IntroColor3 = '18172e' -- Color of curruption cameo.
IntroTagWidth = 15	--Width of the box's tag thingy.

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', nil, -305-IntroTagWidth, 215)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 130, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', nil, -305-IntroTagWidth, 215)
	makeGraphic('JukeBox', 300, 130, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)

	--logo of FNF x Duxo
	makeLuaSprite('logo', 'logo x duxo', -305-IntroTagWidth, 215)
	setObjectCamera('logo', 'other')
	addLuaSprite('logo', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 260)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	setTextFont('JukeBoxText', 'Dimbo Italic.ttf')
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth, 230)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextFont('JukeBoxSubText', 'Dimbo Italic.ttf')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')
end

--motion functions
function onEvent(n,v,b)
	if n == 'Intro' then
		setTextString('JukeBoxSubText',v)
		setTextString('JukeBoxText',b)
		setTextColor('JukeBoxSubText', getIconColor('dad'))
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		doTweenX('MoveInFive', 'logo', 60, 1, 'CircInOut')

		runTimer('JukeBoxWait', 3, 1)
	end
	if n == 'Intro2' then
		setTextString('JukeBoxSubText',v)
		setTextString('JukeBoxText',b)
		setTextColor('JukeBoxSubText', IntroColorWhite)
		setTextColor('JukeBoxText', getIconColor('dad'))
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		doTweenX('MoveInFive', 'logo', 60, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
	if n == 'Intro3' then
		setTextString('JukeBoxSubText',v)
		setTextString('JukeBoxText',b)
		setTextColor('JukeBoxSubText', IntroColor3)
		setTextColor('JukeBoxText', getIconColor('dad'))
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		doTweenX('MoveInFive', 'logo', 60, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
	if n == 'IntroC' then
		setTextString('JukeBoxSubText',v)
		setTextString('JukeBoxText',b)
		setTextColor('JukeBoxSubText', '5e2852')
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		doTweenX('MoveInFive', 'logo', 60, 1, 'CircInOut')

		runTimer('JukeBoxWait', 3, 1)
	end
	if n == 'IntroA' then
		setTextString('JukeBoxSubText',v)
		setTextString('JukeBoxText',b)
		setTextColor('JukeBoxSubText', IntroColorWhite)
		setTextColor('JukeBoxText', 'eb025f')
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		doTweenX('MoveInFive', 'logo', 60, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'logo',  -450, 1.5, 'CircInOut')
	end
end

function getIconColor(chr)
	local chr = chr or "dad"
	return rgbToHex(getProperty(chr .. ".healthColorArray"))
end

-- Custom Functions
function rgbToHex(rgb) -- https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
	return string.format("%02x%02x%02x", math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end -- color stuffs not by cherry anymore idr who tho