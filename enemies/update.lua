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
end

function draw_enemies()
  --drawing enemies
  for myen in all(enemies) do
    if myen.flash > 0 then
      myen.flash -= 1
      if t % 4 < 2 then
        pal(3, 8)
        pal(2, 8)
      end
      if myen.boss then
        myen.spr = 64
      else
        for i = 1, 15 do
          pal(i, 7)
        end
      end
    end
    drwmyspr(myen)
    pal()
  end
end