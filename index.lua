local fond = Image.load("splash/fond.png")
local space = Image.load("splash/mascotte.png")
local team = Image.load("splash/titre.png")
local immeuble = Image.load("immeuble.png")
Mp3.load("stickman.mp3",0)
local t = 0
while t < 255 do
 System.draw()
 screen:clear()
 screen:blit(0,0,fond,t)
 t = t+1
 System.endDraw()
 screen.flip()
end
local x = 480
while x >= 0 do
 System.draw()
 screen:clear()
 screen:blit(0,0,fond)
 screen:blit(x,0,space)
 screen:blit(-x,0,team)
 x = x-1.5
 System.endDraw()
 screen.flip()
end

local t = 255
while t ~= 0 do
 System.draw()
 screen:clear()
 screen:blit(0,0,fond)
 screen:blit(0,0,space)
 screen:blit(0,0,team,t)
 System.endDraw()
 t = t-3
 screen.flip()
end
team:free()
local t = 255
while t ~= 0 do
 System.draw()
 screen:clear()
 screen:blit(0,0,fond)
 screen:blit(0,0,space,t)
 System.endDraw()
 t = t-3
 screen.flip()
end
space:free()
Mp3.play(true,0)
local ville = Image.load("fond.png")
local t = 255
while t ~= 0 do
 System.draw()
 screen:clear()
 screen:blit(0,-512+272,ville)
 screen:blit(0,0,fond,t)
 System.endDraw()
 t = t-3
 screen.flip()
end
fond:free()
local t = 0
while t ~= 255 do
 System.draw()
 screen:clear()
 screen:blit(0,-512+272,ville)
 screen:blit(0,0,immeuble,t)
 System.endDraw()
 t = t+3
 screen.flip()
end
ville:free()
immeuble:free()
dofile("load.lua")
