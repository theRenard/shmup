function update_game()
  --controls
  ship.sx = 0
  ship.sy = 0
  ship.spr = 2

  if btn(0) then
    ship.sx = -2
    ship.spr = 1
  end
  if btn(1) then
    ship.sx = 2
    ship.spr = 3
  end
  if btn(2) then
    ship.sy = -2
  end
  if btn(3) then
    ship.sy = 2
  end

  if btnp(4) then
    if cherries > 0 then
      cherbomb()
      cherries = 0
    end
  end

  if btn(5) then
    if bultimer <= 0 then
      local newbul = makespr()
      newbul.x = ship.x + 1
      newbul.y = ship.y - 3
      newbul.spr = 16
      newbul.colw = 6
      newbul.sy = -4
      newbul.dmg = 1

      add(buls, newbul)

      sfx(0)
      muzzle = 5
      bultimer = 4
    end
  end
  bultimer -= 1

  --moving the ship
  ship.x += ship.sx
  ship.y += ship.sy

  --checking if we hit the edge
  if ship.x > 120 then
    ship.x = 120
  end
  if ship.x < 0 then
    ship.x = 0
  end
  if ship.y < 0 then
    ship.y = 0
  end
  if ship.y > 120 then
    ship.y = 120
  end

  --move the bullets
  for mybul in all(buls) do
    move(mybul)

    if mybul.y < -8 then
      del(buls, mybul)
    end
  end

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

  --collision ship x enemies
  if invul <= 0 then
    for myen in all(enemies) do
      if col(myen, ship) then
        explode(ship.x + 4, ship.y + 4, true)
        lives -= 1
        shake = 16
        sfx(1)
        invul = 60
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

  animatestars()

  --check if wave over
  if mode == "game" and #enemies == 0 then
    nextwave()
  end
end

function update_start()
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