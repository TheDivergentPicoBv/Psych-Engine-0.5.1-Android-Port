--Lua Original por el DDTO TEAM Y JERE
--MUY MEJORADO POR NICKOBELIT
local camGamefiltersEnabled = false;
--local defaultCamZoom = 1.05;
--local defaultStageZoom = 1.05;
local staticlol = StaticShader;
local staticAlpha = 0;

local shake = false
local noteCam = false;
local xx = 780;
local yy = 480;
local xx2 = 820;
local yy2 = 520;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
	
function onCreate()
precacheImage('stages1/HomeStatic');
	 --setProperty('swagShader.saturation', -100);
setProperty('skipCountdown', true)
	
	 makeAnimatedLuaSprite('bakaOverlay', 'stages1/BakaBGDoodles', 0, 0)
	 addAnimationByPrefix('bakaOverlay', 'normal', 'Normal Overlay', 24, true)
	 addAnimationByPrefix('bakaOverlay', 'hueh', 'HOME Overlay', 24, false)
	 objectPlayAnimation('bakaOverlay', 'normal', true);
	 setProperty('bakaOverlay.antialiasing', getProperty('ClientPrefs', 'globalAntialiasing'))
	 scaleObject('bakaOverlay', 2, 2)
	 setProperty('bakaOverlay.alpha', 0);
	 setObjectCamera('bakaOverlay', 'other')
	 updateHitbox('bakaOverlay');
     screenCenter('bakaOverlay');
	
	 makeLuaSprite('inthenotepad', 'stages1/notepad', 0, 0)

	 makeLuaSprite('clubroom', 'stages1/DDLCbg_Saturation', -700, -520);
	 scaleObject('clubroom', 1.6, 1.6)
	 setScrollFactor('clubroom', 1, 0.9);
	 updateHitbox('clubroom')
	 addLuaSprite('clubroom', false);

	 makeLuaSprite('evilClubBG', 'stages1/BG2', -480, -250);
	 scaleObject('evilClubBG', 1.3, 1.3);

     makeLuaSprite('evilPoem', '', 0, 0);
     makeGraphic('evilPoem', 2048, 1024, 'FFFFFF')
     screenCenter('evilPoem');
     setScrollFactor('evilPoem', 0, 0);
   
	 makeLuaSprite('ruinedClubBG', 'stages1/BG1', -220,-230);
	 scaleObject('ruinedClubBG', 1.3, 1.3);

     makeLuaSprite('notepadoverlay', 'stages1/notepad_overlay', 0, 0);
	
	 makeLuaSprite('vignette', 'vignette', 0, 0);
	 setScrollFactor('vignette', 1, 1);
     setObjectCamera('vignette', 'hud')
     setProperty('vignette.alpha', 0);
	
	 makeAnimatedLuaSprite('redStatic', 'stages1/HomeStatic', 0, 0);
     addAnimationByPrefix('Static', 'anim', 'HomeStatic', 14, true)
     setObjectCamera('redStatic', 'other')
     scaleObject('redStatic', 2, 2)
	 screenCenter('redStatic');
	 setProperty('redStatic.alpha', 0);
	
	 makeLuaSprite('imdead', 'stages1/everyoneisdead', 0, 0)
	 setScrollFactor('imdead', 0, 0);
     setObjectCamera('imdead', 'other')
     setProperty('imdead.alpha', 0);

	 makeLuaSprite('darkScreen', '', 0, 0);
     makeGraphic('darkScreen', 1280, 720, '000000')
     screenCenter('darkScreen');
     setObjectCamera('darkScreen', 'other')
     addLuaSprite('darkScreen', true);
end
function onStepHit()
if curStep == 496 then
removeLuaSprite('clubroom',true);
setProperty('evilClubBG.visible',true);
end
if curStep == 1298 then
triggerEvent('Camera Follow Pos', '300', '500')
end

if curStep == 1432 then
triggerEvent('Camera Follow Pos', '800', '500')
end
if curStep == 1552 then
doTweenX('Move Opponent Tween', 'dad',350, 0.1, 'circOut')
doTweenX('Move Boyfriend Tween', 'boyfriend',550, 0.1, 'circOut')
end

if curStep == 1808 then
removeLuaSprite('evilClubBG',true);
setProperty('ruinedClubBG.visible',true);
doTweenX('Move Opponent Tween2', 'dad',200, 0.01, 'circOut')
doTweenX('Move Boyfriend Tween2', 'boyfriend',670, 0.01, 'circOut')
end

if curStep == 2064 then
setProperty('inthenotepad.visible',true);
setProperty('notepadoverlay.visible',true)
setProperty('ruinedClubBG.visible',false)
end

if curStep == 2192 then
setProperty('ruinedClubBG.visible',true);
setProperty('inthenotepad.visible',false) 
setProperty('notepadoverlay.visible',false)
end

if curStep == 2352 then
removeLuaSprite('ruinedClubBG',true);
removeLuaSprite('stageStatic',true);
setProperty('gf.alpha', 0);
	setProperty('boyfriend.alpha', 0);
end
end
function onUpdate()
   if noteCam then
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
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
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
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
end

function funnyGlitch(duration, sound)
--don't do anything if the user decided to be funny
  if (duration <= 0) then
    return;
  end

   camGamefiltersEnabled = true;
   doTweenAlpha('this', 'staticAlpha', 1, 0.5, 'circOut')

  if (sound == '') then
   playSound(sound);
  end

  runTimer('filters', duration)
end

function onTimerCompleted(tag, loops, loops)
  if tag == 'zoom1' then
    setProperty('defaultCamZoom', 1.7)
  end
  if tag == 'zoom2' then
    setProperty('defaultCamZoom', 1.35)
  end
  if tag == 'zoom3' then
    setProperty('defaultCamZoom', 1.5)
  end
  if tag == 'zoom4' then
    setProperty('defaultCamZoom', 1.7)
  end
  if tag == 'zoom5' then
    setProperty('defaultCamZoom', 1.5)
  end
  if tag == 'zoom6' then
    setProperty('defaultCamZoom', 1.3)
  end
  if tag == 'zoom7' then
    setProperty('defaultCamZoom', 1.1)
  end
  if tag == 'zoom8' then
    setProperty('defaultCamZoom', 1.3)
  end
  if tag == 'zoom9' then
    setProperty('defaultCamZoom', 1.6)
  end
  if tag == 'zoom10' then
    setProperty('defaultCamZoom', 1)
  end
  if tag == 'zoom11' then
    setProperty('defaultCamZoom', 0.8)
  end
  if tag == 'removeCats' then
    removeLuaSprite('bakaOverlay', true)
  end
  if tag == 'filters' then
    camGamefiltersEnabled = false
  end
end

function onTweenCompleted(tag)
    if tag == 'remove darkScreen' then
    removeLuaSprite('darkScreen', false)
    end
end

function opponentNoteHit(id, dir, noteType, isSustainNote)
  if shake then
    triggerEvent('Screen Shake', '0.06, 0.009', '0.06, 0.009')
  end
end

function onSongStart()
	setProperty('gf.alpha', 0);
	setProperty('boyfriend.alpha', 0);
	setProperty('dad.alpha', 0);
end

function onEvent(name, value1, value2)
    if name == 'Change Stagnant Stage' then
	--Considering all songs this should be shared
	setProperty('isCameraOnForcedPos', false);

    if value1 == 'evil' then
	setProperty('defaultCamZoom', 0.8)
	setProperty('evilSpace.velocity.x', -10)
    setProperty('evilSpace.velocity.y', 0)
    addLuaSprite('evilSpace', false);
	addLuaSprite('evilClubBG', false)
	removeLuaSprite('evilPoem', true);
	setProperty('cameraSpeed', 1.5)
	shake = false
    end

	if value1 == 'poem' then
    --setProperty('defaultCamZoom', 0.9);
	addLuaSprite('evilPoem', false);
	removeLuaSprite('closet', true)
	removeLuaSprite('clubroom', true);
	shake = false
	end

    if value1 == 'ruined' or value1 == 'ruinedclub' then
    --setProperty('defaultCamZoom', 0.8);
	addLuaSprite('stageStatic', false);
	addLuaSprite('ruinedClubBG', false);
	removeLuaSprite('inthenotepad', false)
    removeLuaSprite('notepadoverlay', false);
	removeLuaSprite('evilSpace', true);
	removeLuaSprite('evilClubBG', true);
	shake = true
	end

    if value1 == 'notepad' then
    --fates are written, cause pandora didn't listen, time will march here with me, the screams of last you'll ever see
    --I will kill you, I am marty the armidillou,the stinky smells won't deter me, I will drink all your pee
    --setProperty('defaultCamZoom', 1.0);
    --We are going to lock the camera for this event
	removeLuaSprite('ruinedClubBG', false);
	addLuaSprite('inthenotepad', false)
	addLuaSprite('notepadoverlay', false);
	setProperty('isCameraOnForcedPos', true);
	setProperty('camFollow.x', 650)
    setProperty('camFollow.y', 360)
	triggerEvent('Camera Follow Pos', '650', '360')
	setProperty('bf.x', 430);
	setProperty('bf.y', -140);
	shake = false
	end

    if value1 == 'void' then
    setProperty('defaultCamZoom', 0.9);
	removeLuaSprite('stageStatic', true);
	removeLuaSprite('vignette', true);
	removeLuaSprite('ruinedClubBG', true);
	removeLuaSprite('inthenotepad', true)
	removeLuaSprite('notepadoverlay', true);
	shake = false
	end
  end

   if name == 'remove darkScreen' then
       if (value1 == '0' and value2 == '5') then
       doTweenAlpha('remove darkScreen', 'darkScreen', 0, 5, 'linear')
       elseif (value1 == '3' and value2 == '1') then
       doTweenAlpha('remove darkScreen2', 'darkScreen', 1, 3, 'linear')
       addLuaSprite('darkScreen', true)
       end
   end

   if name == 'Glitch Effect' then
       duration = tonumber(value1);
       sound = tonumber(value2);
       funnyGlitch(duration, sound);
   end

   if name == 'Change Camera Zoom' then
		--value1 = defaultStageZoom
        --if value2 isn't a numerical value, then rely on defaultCamZoom
        --defaultCamZoom = value1;
        if (value1 == '1.7' and value2 == '5') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.7, 5, 'linear')
        runTimer('zoom1', 5)
        elseif (value1 == '1.35' and value2 == '0.1') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.35, 0.1, 'linear')
        runTimer('zoom2', 0.1)
        elseif (value1 == '1.5' and value2 == '0.1') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.5, 0.1, 'linear')
        runTimer('zoom3', 0.1)
        elseif (value1 == '1.7' and value2 == '0.1') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.7, 0.1, 'linear')
        runTimer('zoom4', 0.1)
        elseif (value1 == '1.5' and value2 == '0.2') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.5, 0.2, 'linear')
        runTimer('zoom5', 0.2)
        elseif (value1 == '1.3' and value2 == '0.4') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.3, 0.4, 'linear')
        runTimer('zoom6', 0.4)
        elseif (value1 == '1.1' and value2 == '0') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.1, 0.01, 'linear')
        runTimer('zoom7', 0.01)
        elseif (value1 == '1.3' and value2 == '0.5') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.3, 0.5, 'linear')
        runTimer('zoom8', 0.5)
        elseif (value1 == '1.6' and value2 == '0.1') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1.6, 0.1, 'linear')
        runTimer('zoom9', 0.1)
        elseif (value1 == '1' and value2 == '0.2') then
        doTweenZoom('Change Camera Zoom', 'camGame', 1, 0.2, 'linear')
        runTimer('zoom10', 0.2)
        elseif (value1 == '0.8' and value2 == '') then
        doTweenZoom('Change Camera Zoom', 'camGame', 0.8, 0.01, 'linear')
        runTimer('zoom11', 0.01)
		end
   end
   
   if name == 'Add or Remove Vignette' then
	   --Value 1 for alpha
	   --Value 2 for speed it appears
       if value1 == '0.3' and value2 == '0.1' then
	   doTweenAlpha('Add or Remove Vignette', 'vignette', 0.3, 0.1, 'linear');
	   addLuaSprite('vignette', true)
	   elseif value1 == '1' and value2 == '0.5' then
	   doTweenAlpha('Add or Remove Vignette1', 'vignette', 1, 0.5, 'linear');
	   elseif value1 == '0.4' and value2 == '0.2' then
	   doTweenAlpha('Add or Remove Vignette2', 'vignette', 0.4, 0.2, 'linear');
	   elseif value1 == '0.3' and value2 == '0' then
	   doTweenAlpha('Add or Remove Vignette3', 'vignette', 0.3, 0.01, 'linear')
	   end
   end

  if name == 'Character Visibility' then
	if value1 == 'dad' and value2 == '1,0.7' then
    doTweenAlpha('Character Visibility', 'dad', 1, 0.7, 'circOut');
    elseif value1 == 'bf' and value2 == '1,0.7' then
    doTweenAlpha('Character Visibility1', 'boyfriend', 1, 0.7, 'circOut');
    elseif value1 == 'gf' and value2 == '1,0.7' then
    doTweenAlpha('Character Visibility2', 'gf', 1, 0.7, 'circOut');
    elseif value1 == 'gf' and value2 == '0.6,1' then
   doTweenAlpha('Character Visibility2', 'gf', 0.6, 1, 'circOut');--Por Nickobelit
    elseif value1 == 'dad' and value2 == '0,0' then
    setProperty('dad.alpha', 0);
    elseif value1 == 'gf' and value2 == '0,0' then
    setProperty('gf.alpha', 0);
    elseif value1 == 'bf' and value2 == '0,0' then
    setProperty('boyfriend.alpha', 0);
    elseif value1 == 'dad' and value2 == '1,0' then
    setProperty('dad.alpha', 1);
    elseif value1 == 'bf' and value2 == '1,0' then
    setProperty('boyfriend.alpha', 1);
    elseif value1 == 'gf' and value2 == '1,0' then
    setProperty('gf.alpha', 1);
    end
  end

  if name == 'Screen in Darkness' then
    if value1 == '1' and value2 == '0.1' then
	doTweenAlpha('Screen in Darkness', 'darkoverlay', 1, 0.1, 'linear')
    elseif value1 == '0' and value2 == '0.5' then
	doTweenAlpha('Screen in Darkness', 'darkoverlay', 0, 0.5, 'linear');
    elseif value1 == '1' and value2 == '1.5' then
	doTweenAlpha('Screen in Darkness', 'darkoverlay', 1, 1.5, 'linear');
    elseif value1 == '0' and value2 == '0.7' then
	doTweenAlpha('Screen in Darkness', 'darkoverlay', 0, 0.7, 'linear');
	end
  end

  if name == 'Strumline Visibility' then
	if value1 == 'dad' and value2 == '0,0' then
    if getPropertyFromClass('ClientPrefs', 'middleScroll') then
    noteTweenAlpha('Strumline Visibility', 0, 0.35, 0.01, 'circOut')
    noteTweenAlpha('Strumline Visibility1', 1, 0.35, 0.01, 'circOut')
    noteTweenAlpha('Strumline Visibility2', 2, 0.35, 0.01, 'circOut')
    noteTweenAlpha('Strumline Visibility3', 3, 0.35, 0.01, 'circOut')
	else
	noteTweenAlpha('Strumline Visibility', 0, 0, 0.01, 'circOut')
    noteTweenAlpha('Strumline Visibility1', 1, 0, 0.01, 'circOut')
    noteTweenAlpha('Strumline Visibility2', 2, 0, 0.01, 'circOut')
    noteTweenAlpha('Strumline Visibility3', 3, 0, 0.01, 'circOut')
    end

    elseif value1 == 'dad' and value2 == '1,0.8' then
    noteTweenAlpha('1Strumline Visibility', 0, 1, 0.8, 'circOut')
    noteTweenAlpha('1Strumline Visibility1', 1, 1, 0.8, 'circOut')
    noteTweenAlpha('1Strumline Visibility2', 2, 1, 0.8, 'circOut')
    noteTweenAlpha('1Strumline Visibility3', 3, 1, 0.8, 'circOut')
    
    elseif value1 == 'bf' and value2 == '1,0.8' then
    noteTweenAlpha('Strumline Visibility4', 4, 1, 0.8, 'circOut')
    noteTweenAlpha('Strumline Visibility5', 5, 1, 0.8, 'circOut')
    noteTweenAlpha('Strumline Visibility6', 6, 1, 0.8, 'circOut')
    noteTweenAlpha('Strumline Visibility7', 7, 1, 0.8, 'circOut')

    elseif value1 == 'bf' and value2 == '0,0' then
    noteTweenAlpha('1Strumline Visibility4', 4, 0, 0.1, 'circOut')
    noteTweenAlpha('1Strumline Visibility5', 5, 0, 0.1, 'circOut')
    noteTweenAlpha('1Strumline Visibility6', 6, 0, 0.1, 'circOut')
    noteTweenAlpha('1Strumline Visibility7', 7, 0, 0.1, 'circOut')
    
    elseif value1 == 'dad' and value2 == '1,0' then
    noteTweenAlpha('2Strumline Visibility', 0, 1, 0.1, 'circOut')
    noteTweenAlpha('2Strumline Visibility1', 1, 1, 0.1, 'circOut')
    noteTweenAlpha('2Strumline Visibility2', 2, 1, 0.1, 'circOut')
    noteTweenAlpha('2Strumline Visibility3', 3, 1, 0.1, 'circOut')
    
    elseif value1 == 'bf' and value2 == '1,0' then
    noteTweenAlpha('2Strumline Visibility4', 4, 1, 0.1, 'circOut')
    noteTweenAlpha('2Strumline Visibility5', 5, 1, 0.1, 'circOut')
    noteTweenAlpha('2Strumline Visibility6', 6, 1, 0.1, 'circOut')
    noteTweenAlpha('2Strumline Visibility7', 7, 1, 0.1, 'circOut')

    elseif value1 == 'bf' and value2 == '1,0.5' then
    noteTweenAlpha('3Strumline Visibility4', 4, 1, 0.5, 'circOut')
    noteTweenAlpha('3Strumline Visibility5', 5, 1, 0.5, 'circOut')
    noteTweenAlpha('3Strumline Visibility6', 6, 1, 0.5, 'circOut')
    noteTweenAlpha('3Strumline Visibility7', 7, 1, 0.5, 'circOut')
    end
   end

   if name == 'UI visibilty' then
	if (value1 == '' or value1 == 'false') then
    setProperty('iconP1.visible', false);
    setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);
    setProperty('iconP2.visible', false);
    setProperty('timeTxt.visible', false);
    setProperty('watermark.visible', false);
    setProperty('msTxt.visible', false);
    setProperty('oldScore.visible', false);
    setProperty('gray.visible', false);
    setProperty('black.visible', false);
    setProperty('songPosition.visible', false);
	end
	if (value1 == 'true') then
	setProperty('iconP1.visible', true);
    setProperty('healthBar.visible', true);
    setProperty('healthBarBG.visible', true);
    setProperty('iconP2.visible', true);
    setProperty('timeTxt.visible', true);
    setProperty('watermark.visible', true);
    setProperty('msTxt.visible', true);
    setProperty('oldScore.visible', true);
    setProperty('gray.visible', true);
    setProperty('black.visible', true);
    setProperty('songPosition.visible', true);
	end
   end

    if name == 'Cat Doodles Stuff' then
	  --value 1 handles alpha
	  --value 2 speed
	  --value 3 kills the cats
	  if (value1 == '1' and value2 == '1') then
      doTweenAlpha('Cat Doodles Stuff', 'bakaOverlay', 1, 1, 'linear');
      addLuaSprite('bakaOverlay', true);
      elseif (value1 == '' and value2 == 'hueh') then
      objectPlayAnimation('bakaOverlay', 'hueh', false);
      runTimer('removeCats', 4)
	  end
   end
 
    if name == 'Red Static' then
	  --Value 1 for alpha
	  --Value 2 for speed it appears
	  if (value1 == '0.5' and value2 == '1.8') then
      doTweenAlpha('Red Static', 'redStatic', 0.5, 1.8, 'linear');
      addLuaSprite('redStatic', true);
      elseif (value1 == '0' and value2 == '.1') then
      doTweenAlpha('Red Static', 'redStatic', 0, .1, 'linear');
      elseif (value1 == '0.1' and value2 == '0') then
      doTweenAlpha('Red Static', 'redStatic', 0.1, 0.01, 'linear');
      elseif (value1 == '0' and value2 == '0') then
      doTweenAlpha('Red Static', 'redStatic', 0, 0.01, 'linear');
      elseif (value1 == '1' and value2 == '1') then
      doTweenAlpha('Red Static', 'redStatic', 1, 1, 'linear');
      elseif (value1 == '0' and value2 == '0.1') then
      doTweenAlpha('Red Static', 'redStatic', 0, 0.1, 'linear');
      elseif (value1 == '1' and value2 == '0.7') then
      doTweenAlpha('Red Static', 'redStatic', 1, 0.7, 'linear');
      elseif (value1 == '1' and value2 == '0.1') then
      doTweenAlpha('Red Static', 'redStatic', 1, 0.1, 'linear');
	  end
    end

    if name == 'Move Opponent Tween' then
	  if (value1 == '570' and value2 == '100') then
      doTweenX('Move Opponent Tween', 'dad', 570, 0.1, 'circOut')
	  --doTweenY('YMove Opponent Tween', 'dad', 100, 0.1, 'circOut')
      elseif (value1 == '100' and value2 == '100') then
      doTweenX('Move Opponent Tween2', 'dad', 100, 0.01, 'circOut')
	  --doTweenY('YMove Opponent Tween2', 'dad', 100, 0.01, 'circOut')
	  elseif (value1 == '325' and value2 == '100') then
      doTweenX('Move Opponent Tween3', 'dad', 425, 0.1, 'circOut')
	  --doTweenY('YMove Opponent Tween3', 'dad', 100, 0.1, 'circOut')
	  elseif (value1 == '200' and value2 == '100') then
      doTweenX('Move Opponent Tween4', 'dad', 200, 0.01, 'circOut')
	  --doTweenY('YMove Opponent Tween4', 'dad', 100, 0.01, 'circOut')
	  end
    end

    if name == 'Toggle Note Camera Movement' then
    if (value1 == 'true') then
	noteCam = true;
	elseif (value1 == 'false') then
	noteCam = false;
	end
    end

    if name == 'Move Boyfriend Tween' then
    if (value1 == '575' and value2 == '100') then
      doTweenX('Move Boyfriend Tween', 'boyfriend', 475, 0.1, 'circOut')
      xx = 640;
      yy = 520;
      xx2 = 640;
      yy2 = 520;
	  --doTweenY('YMove Opponent Tween', 'boyfriend', 100, 0.1, 'circOut')
    elseif (value1 == '670' and value2 == '100') then
      doTweenX('Move Boyfriend Tween2', 'boyfriend', 670, 0.01, 'circOut')
	  --doTweenY('YMove Boyfriend Tween2', 'boyfriend', 100, 0.01, 'circOut')
	end
    end
	
	if name == 'Show death screen' then
	forcecamZooming = false;
	camZooming = false
    addLuaSprite('imdead', true);
	doTweenAlpha('Show death screen', 'imdead', 1, 0.1, 'linear');
	end
end
--Nickobelit estuvo aquí
