function update_enemies()
  --moving enemies
  for myen in all(enemies) do
    -- enemy mission
    behavior(myen)

    -- animate enemy
    animate(myen)

    --check if enemy is offscreen
    if myen.mission != 'flyin' then
      if myen.y > 128 or myen.x < -8 or myen.x > 128 then
        del(enemies, myen)
      end
    end
  end

  picktimer()

end

function draw_enemies()
  --drawing enemies
  for myen in all(enemies) do
    if myen.flash > 0 then
      myen.flash -= 1
      if t % 4 < 2 and not myen.boss then
        pal(3, 8)
        pal(2, 8)
      end
      if myen.boss then
        myen.spr = 68
      else
        for i = 1, 15 do
          pal(i, 7)
        end
      end
    end
    if myen.boss then
      draw_boss(myen)
    else
      drwmyspr(myen)
      pal()
    end
  end
end

function draw_boss(myen)
  -- add cercle beneath the boss
  local circle_col = 7
  if myen.hp < 66 then
    circle_col = 9
  end
  if myen.hp < 33 then
    circle_col = 2
  end
  if myen.flash > 0 then
    circle_col = 8
  end
  circfill(myen.x + 16, myen.y + 16, 14, circle_col)
  draw_eye(myen)
  drwmyspr(myen)
end

function draw_eye(myen)
  palt(0, false)
  palt(3, true)
  local playerx = (ship.x - 64) / 12
  local playery = (ship.y - 64) / 12
  local enx = (myen.x - 64) / 24
  local eny = (myen.y - 64) / 24
  local eyex = myen.x + 13 - enx + playerx
  local eyey = myen.y + 7 - eny + playery
  spr(76, eyex, eyey, 1, 2)
  palt()
end