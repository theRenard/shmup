function update_over()
  if t < lockout then
    return
  end

  if btn(4) == false and btnp(❎) == false then
    btnreleased = true
  end

  if btnreleased then
    if btnp(4) or btnp(5) then
      if score > highscore then
        highscore = score
        dset(0, highscore)
      end
      startscreen()
      btnreleased = false
    end
  end
end

function check_game_over()
  if lives <= 0 then
    mode = "over"
    lockout = t + 30
    music(6)
    return
  end
end

function draw_over()
  draw_game()
  cprint("game over",64,40,8)
  cprint("score:"..makescore(score),64,60,12)

  if score>highscore then
    cprint("new highscore!",64,80,blink_color())
  end

  cprint("press any key to continue",64,100,blink_color())

 end