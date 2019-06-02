while 1 do
pad = Controls.readPeek()

System.draw()
screen:clear(Color.new(71,71,255))

screen:blit(0,-512+272,fond)
screen:blit(0,0,murs)
screen:blit(107,selecteur*30-10,ligne)

if pad:down() and not oldpad:down() and selecteur < 4 then
 selecteur = selecteur + 1
elseif pad:up() and not oldpad:up() and selecteur > 1 then
 selecteur = selecteur - 1
end

if pad:cross() and not oldpad:cross() then
 Wav.play(false,0)
 if selecteur == 1 then System.msgDialog("Function not to return?",true,gameOver) end
 if selecteur == 2 then System.msgDialog("Function not to return?",true,gameOver) end
 if selecteur == 3 then
  result = System.msgDialog("Are you sure you want to reset the scores?",true,gameOver)
  if result==System.MSGDIALOG_RESULT_YES then
   fichier = io.open("scores.txt","w")
   fichier:write("high_score = 99999")
   fichier:close()
  end
 end
 if selecteur == 4 then selecteur = 2 dofile("scores.txt") break end
end

for i = 1, #options do
 font:print(240,i*30,options[i])
end

oldpad = pad
System.endDraw()
screen.flip()
end
