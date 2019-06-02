while 1 do
pad = Controls.readPeek()

System.draw()
screen:clear(Color.new(71,71,255))

screen:blit(0,-512+272,fond)
screen:blit(0,0,murs)

font:print(240,30,"CREDITS")
font:print(240,70,"Code: psgarsenal")
font:print(240,100,"Graphics: Samir88Nasri")
font:print(240,130,"Music: Applelo")
font:print(70,266,"O: Back")
font:print(375,266,"Team Zenyth")

if pad:circle() then
Wav.play(false,0)
break
end

oldpad = pad
System.endDraw()
screen.flip()
end
