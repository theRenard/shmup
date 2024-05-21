function update_game()
  update_ship()
  update_bullets()
  update_enemies()
  update_pickups()
  update_collisions()

  if lives <= 0 then
    mode = "over"
    lockout = t + 30
    music(6)
    return
  end

  --picking
  picktimer()

  if mode == "wavetext" then
    animatestars(2)
  else
    animatestars()
  end

  --check if wave over
  if mode == "game" and #enemies == 0 then
    ebuls = {}
    nextwave()
  end
end

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

function update_over()
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

function update_wavetext()
  update_game()
  wavetime -= 1
  if wavetime <= 0 then
    mode = "game"
    spawnwave()
  end
end