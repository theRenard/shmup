function behavior(myen)
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
    local dx = (myen.posx - myen.x) / 8
    local dy = (myen.posy - myen.y) / 8

    if myen.boss then
      dy = min(1, dy)
    end
    myen.x += dx
    myen.y += dy

    if abs(myen.y-myen.posy) < 0.7 then
      myen.y=myen.posy
      myen.x=myen.posx
      if myen.boss then
        myen.mission = 'boss1'
        myen.phbegin = t
      else
        myen.mission = 'protect'
      end
    end

  elseif myen.mission == 'protect' then

  elseif myen.mission == 'boss1' then
    boss1(myen)
  elseif myen.mission == 'boss2' then
    boss2(myen)
  elseif myen.mission == 'boss3' then
    boss3(myen)
  elseif myen.mission == 'boss4' then
    boss4(myen)
  elseif myen.mission == 'boss5' then
    boss5(myen)
    -- do nothing
  elseif myen.mission == 'attack' then

    if myen.type == 1 then
      -- move towards the player
      myen.sy = myen.speed
      myen.sx = sin(t/45)

      if myen.x < 32 then
        myen.sx += 1-(myen.x/32)
      end

      if myen.x > 88 then
        myen.sx -= (myen.x-88)/32
      end

    elseif myen.type == 2 or myen.type == 6 then
      -- move towards the player
      myen.sy = myen.speed / 2
      myen.sx = sin(t/45)

      if myen.x < 32 then
        myen.sx += 1-(myen.x/32)
      end

      if myen.x > 88 then
        myen.sx -= (myen.x-88)/32
      end

    elseif myen.type == 3 or myen.type == 7 then
      -- move towards the player

      if myen.sx == 0 then
        -- move towards the player
        myen.sy =  myen.speed / 2
        if ship.y <= myen.y then
          myen.sy = 0
          if ship.x < myen.x then
            myen.sx = -1
          else
            myen.sx = 1
          end
        end
      else
        -- move towards the player
      end

    elseif myen.type == 4 or myen.type == 5 then
      -- move towards the player
      myen.sy = myen.speed / 4

      if myen.y > 110 then
        myen.sy = 3
      end
    end
    move(myen)
  end
end