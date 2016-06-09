local composer = require( "composer" )

local scene = composer.newScene()

display.setStatusBar (display.HiddenStatusBar)
-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
	display.setStatusBar (display.HiddenStatusBar)
	local contentWidth = display.contentWidth
	local contentHeight = display.contentHeight
	local background = display.newRect(contentWidth/2, contentHeight/2, contentWidth, contentHeight)
	sceneGroup:insert(background)
	background:setFillColor(1,1,1)	
	local picture = display.newImage("instructionPic.png")
	picture.anchorY = 1
	picture.x = contentWidth/2
	picture.y = 200
	sceneGroup:insert(picture)
	local tap = display.newImage("tap.png")
	tap.x = contentWidth/2
	tap.y = 100
	tap.xScale = 0.2
	tap.yScale = 0.2
	sceneGroup:insert(tap)
	local tapText = display.newText("Tap to jump", contentWidth/2 + 50, 100, Arial, 10)
	tapText:setFillColor(0,0,0)
	sceneGroup:insert(tapText)
	local myText = "Stoner Bob is trying to find a taco joint to feed his munchies. However, he is SUPER high and keeps running into things, so he needs your help!"
	local textOptions = 
	{
		text = myText,
		x = contentWidth / 2,
		y = 370,
		width = 265,
		height = 310,
		fontSize = 14,
		align = "center"
	}
	local text = display.newText(textOptions)
	text:setFillColor(0,0,0)
	sceneGroup:insert(text)
	local back = display.newImage("back.png")
	back.x = contentWidth - 30
	back.y = 250
	back.xScale = 0.1
	back.yScale = 0.1
	sceneGroup:insert(back)
	
	function returnToMenu (event)
		if (event.phase == "ended") then
			composer.gotoScene("menu")
		end
	end
	back:addEventListener("touch", returnToMenu)

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.

    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene