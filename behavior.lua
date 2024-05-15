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

    if myen.type == 1 then
      -- move towards the player
      myen.sy = 1.7
      myen.sx = sin(t/45)

      if myen.x < 32 then
        myen.sx += 1-(myen.x/32)
      end

      if myen.x > 88 then
        myen.sx -= (myen.x-88)/32
      end

    elseif myen.type == 2 then
      -- move towards the player
      myen.sy = 2.5
      myen.sx = sin(t/45)

      if myen.x < 32 then
        myen.sx += 1-(myen.x/32)
      end

      if myen.x > 88 then
        myen.sx -= (myen.x-88)/32
      end

    elseif myen.type == 3 then
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

    elseif myen.type == 4 then
      -- move towards the player
      myen.sy = 0.35

      if myen.y > 110 then
        myen.sy = 3
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

  log = myen.type

  if myen.mission == 'protect' then
    if myen.type == 4 then
      firespread(myen, 8, 1.3, rnd())
    elseif myen.type == 2 or myen.type == 3 then
      aimedfire(myen, 2)
    else
      fire(myen, 0, 1.5)
    end
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
  if rnd() < 0.1 then
    droppickup(myen.x, myen.y)
  end

  if myen.mission =="attack" then
    local points = myen.points or 100
    popfloat("+" .. points, myen.x, myen.y)
    if rnd(1) < 0.5 then
      pickattack()
    end
  end
end

function droppickup(px,py)
  local mypick = makespr()
  mypick.x = px
  mypick.y = py
  mypick.sx = 0
  mypick.sy = 0.75
  mypick.spr = 48
  add(pickups, mypick)
end

function plogick(mypick)
  cherries += 1
  smol_shwave(mypick.x, mypick.y)
  if cherries >= 10 then
    cherries = 0
    if lives < 4 then
      sfx(20)
      lives += 1
      popfloat("1up", mypick.x, mypick.y)
    else
      score += 100
    end
  else
    sfx(21)
  end
end

