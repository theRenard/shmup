function update_collisions()
  --collision ship x enemies
  if invul <= 0 then
    for myen in all(enemies) do
      if col(myen, ship) then
        ship_die()
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
        sfx(20)

        if myen.invul then
          if myen.spr <= myen.spr_ref + 5 then
            return
          end
        end

        if myen.mission != 'flyin' then
          myen.hp -= mybul.dmg
        end
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
        ship_die()
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