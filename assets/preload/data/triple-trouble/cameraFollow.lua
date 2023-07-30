local xx = 450;
local yy = 450;
local xx2 = 700;
local yy2 = 550;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()
    if dadName == 'AquinoEXE' then
        xx = 600
		yy = 500
	end
    if dadName == 'C3joFlip' then
        xx = 850
        yy = 550
    end
    if dadName == 'AquinoEXEFlip' then
        xx = 950
        yy = 500
    end
    if dadName == 'CreisiEggMan' then
        xx = 450
        yy = 450
    end
    if boyfriendName == 'duxoFlip' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'duxoFlip')
        xx2 = 500
        yy2 = 550
    end
    if boyfriendName == 'bfTT' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead')
        xx2 = 700;
        yy2 = 550;
    end
    if boyfriendName == 'bfTT2' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'enano-dead')
        xx2 = 500
        yy2 = 550
    end
    if boyfriendName == 'bf_2_flipped' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead')
        xx2 = 750
        yy2 = 500
    end
    if boyfriendName == 'bf_2' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'enano-dead')
        xx2 = 650
        yy2 = 500
    end
    if boyfriendName == 'duxoWHEN' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'duxoFlip')
        xx2 = 700
        yy2 = 500
    end
    if boyfriendName == 'duxoWHENFlip' then
        xx2 = 800
        yy2 = 500
    end
    if boyfriendName == 'duxoEmotes2' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf')
        yy2 = 550
        xx2 = 800
    end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end