function spawnen(type, enx, eny, enwait)
  local myen = create_entity()
  myen.x = enx*2-64 or rnd(128)
  myen.y = eny-66 or rnd(128)
  myen.posx = enx or rnd(128)
  myen.posy = eny or rnd(128)
  myen.wait = enwait or 0
  myen.anispd = 0.4
  myen.mission = 'flyin'
  myen.type = type

  if type == nil or type == 1 then
    -- green alien
    myen.spr = 21
    myen.hp = 1
    myen.ani = { 21, 22, 23, 24 }
    myen.score = 1
  elseif type == 2 then
    -- red flame guy
    myen.spr = 148
    myen.hp = 2
    myen.ani = { 148, 149 }
    myen.score = 2
  elseif type == 3 then
    -- spinning ship
    myen.spr = 184
    myen.hp = 3
    myen.ani = { 184, 185, 186, 187 }
    myen.score = 3
  elseif type == 4 then
    -- boss
    myen.spr = 208
    myen.hp = 10
    myen.ani = { 208, 210 }
    myen.sprw = 2
    myen.sprh = 2
    myen.colw = 16
    myen.colh = 16
    myen.score = 10
  elseif type == 5 then
    -- boss
    myen.spr = 68
    myen.hp = 100
    myen.ani = { 68, 72, 76, 72 }
    myen.sprw = 4
    myen.sprh = 3
    myen.colw = 32
    myen.colh = 24

    myen.x = 48
    myen.posx = 48
    myen.y = -24
    myen.posy = 25

    myen.boss = true
    myen.phbegin = 0
  end

  add(enemies, myen)
end