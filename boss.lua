function boss1(boss)
  local spd = 2

  if boss.sx == 0 or boss.x >= 93 then
    boss.sx =-spd
  end

  if boss.x <= 3 then
    boss.sx = spd
  end

  if t%30 > 1 then
    if t%3 == 0 then
      fire(boss, 0, 1)
    end
  end

  -- if boss.phbegin+ 8*30 < t then
  if boss.phbegin < t then
    boss.mission = 'boss2'
    boss.subphase = 1
    boss.phbegin = t
  end
  move(boss)
end

function boss2(boss)

  local spd = 1.5
  if boss.subphase == 1 then
    boss.sx =- spd
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
    boss.sy =- spd
    if boss.y <= 25 then
      boss.mission = 'boss3'
      boss.phbegin = t
    end
  end

  if t%15 == 0 then
    aimedfire(boss, 2)
  end

  move(boss)
end

function boss3(boss)
  if boss.phbegin+ 8*30 < t then
    boss.mission = 'boss2'
    boss.phbegin = t
  end
  move(boss)
end

function boss4(boss)
  if boss.phbegin+ 8*30 < t then
    boss.mission = 'boss2'
    boss.phbegin = t
  end
  move(boss)
end

function boss5(boss)

end