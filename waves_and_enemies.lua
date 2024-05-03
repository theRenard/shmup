function spawnwave()
  if wave == 1 then
    placens({
      {0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
      {0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
      {0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
      {0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
    })
  elseif wave == 2 then
    placens({
      {1, 1, 2, 1, 1, 1, 1, 2, 1, 1},
      {1, 1, 2, 1, 1, 1, 1, 2, 1, 1},
      {1, 1, 2, 1, 1, 1, 1, 2, 1, 1},
      {1, 1, 2, 1, 1, 1, 1, 2, 1, 1},
    })
  elseif wave == 3 then
    placens({
      {3, 1, 2, 1, 3, 3, 1, 2, 1, 3},
      {3, 1, 2, 1, 3, 3, 1, 2, 1, 3},
      {3, 1, 2, 1, 3, 3, 1, 2, 1, 3},
      {3, 1, 2, 1, 3, 3, 1, 2, 1, 3},
    })
  elseif wave == 4 then
    placens({
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 4, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    })
  end
end

function placens(lvl)
  for y=1,4 do
    for x=1,9 do
      if lvl[y][x] > 0 then
        spawnen(lvl[y][x], x*12-6, 8+y*12)
      end
    end
  end
end

function nextwave()
  wave += 1

  if wave > 4 then
    mode = "win"
    lockout = t + 30
    music(4)
  else
    if wave == 1 then
      music(0)
    else
      music(3)
    end

    mode = "wavetext"
    wavetime = 80
  end
end

function spawnen(entype, enx, eny)
  local myen = makespr()
  myen.x = enx or rnd(128)
  myen.y = eny-66 or rnd(128)
  myen.posx = enx or rnd(128)
  myen.posy = eny or rnd(128)
  myen.mission = 'flyin'

  if entype == nil or entype == 1 then
    -- green alien
    myen.spr = 21
    myen.hp = 1
    myen.ani = { 21, 22, 23, 24 }
  elseif entype == 2 then
    -- red flame guy
    myen.spr = 148
    myen.hp = 2
    myen.ani = { 148, 149 }
  elseif entype == 3 then
    -- spinning ship
    myen.spr = 184
    myen.hp = 3
    myen.ani = { 184, 185, 186, 187 }
  elseif entype == 4 then
    -- boss
    myen.spr = 208
    myen.hp = 10
    myen.ani = { 208, 210 }
    myen.sprw = 2
    myen.sprh = 2
    myen.colw = 16
    myen.colh = 16
  end

  add(enemies, myen)
end