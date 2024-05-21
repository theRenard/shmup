function update_win()
  if t < lockout then
    return
  end

  if btn(4) == false and btn(5) == false then
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

function draw_win()
  draw_game()
  cprint("congratulations",64,40,12)
  cprint("press any key to continue",64,80,blink())
 end

 function draw_wavetext()
  draw_game()
  if wave == lastwave then
    cprint("final wave",64,40,blink())
  else
    cprint("wave "..wave.. " of "..lastwave,64,40,blink())
  end
 end