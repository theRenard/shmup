function doenemy(myen)
  -- move the enemy
  if myen.mission == 'flyin' then
    -- move in
    myen.y += 1
    if myen.y >= myen.posy then
      myen.mission = 'protec'
    end
  elseif myen.mission == 'protec' then
    -- do nothing
  elseif myen.mission == 'attack' then
    -- move towards the player
  end
end