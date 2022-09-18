--Port y Código por Nickobelit
function onCreate()
precacheImage('stages1/PoemTransition')
precacheImage('stages1/PaperBG')
precacheImage('NOTE_assetsSil')
precacheImage('vignette')
precacheImage('healthBar-pixel')
precacheImage('timeBar-pixel')
addCharacterToList('bfpoem', 'boyfriend')
addCharacterToList('sayopoem', 'dad')

setProperty('skipCountdown', true)

--Codigo desechado esto era para la versión gama alta
--makeLuaSprite('bg', 'stages1/DDLCfarbg', -570, -410)
   -- scaleObject('bg',1.5,1.5);
--    setScrollFactor('bg', 0.9, 0.9);
 --   addLuaSprite('bg', false);
    --setProperty('bg.visible', true)
    
--makeLuaSprite('bg2', 'stages1/DesksFront',  -570, -410)
   -- scaleObject('bg2',1.5,1.5);
 --   setScrollFactor('bg2', 0.9, 0.9);
 --   addLuaSprite('bg2', true);
 --  setProperty('bg2.visible', true)
 
 --makeLuaSprite('Sky', 'stages1/Sky', -500, -280);
    --scaleObject('Sky', 1.3,1.3);
    --setScrollFactor('Sky', 0.9, 0.9);
    --addLuaSprite('Sky', false);
    --setProperty('Sky.visible', false)

 
 makeLuaSprite('bg1', 'stages1/DDLCbg', -570, -410)
    scaleObject('bg1',1.5,1.5);
    addLuaSprite('bg1', false);
   setProperty('bg1.visible', true)
   
    makeLuaSprite('BGMonika', 'stages1/BG', -500, -280);
    scaleObject('BGMonika', 2.8,2.8);
    addLuaSprite('BGMonika', false);
    setProperty('BGMonika.visible', false)
    
    makeAnimatedLuaSprite('BGSketch', 'stages1/BGSketch', -500, -280);
    addAnimationByPrefix('BGSketch', 'loopPaper', 'BGSketch0');
    scaleObject('BGSketch', 1.4,1.4);
    addLuaSprite('BGSketch', false);
    setProperty('BGSketch.visible', false)
    makeAnimatedLuaSprite('PaperBG', 'stages1/PaperBG', -500, -280);
    addAnimationByPrefix('PaperBG', 'stage', 'PaperBG0', 24, true);
    addLuaSprite('PaperBG', false);
    scaleObject('PaperBG', 1.7,1.7);
    setProperty('PaperBG.visible', false)
    
    
    makeLuaSprite('vidabarra', 'healthBar-pixel', 100, 100);
	  setObjectCamera('vidabarra', 'hud');
	  setScrollFactor('vidabarra', 0.9, 0.9);
	setProperty('vidabarra.visible', false)
	  addLuaSprite('vidabarra', false);
	  
	  
	makeLuaSprite('tiempobarra', 'timeBar-pixel', 0, 0);
	  setObjectCamera('tiempobarra', 'hud');
	  setScrollFactor('tiempobarra', 0.9, 0.9);
	  addLuaSprite('tiempobarra', false);
	  setProperty('tiempobarra.visible', false)
    
    setProperty('gf.visible', true);
    end

function onStepHit()
  if curStep == 288 then
    setProperty('bg1.visible', false);
    setProperty('BGMonika.visible', true);
    setProperty('defaultCamZoom', 0.9)
end
 if curStep == 544 then
    setProperty('BGMonika.visible', false);
    setProperty('bg1.visible', true);
    setProperty('defaultCamZoom', 0.7)
end
if curStep == 800 then
    setProperty('BGMonika.visible', true);
    setProperty('bg1.visible', false);  
    setProperty('defaultCamZoom', 0.9);
    removeLuaSprite('bg1', true);
end
if curStep == 1057 then
   setProperty('BGSketch.visible', true)
    setProperty('defaultCamZoom', 0.8);
end

if curStep == 1302 then
makeAnimatedLuaSprite('Transition', 'stages1/PoemTransition', -400, -280);
    addAnimationByPrefix('Transition', 'Transition', 'poemtransition');
    scaleObject('Transition', 1.7,1.7);
    setScrollFactor('Transition', 0, 0);
    addLuaSprite('Transition', true)
end

if curStep == 1312 then
setProperty('Transition.visible', false);
setProperty('BGMonika.visible', false);
    setProperty('BGSketch.visible', false);
    setProperty('gf.visible', false);
    setProperty('defaultCamZoom', 0.85);
    setProperty('PaperBG.visible', true);
    setProperty('vidabarra.visible', true);
    setProperty('tiempobarra.visible', true)
end

if curStep == 1696 then
setProperty('defaultCamZoom', 0.95);
end

if curStep == 1760 then
setProperty('defaultCamZoom', 1.2);
end


if curStep == 1825 then
    setProperty('BGMonika.visible', true);
    setProperty('gf.visible', true);
    setProperty('defaultCamZoom', 0.9);
    makeLuaSprite('vignette', 'vignette', 0, 0);
    setProperty('vignette.alpha', 0.7);
    setObjectCamera('vignette', 'camHud');
    addLuaSprite('vignette', true);
    setProperty('PaperBG.visible', false);
    setProperty('vidabarra.visible', false);
    setProperty('tiempobarra.visible', false)
	 end
	
if curStep == 2080 then
    setProperty('defaultCamZoom', 1);
end
  if curStep == 2144 then
    setProperty('defaultCamZoom', 1.2);
end
  if curStep == 2208 then
    setProperty('defaultCamZoom', 1.4);
end
  if curStep == 2280 then
    setProperty('defaultCamZoom', 0.75);
    setProperty('BGSketch.visible', true)
end

if curStep == 2326 then
makeAnimatedLuaSprite('Transition', 'stages1/PoemTransition', -400, -280);
    addAnimationByPrefix('Transition', 'Transition', 'poemtransition');
    scaleObject('Transition', 1.7,1.7);
    setScrollFactor('Transition', 0, 0);
    addLuaSprite('Transition', true)
end

if curStep == 2336 then
     setProperty('Transition.visible', false)
    setProperty('BGMonika.visible', false);
    setProperty('gf.visible', false);
    setProperty('vignette.visible', false);
    setProperty('PaperBG.visible', true);
    setProperty('defaultCamZoom', 1.2);
    setProperty('vidabarra.visible', true);
    setProperty('tiempobarra.visible', true)
    end

if curStep == 2340 then
setProperty('Transition.visible', false);
end

if curStep == 2592 then
    setProperty('defaultCamZoom', 0.75);
    end

if curStep == 2650 then
makeAnimatedLuaSprite('Transition', 'stages1/PoemTransition', -400, -280);
    addAnimationByPrefix('Transition', 'Transition', 'poemtransition');
    scaleObject('Transition', 1.7,1.7);
    setScrollFactor('Transition', 0, 0);
    addLuaSprite('Transition', true)
end
end

function onBeatHit()
if curBeat == 328 then
for i = 0, getProperty('opponentStrums.length')-1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assetsSil');
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assetsSil');
				end
			end
			for i = 0, getProperty('playerStrums.length')-1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assetsSil');
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assetsSil');
				end
			end
end
if curBeat == 456 then
for i = 0, getProperty('opponentStrums.length')-1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
				end
			end
			for i = 0, getProperty('playerStrums.length')-1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
				end
			end
end
if curBeat == 584 then
for i = 0, getProperty('opponentStrums.length')-1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assetsSil');
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assetsSil');
				end
			end
			for i = 0, getProperty('playerStrums.length')-1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assetsSil');
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assetsSil');
				end
			end
end
end

function onCreatePost()
	--mmm Healthbar
    setProperty('vidabarra.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('vidabarra.x', getProperty('healthBar.x') - 16)
    setProperty('vidabarra.angle', getProperty('healthBar.angle'))
    setProperty('vidabarra.y', getProperty('healthBar.y') - 15)
    setProperty('vidabarra.scale.x', getProperty('healthBar.scale.x'))
    setProperty('vidabarra.scale.y', getProperty('healthBar.scale.y'))
    setObjectOrder('vidabarra', 2)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 1)
  --timeBarshit

    setProperty('tiempobarra.x', getProperty('timeBar.x') - 15)
    setProperty('tiempobarra.angle', getProperty('timeBar.angle'))
    setProperty('tiempobarra.y', getProperty('timeBar.y') - 15)
    setProperty('tiempobarra.scale.x', getProperty('timeBar.scale.x'))
    setProperty('tiempobarra.scale.y', getProperty('timeBar.scale.y'))
    setObjectOrder('tiempobarra', 1)
	setObjectOrder('timeBar', 3)
	setObjectOrder('timeBarBG', 2)
end