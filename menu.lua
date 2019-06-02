while 1 do
pad = Controls.readPeek()

System.draw()
screen:clear(Color.new(71,71,255))

screen:blit(0,-512+272,fond)
screen:blit(0,0,murs)
screen:blit(131,selecteur*30-10,ligne)

scr = scroll:printColumn(scr,250,212, "High Score: "..high_score)

if pad:down() and not oldpad:down() and selecteur < 4 then
 selecteur = selecteur + 1
elseif pad:up() and not oldpad:up() and selecteur > 1 then
 selecteur = selecteur - 1
end

if pad:cross() and not oldpad:cross() then
 Wav.play(false,0)
 if selecteur == 1 then dofile("gameplay.lua") end
 if selecteur == 2 then selecteur = 1 dofile("options.lua") end
 if selecteur == 3 then dofile("credits.lua") end
 if selecteur == 4 then System.quit() end
end

for i = 1, #menu_options do
 font:print(240,i*30,menu_options[i])
end

oldpad = pad
System.endDraw()
screen.flip()
end
