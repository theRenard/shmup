function picktimer()
  if mode != "game" then
    return
  end

  if t > nextfire then
    pickfire()
    nextfire = t + firefreq + rnd(firefreq)
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

  if myen.boss then
    myen.mission = 'boss5'
    myen.phbegin = t
    myen.ghost = true
    ebuls = {}
    return
  end

  del(enemies, myen)
  sfx(2)
  local scoremul = 1
  explode(myen.x + 4, myen.y + 4)
  if rnd() < 0.1 then
    droppickup(myen.x, myen.y)
  end

  if myen.mission =="attack" then
    scoremul = 2
    local points = makescore(myen.score * scoremul)
    popfloat("+" .. points, myen.x, myen.y)
    if rnd(1) < 0.5 then
      pickattack()
    end
  end

  score += myen.score * scoremul
end

function droppickup(px,py)
  local mypick = create_entity()
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
    if lives < 4 then
      sfx(20)
      lives += 1
      popfloat("1up", mypick.x, mypick.y)
    else
      score += 50
      popfloat(makescore(100), mypick.x, mypick.y)
      sfx(21)
    end
    cherries = 0
  else
    sfx(21)
  end
end

