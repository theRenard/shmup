function update_game()
  update_ship()

  --move pickups
  for mypick in all(pickups) do
    move(mypick)

    if mypick.y > 128 then
      del(pickups, mypick)
    end
  end

  -- collision ship x pickups
  for mypick in all(pickups) do
    if col(mypick, ship) then
      plogick(mypick)
      del(pickups, mypick)
    end
  end

  --move the enemy bullets
  for mybul in all(ebuls) do
    move(mybul)
    animate(mybul)

    if mybul.y > 128 or mybul.x < -8 or mybul.x > 128 or mybul.y < -8 then
      del(ebuls, mybul)
    end
  end

  --moving enemies
  for myen in all(enemies) do
    -- enemy mission
    doenemy(myen)

    -- animate enemy
    animate(myen)


    --check if enemy is offscreen
    if myen.mission != 'flyin' then
      if myen.y > 128 or myen.x < -8 or myen.x > 128 then
      del(enemies, myen)
      end
    end
  end

  --collision enemy x bullets
  for myen in all(enemies) do
    for mybul in all(buls) do
      if col(myen, mybul) then
        del(buls, mybul)
        smol_shwave(mybul.x + 4, mybul.y + 4)
        smol_spark(myen.x + 4, myen.y + 4)
        if myen.mission != 'flyin' then
          myen.hp -= mybul.dmg
        end
        sfx(3)
        if myen.boss then
          myen.flash = 5
        else
          myen.flash = 2
        end

        if myen.hp <= 0 then
          killen(myen)
        end
      end
    end
  end

  --collision ebuls x bullets
  for mybul in all(buls) do
    if mybul.spr==17 then
      for myebul in all(ebuls) do
        if col(mybul, myebul) then
          del(myebul, ebuls)
          smol_shwave(mybul.x + 4, mybul.y + 4)
          del(ebuls, myebul)
        end
      end
    end
  end

  --collision ship x enemies
  if invul <= 0 then
    for myen in all(enemies) do
      if col(myen, ship) then
        explode(ship.x + 4, ship.y + 4, true)
        lives -= 1
        shake = 16
        sfx(1)
        invul = 60
        ship.x=60
        ship.y=100
      end
    end
  else
    invul -= 1
  end

  --collision ship x enemy bullets
  if invul <= 0 then
    for mybul in all(ebuls) do
      if col(mybul, ship) then
        explode(ship.x + 4, ship.y + 4, true)
        lives -= 1
        shake = 16
        sfx(1)
        invul = 60
        del(ebuls, mybul)
      end
    end
  end

  if lives <= 0 then
    mode = "over"
    lockout = t + 30
    music(6)
    return
  end

  --picking
  picktimer()

  --animate flame
  flamespr = flamespr + 1
  if flamespr > 9 then
    flamespr = 5
  end

  --animate mullze flash
  if muzzle > 0 then
    muzzle = muzzle - 1
  end

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