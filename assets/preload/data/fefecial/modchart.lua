local normal1 = false
local normal2 = false

local lockzoom = false
local swayingsmall = false
local swayinglarge = false
local swayingbigger = false
local swayingbiggest = false

function start (song)
    hudX = getHudX()
    hudY = getHudY()
	
	BlackBG = makeSprite('BlackFade','blackbg', true)
	BlackFade = makeSprite('BlackFade','blackfade', false)
	
	setActorX(200,'blackbg')
	setActorY(500,'blackbg')
	setActorAlpha(0,'blackbg')
	setActorScale(4,'blackbg')
	
	setActorX(200,'blackfade')
	setActorY(500,'blackfade')
	setActorAlpha(0,'blackfade')
	setActorScale(4,'blackfade')
end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getHudX()
    hudY = getHudY()

	if zoom then
		setCamZoom(1.5)
	end
	
	if shakenote then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 3 * math.sin((currentBeat * 10 + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 3 * math.cos((currentBeat * 10 + i*0.25) * math.pi) + 10, i)
		end
	end
	if fuck then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 28 * math.cos((currentBeat + i*0.5) * math.pi) + 10, i)
		end
	end
	if shit then
		camHudAngle = 5 * math.cos(currentBeat)
	end
	if swayingsmall then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
		end
	end
	if krazy then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
			setActorY(defaultStrum0Y + 25 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end
	if swayingbigger then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*5) * math.pi) + 10 ,i)
		end
	end
end


function beatHit (beat)
	if beat == 80 then
		swayingbigger = true
	end
	if beat == 96 then
		swayingbigger = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
	end
	if beat == 208 then
		swayingbigger = true
	end
	if beat == 224 then
		swayingbigger = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
	end
	if beat == 289 then
		zoom = true
	end
	if beat == 304 then
		zoom = false
	end
	if beat == 321 then
		zoom = true
	end
	if beat == 336 then
		zoom = false
	end
	if beat == 384 then
		swayingbigger = true
	end
	if beat == 400 then
		swayingbigger = false
		tweenFadeIn(BlackBG,1,0.2)
		setActorAlpha(0,'girlfriend')
		showOnlyStrums = true
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
	end
	if beat == 432 then
		krazy = true
	end
	if beat == 560 then
		krazy = false
		fuck = true
		shit = true
	end
	if beat == 592 then
		fuck = false
		krazy = true
	end
	if beat == 656 then
		krazy = false
		shit = false
		camHudAngle = 0
		tweenFadeOut(BlackBG,0,0.6)
		setActorAlpha(1,'girlfriend')
		showOnlyStrums = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
	end
end

function stepHit (step)
end