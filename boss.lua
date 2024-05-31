function boss1(boss)
  local spd = 2

  if boss.sx == 0 or boss.x >= 93 then
    boss.sx = -spd
  end

  if boss.x <= 3 then
    boss.sx = spd
  end

  if t % 30 > 1 then
    if t % 10 == 0 then
      fire(boss, 0, 1)
    end
  end

  if boss.phbegin + 8 * 30 < t then
    boss.mission = 'boss4'
    boss.subphase = 1
    boss.phbegin = t
  end
  move(boss)
end

function boss2(boss)
  local spd = 1.5
  if boss.subphase == 1 then
    boss.sx = -spd
    if boss.x <= 4 then
      boss.subphase = 2
    end
  elseif boss.subphase == 2 then
    boss.sx = 0
    boss.sy = spd
    if boss.y >= 98 then
      boss.subphase = 3
    end
  elseif boss.subphase == 3 then
    boss.sx = spd
    boss.sy = 0
    if boss.x >= 91 then
      boss.subphase = 4
    end
  elseif boss.subphase == 4 then
    boss.sx = 0
    boss.sy = -spd
    if boss.y <= 25 then
      boss.mission = 'boss3'
      boss.phbegin = t
      boss.sy = 0
    end
  end

  if t % 15 == 0 then
    aimedfire(boss, 2)
  end

  move(boss)
end

function boss3(boss)
  local spd = 2

  if boss.sx == 0 or boss.x >= 93 then
    boss.sx = -spd
  end
  if boss.x <= 3 then
    boss.sx = spd
  end

  if t % 15 == 0 then
    firespread(boss, 8, 2, 0)
  end

  move(boss)

  if boss.phbegin + 8 * 30 < t then
    boss.mission = 'boss4'
    boss.subphase = 1
    boss.subphase = 1
    boss.phbegin = t
  end
end

function boss4(boss)
  local spd = 1.5
  if boss.subphase == 1 then
    boss.sx = spd
    if boss.x >= 91 then
      boss.subphase = 2
    end
  elseif boss.subphase == 2 then
    boss.sx = 0
    boss.sy = spd
    if boss.y >= 98 then
      boss.subphase = 3
    end
  elseif boss.subphase == 3 then
    boss.sx = -spd
    boss.sy = 0
    if boss.x <= 4 then
      boss.subphase = 4
    end
  elseif boss.subphase == 4 then
    boss.sx = 0
    boss.sy = -spd
    if boss.y <= 25 then
      boss.mission = 'boss1'
      boss.phbegin = t
      boss.sy = 0
    end
  end

  if t % 12 == 0 then
    if boss.subphase == 1 then
      fire(boss, 0, 2, 0)
    elseif boss.subphase == 2 then
      fire(boss, 0.25, 2, 0)
    elseif boss.subphase == 3 then
      fire(boss, 0.5, 2, 0)
    elseif boss.subphase == 4 then
      fire(boss, 0.75, 2, 0)
    end
  end

  if boss.phbegin + 8 * 30 < t then
    boss.mission = 'boss1'
    boss.subphase = 1
    boss.subphase = 1
    boss.phbegin = t
  end

  move(boss)
end

function boss5(boss)
  boss.shake = 10
  boss.flash = 10

  if t % 8 == 0 then
    explode(boss.x + rnd(32), boss.y + rnd(24), false)
    sfx(3)
    shake = 2
  end

  if boss.phbegin + 3 * 30 < t then
    if t % 4 == 2 then
      explode(boss.x + 16, boss.y + 20, false)
      sfx(3)
      shake = 2
    end
  end

  if boss.phbegin + 6 * 30 < t then
    flash = 3
    bigexplode(boss.x + 16, boss.y + 20, false)
    del(enemies, boss)
    shake = 16
  end
end