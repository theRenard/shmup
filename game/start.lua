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

  spr(20, 32, 40 , 8, 2)
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
  line(intro_eye_x, 45, intro_eye_x, 51, 0)

  cprint("press any key to start",64,73,blink_color())

  if highscore>0 then
     cprint("highscore: "..makescore(highscore),64,100,9)
  end
 end

