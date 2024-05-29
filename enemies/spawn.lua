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
  myen.anispd = 0.5 + rnd(0.2)

  if type == nil or type == 1 then
    -- red alien
    myen.spr = 128
    myen.hp = 1
    myen.ani = create_numbers(128, 142)
    myen.score = 1
  elseif type == 2 then
    -- green alien
    myen.spr = 144
    myen.hp = 2
    myen.ani = create_numbers(144, 158)
    myen.score = 2
  elseif type == 3 then
    -- pink
    myen.spr = 160
    myen.hp = 3
    myen.ani = create_numbers(160, 174)
    myen.score = 3
  elseif type == 4 then
    -- blue
    myen.spr = 176
    myen.hp = 3
    myen.ani = create_numbers(176, 190)
    myen.score = 4
  elseif type == 5 then
    -- metal
    myen.spr = 92
    myen.hp = 4
    myen.ani = create_numbers(192, 206)
    myen.score = 5
  elseif type == 6 then
    -- star
    myen.spr = 208
    myen.hp = 4
    myen.ani = create_numbers(208, 222)
    myen.score = 6
  elseif type == 7 then
    -- claws
    myen.spr = 224
    myen.hp = 4
    myen.ani = create_numbers(224, 238)
    myen.score = 7
  elseif type == 8 then
    -- boss
    myen.spr = 68
    myen.hp = 100
    myen.ani = { 68, 68, 72 }
    myen.anispd = 0.1
    myen.sprw = 4
    myen.sprh = 4
    myen.colw = 32
    myen.colh = 24

    myen.x = 48
    myen.posx = 48
    myen.y = -32
    myen.posy = 25

    myen.boss = true
    myen.phbegin = 0
  end

  add(enemies, myen)
end