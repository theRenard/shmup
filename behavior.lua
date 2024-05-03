function doenemy(myen)
  -- check if the enemy is waiting
  if myen.wait > 0 then
    myen.wait -= 1
    return
  end

  -- move the enemy
  if myen.mission == 'flyin' then
    -- move in
    -- basic easing function
    -- x+= (target-x)/speed
    myen.x += (myen.posx - myen.x) / 8
    myen.y += (myen.posy - myen.y) / 8

    if abs(myen.y-myen.posy) < 0.7 then
      myen.y=myen.posy
      myen.mission = 'protec'
    end
  elseif myen.mission == 'protec' then
    -- do nothing
  elseif myen.mission == 'attack' then
    -- move towards the player
    myen.y += (ship.y - myen.y) / 20
    myen.x += (ship.x - myen.x) / 20
  end
end

function picking()
  if mode != "game" then
    return
  end

  if t % 60 == 0 then
    local myen=rnd(enemies)
    if myen.mission == 'protec' then
      myen.mission = 'attack'
    end
  end
end