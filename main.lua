-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local tapCount=0

local background = display.newImageRect( "yellowstone-national-park-usa.png", 1764, 682 )
background.x = display.contentHeight+50
background.y = display.contentCenterY

local music = audio.loadSound( "Maid with the Flaxen Hair.mp3"  )
audio.play ( music )

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.sysemFont, 40 )
tapText:setFillColor (0.434463,0.24134,1)

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local platform1 = display.newImageRect( "platform.png", 300, 50 )
platform1.x = display.contentCenterX
platform1.y = display.contentHeight-700

local balloon = display.newImageRect( "balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static", {bounce=0} )
physics.addBody( platform1, "static", {bounce=0.5} )
physics.addBody( balloon, "dynamic", {radius=50, bounce=0 })

local function pushBalloon()
   balloon:applyLinearImpulse( 0, -1.4142135623730950488, balloon.x, balloon.y )
tapCount = tapCount + 1
tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )
