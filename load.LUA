-- Base interface

fond = Image.load("fond.png")
murs = Image.load("immeuble.png")
font = IntraFont.load("font.pgf", 0)
font:setStyle(1.0,Color.new(255,255,255),Color.new(0,0,0),IntraFont.ALIGN_CENTER)

System.draw()
screen:blit(0,-512+272,fond)
screen:blit(0,0,murs)
font:print(240,136,"Loading...")
System.endDraw()
screen.flip()

scroll = IntraFont.load("font.pgf", 0)
scroll:setStyle(1.0,Color.new(255,255,255),Color.new(0,0,0),IntraFont.SCROLL_THROUGH)
scr = 133
--images

fond2 = Image.load("fond2.png")
spot = Image.load("Lampe.png")
spot_droite = Image.load("Lampe - Droit.png")
ligne = Image.load("vetements.png")

--Fond Game Over

gameOver = function()
 System.draw()
 screen:blit(0,-512+272,fond)
 screen:blit(0,0,murs)
 System.endDraw()
end

--Anim Game Over

animMort = function()
position_mort = position
y_mort = 200
obstacle = false
while true do
System.draw()
screen:clear(Color.new(145,12,188))
screen:blit(0,-1024+272+1*score/4,fond2)
screen:blit(0,-512+272+1*score/4,fond)
screen:blit(0,mur_y-273,murs)
screen:blit(0,mur_y,murs)
if anim_tombe > 18 then anim_tombe = 8 end
if direction == 1 then
screen:blit(position_mort-8,y_mort-tombe[anim_tombe]:height()/2,tombe[anim_tombe])
position_mort = position_mort + 1
elseif direction == 2 then
screen:blit(position_mort-32,y_mort-tombe_droite[anim_tombe]:height()/2,tombe_droite[anim_tombe])
position_mort = position_mort - 1
end
y_mort = y_mort + 2
anim_tombe = anim_tombe + 1
if y_mort > 270 then
 anim_tombe = 1
 break
end
System.endDraw()
screen.flip()
System.sleep(25)
end
end
-- Variables jeu

mur_y = 0

position = 130
direction = 1
score = 1
vitesse = 6

-- CHARGEMENT DES ANIMATIONS EN MASSE

grimpe = {}
for i = 1,16 do
 grimpe[i] = Image.load("Grimpe/G"..i..".png")
end

grimpe_droite = {}
for i = 1,16 do
 grimpe_droite[i] = Image.load("Grimpe - Droit/G"..i..".png")
end

saut = {}
for i = 1,10 do
 saut[i] = Image.load("Saut/S"..i..".png")
end

tombe = {}
for i = 1,18 do
 tombe[i] = Image.load("Tombe/T"..i..".png")
end

tombe_droite = {}
for i = 1,18 do
 tombe_droite[i] = Image.load("Tombe - Droit/T"..i..".png")
end
--variables animation

anim_saut = 1
anim_grimpe = 1
anim_tombe = 1

-- variables obstacle

obstacle = false
linge = true
linge_y = 20

oldpad = Controls.readPeek()

-- Preparation du menu

menu_options = { "New Game" , "Options", "Credits" , "Quit" }
options = { "Hanging Clothes" , "Background", "Reset Scores" , "OK" }
selecteur = 1

-- sons...

Mp3.load("high score.mp3",1)
Wav.load("saut.wav",0)

--scores

dofile("scores.txt")

-- enfin, le menu

dofile("menu.lua")
