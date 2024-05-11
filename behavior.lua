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
      myen.x=myen.posx
      myen.mission = 'protect'
    end
  elseif myen.mission == 'protect' then
    -- do nothing
  elseif myen.mission == 'attack' then

    if myen.entype == 1 then
      -- move towards the player
      myen.sy = 1.7
      myen.sx = sin(t/45)

      if myen.x < 32 then
        myen.sx += 1-(myen.x/32)
      end

      if myen.x > 88 then
        myen.sx -= (myen.x-88)/32
      end

    elseif myen.entype == 2 then
      -- move towards the player
      myen.sy = 2.5
      myen.sx = sin(t/45)

      if myen.x < 32 then
        myen.sx += 1-(myen.x/32)
      end

      if myen.x > 88 then
        myen.sx -= (myen.x-88)/32
      end

    elseif myen.entype == 3 then
      -- move towards the player

      if myen.sx == 0 then
        -- move towards the player
        myen.sy = 1.5
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

    elseif myen.entype == 4 then
      -- move towards the player
      myen.sy = 0.35

      if myen.y > 110 then
        myen.sy = 1
      else
        if t % 20 == 0 then
          firespread(myen, 8, 2, rnd())
        end
      end
    end
    move(myen)
  end
end

function picktimer()
  if mode != "game" then
    return
  end

  if t > nextfire then
    pickfire()
    nextfire = t + 20 + rnd(20)
  end

  if t % attackfreq == 0 then
    pickattack()
  end
end

function pickattack()
  local maxnum = min(10, #enemies)
  local myindex = flr(rnd(maxnum))
  myindex=#enemies-myindex

  local myen=enemies[myindex]

  if myen == nil then
    return
  end

  if myen.mission == 'protect' then
    myen.mission = 'attack'
    myen.anispd*=4
    myen.wait = 30
    myen.shake = 60
  end
end

function pickfire()
  local maxnum = min(10, #enemies)
  local myindex = flr(rnd(maxnum))
  myindex=#enemies-myindex

  local myen=enemies[myindex]

  if myen == nil then
    return
  end

  if myen.mission == 'protect' then
    -- myen.mission = 'attack'
    -- myen.anispd*=4
    -- myen.wait = 30
    -- myen.shake = 60
    fire(myen, 0, 2)
  end
end

function move(obj)
  obj.x += obj.sx
  obj.y += obj.sy
end

function killen(myen)
  del(enemies, myen)
  sfx(2)
  score += 1
  explode(myen.x + 4, myen.y + 4)

  if myen.mission =="attack" then
    if rnd(1) < 0.5 then
      pickattack()
    end
  end
end