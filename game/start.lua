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

intro_eye_x = 74
intro_eye_left = false

function draw_start()
  --print(blink_color())
  cls(0)
  draw_starfield()
  print(version, 1, 1, 1)

  spr(20, 32, 40 - 20 , 8, 2)
  -- move line every 30 frames
  if t % 7 == 0 and rnd() >= 0.5 then
    -- increase until 78 then decrease back to 74
    if intro_eye_left then
      intro_eye_x -= 1
    else
      intro_eye_x += 1
    end
    if intro_eye_x == 77 then
      intro_eye_left = true
    end
    if intro_eye_x == 74 then
      intro_eye_left = false
    end
  end
  line(intro_eye_x, 25, intro_eye_x, 31, 0)


  palt(0, false)
  palt(3, true)
  spr(12,60,45)
  palt()
  cprint('1x = +1 smart bomb',64,60,9)
  cprint('10x = +1 life',64,70,9)
  -- cprint('10x = +10.000 pts',64,80,9)

  cprint("press any key to start",64,100 ,blink_color())

  if highscore>0 then
     cprint("highscore: "..makescore(highscore),64,115,9)
  end
 end

