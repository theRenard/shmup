function update_start()
  animatestars(0.5)
  if btn(4) == false and btn(5) == false then
    btnreleased = true
  end

  if btnreleased then
    if btnp(4) or btnp(5) then
      startgame()
      btnreleased = false
    end
  end
end

function draw_start()
  --print(blink())
  cls(0)
  draw_starfield()
  print(version, 1, 1, 1)

  cprint("my awesome shmup",64,40,12)
  if highscore>0 then
     cprint("highscore: "..makescore(highscore),64,50,7)
  end
  cprint("press any key to start",64,80,blink())
 end

 function draw_over()
  draw_game()
  cprint("game over",64,40,8)
  cprint("score:"..makescore(score),64,60,12)

  if score>highscore then
    cprint("new highscore!",64,80,blink())
  end

  cprint("press any key to continue",64,100,blink())

 end