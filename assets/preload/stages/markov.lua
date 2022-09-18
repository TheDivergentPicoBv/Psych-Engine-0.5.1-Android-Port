function onCreate()
setProperty('skipCountdown', true)
precacheImage('stages1/fadetransitionshit');
     addCharacterToList('yuri-gore', 'dad');

    makeAnimatedLuaSprite('PoemBG', 'stages1/PaperBG', -600, -400);
    addAnimationByPrefix('PoemBG', 'idle', 'PaperBG0', 24, true);
    objectPlayAnimation('PoemBG', 'idle', false);
    scaleLuaSprite('PoemBG', 1.5, 1.5);
    setLuaSpriteScrollFactor('PoemBG', 1.0, 1.0);
    addLuaSprite('PoemBG', false);
    setProperty('PoemBG.visible', false)
    
    makeLuaSprite('SpaceClassroomInside', 'stages1/BG2', -600, -400);
    scaleLuaSprite('SpaceClassroomInside', 1.5,1.5);
    setLuaSpriteScrollFactor('SpaceClassroomInside', 1.0, 1.0);
    addLuaSprite('SpaceClassroomInside', false);
    setProperty('SpaceClassroomInside.visible', false)

    makeLuaSprite('DarkCloset', 'stages1/ClosetBG', -210, 50);
    scaleLuaSprite('DarkCloset', 1.6, 1.6);
    setLuaSpriteScrollFactor('DarkCloset', 1.0, 1.0);
    addLuaSprite('DarkCloset', false);
    setProperty('DarkCloset.visible', true)
    setProperty('gf.visible', false);
end

function onStepHit()
    if curStep == 416 then
        makeLuaSprite('fade', 'stages1/fadetransitionshit', 0, 0)
        setObjectCamera('fade', 'other')
	    scaleLuaSprite('fade', 1.5, 1.5)
	    addLuaSprite('fade', false)
    end
    if curStep == 434 then
        removeLuaSprite('fade')
        end
        
     if curStep == 448 then
setProperty('defaultCamZoom', 1.2);
setProperty('gf.visible', true);
        setProperty('DarkCloset.visible', false)
        setProperty('SpaceClassroomInside.visible', true)
        end
     
     if curStep == 972 then
        makeLuaSprite('fade', 'stages1/fadetransitionshit', 0, 0)
        setObjectCamera('fade', 'other')
	    scaleLuaSprite('fade', 1.5, 1.5)
	    addLuaSprite('fade', false)
	end

     if curStep == 992 then
        removeLuaSprite('fade')
        setProperty('gf.visible', false);
        setProperty('defaultCamZoom', 1);
        setProperty('DarkCloset.visible', true)
       setProperty('SpaceClassroomInside.visible', false)
       end
        
         if curStep == 1248 then
setProperty('defaultCamZoom', 1.1);
end

     if curStep == 1504 then
setProperty('gf.visible', true);
setProperty('defaultCamZoom', 1.2);
        setProperty('DarkCloset.visible', false)
        makeLuaSprite('DaVignette', 'stages1/vignette', -300, 0)
        scaleLuaSprite('DaVignette', 1.5, 1.5)
        setObjectCamera('DaVignette', 'other')
        setLuaSpriteScrollFactor('DaVignette', 1.0, 1.0)
        addLuaSprite('DaVignette', true)
        makeLuaSprite('Transparent', 'stages1/transparent_cover', -300, 0)
        scaleLuaSprite('Transparent', 1.5, 1.5)
        setLuaSpriteScrollFactor('Transparent', 0, 0)
        addLuaSprite('Transparent', true)
      
        setProperty('SpaceClassroomInside.visible', true)
        end
         if curStep == 1632 then
setProperty('defaultCamZoom', 1);
end
     if curStep == 1760 then
        removeLuaSprite('Transparent')
        setProperty('defaultCamZoom', 1.3);
        end
    
     if curStep == 2268 then
        setProperty('defaultCamZoom', 1);
        setProperty('gf.visible', false);
        removeLuaSprite('DaVignette')
        removeLuaSprite('SpaceClassroomInside')
        setProperty('DarkCloset.visible', true)
        end
        
     if curStep == 2816 then
        makeLuaSprite('fade', 'stages1/fadetransitionshit', 0, 0)
        setObjectCamera('fade', 'hud')
	    scaleLuaSprite('fade', 1.5, 1.5)
	    addLuaSprite('fade', false)
	   setPropertyFromGroup('opponentStrums',0,'alpha',0);
       setPropertyFromGroup('opponentStrums',1,'alpha',0);
      setPropertyFromGroup('opponentStrums',2,'alpha',0);
       setPropertyFromGroup('opponentStrums',3,'alpha',0);
       end
     if curStep == 2832 then
        removeLuaSprite('fade');
        setProperty('DarkCloset.visible', false);
        setProperty('PoemBG.visible', true)
end
     if curStep == 2880 then
        makeLuaSprite('fade', 'stages1/fadetransitionshit', 0, 0)
        setObjectCamera('fade', 'other')
	    scaleLuaSprite('fade', 1.5, 1.5)
	    addLuaSprite('fade', false)
    end
end