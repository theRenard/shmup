function update_collisions()
  --collision ship x enemies
  if invul <= 0 then
    for myen in all(enemies) do
      if col(myen, ship) then
        explode(ship.x + 4, ship.y + 4, true)
        lives -= 1
        shake = 16
        sfx(1)
        invul = 60
        ship.x = 60
        ship.y = 100
      end
    end
  else
    invul -= 1
  end

  -- collision ship x pickups
  for mypick in all(pickups) do
    if col(mypick, ship) then
      plogick(mypick)
      del(pickups, mypick)
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

  --collision ebuls x bullets
  for mybul in all(buls) do
    if mybul.spr == 17 then
      for myebul in all(ebuls) do
        if col(mybul, myebul) then
          del(myebul, ebuls)
          smol_shwave(mybul.x + 4, mybul.y + 4)
          del(ebuls, myebul)
        end
      end
    end
  end
end