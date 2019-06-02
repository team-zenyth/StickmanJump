while 1 do
pad = Controls.readPeek()

if anim_saut > 10 then anim_saut = 1 end
if anim_grimpe > 16 then anim_grimpe = 1 end

System.draw()
screen:clear(Color.new(145,12,188))

screen:blit(0,-1024+272+1*score/4,fond2)
screen:blit(0,-512+272+1*score/4,fond)
screen:blit(0,mur_y-273,murs)
screen:blit(0,mur_y,murs)
mur_y = mur_y + vitesse
if mur_y > 272 then mur_y = 0 end

if not linge then
 if math.random(0,25) == math.random(0,25) then
  linge = true
  linge_y = -66
 end
else
  screen:blit(131,linge_y,ligne)
 if linge_y > 272 then
  linge = false
 else
  linge_y = linge_y + vitesse
 end
end

if not obstacle then
 if math.random(0,10) == math.random(0,10) then
  obstacle_x = math.random(1,2)
  obstacle_y = -30
  obstacle = true
 end
else
 if obstacle_x == 1 then
  screen:blit(130,obstacle_y,spot)
 else
  screen:blit(322,obstacle_y,spot_droite)
 end
 obstacle_y = obstacle_y + vitesse
end
if obstacle and obstacle_y > 272 then
 obstacle = false
end

if obstacle and position < 158 and obstacle_y > 200-grimpe[anim_grimpe]:height()/2 and obstacle_y < 200+grimpe[anim_grimpe]:height()/2 and obstacle_x == 1 then
 animMort()
 result = System.msgDialog("GAME OVER\nYou reached "..score.." meters, do you want to restart?",true,gameOver)
 fichier = io.open("scores.txt","w")
 fichier:write("high_score = "..score)
 fichier:close()
 high_score = score
 if result==System.MSGDIALOG_RESULT_NO then
  obstacle = false
  score = 0
  vitesse = 6
  break
 else
  obstacle = false
  score = 0
  vitesse = 6
 end
end

if obstacle and position > 322 and obstacle_y > 200-grimpe[anim_grimpe]:height()/2 and obstacle_y < 200+grimpe[anim_grimpe]:height()/2 and obstacle_x == 2 then
 animMort()
 result = System.msgDialog("GAME OVER\nYou reached "..score.." meters, do you want to restart?",true,gameOver)
 fichier = io.open("scores.txt","w")
 fichier:write("high_score = "..score)
 fichier:close()
 high_score = score
 if result==System.MSGDIALOG_RESULT_NO then
  obstacle = false
  score = 0
  vitesse = 6
  break
 else
  obstacle = false
  score = 0
  vitesse = 6
 end
end

if high_score == score then
 Mp3.play(false,1)
end

if pad:cross() and position == 130 and not oldpad:cross() then Wav.stop(0) Wav.play(false,0) direction = 2 position = 140 end
if position < 350 and position ~= 130 and direction == 2 then position = position + 10 end
if pad:cross() and position == 350 and not oldpad:cross() then Wav.stop(0) Wav.play(false,0) direction = 1 position = 340 end
if position > 130 and position ~= 350 and direction == 1 then position = position - 10 end

if position < 130 then
position = 130
elseif position > 350 then
position = 350
end

if position == 130 then
screen:blit(position-8,200-grimpe[anim_grimpe]:height()/2,grimpe[anim_grimpe])
elseif position == 350 then
screen:blit(position-32,200-grimpe_droite[anim_grimpe]:height()/2,grimpe_droite[anim_grimpe])
else
screen:blit(position-saut[anim_saut]:width()/2,200-saut[anim_saut]:height()/2,saut[anim_saut])
end

if pad:start() then

 while 1 do
 pad = Controls.readPeek()

 System.draw()
 screen:clear(Color.new(145,12,188))

 screen:blit(0,-1024+272+1*score/4,fond2)
 screen:blit(0,-512+272+1*score/4,fond)
 screen:blit(0,mur_y-273,murs)
 screen:blit(0,mur_y,murs)

 if linge then
  screen:blit(131,linge_y,ligne)
 end

 if obstacle then
  if obstacle_x == 1 then
   screen:blit(130,obstacle_y,spot)
  else
   screen:blit(322,obstacle_y,spot_droite)
  end
 end

 if position == 130 then
  screen:blit(position-8,200-grimpe[anim_grimpe]:height()/2,grimpe[anim_grimpe])
 elseif position == 350 then
  screen:blit(position-32,200-grimpe_droite[anim_grimpe]:height()/2,grimpe_droite[anim_grimpe])
 else
  screen:blit(position-saut[anim_saut]:width()/2,200-saut[anim_saut]:height()/2,saut[anim_saut])
 end

 if pad:cross() then
  Wav.play(false,0)
  break
 end

 font:print(240,136,"PAUSE MENU")
 font:print(75,266,"X: Resume")
 font:print(450,266,score)

 oldpad = pad
 System.endDraw()
 screen.flip()
 end

end

font:print(135,266,"START: Pause Game")
font:print(450,266,score)

anim_saut = anim_saut + 1
anim_grimpe = anim_grimpe + 1

score = score + 1
vitesse = vitesse + 0.002

oldpad = pad
System.endDraw()
screen.flip()
System.sleep(20)
end
