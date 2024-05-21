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