local hp_high = 4
local hp_mid = 3
local hp_low = 2
local sp_high = 3
local sp_mid = 2
local sp_low = 1
local score_high = 3
local score_mid = 2
local score_low = 1

function spawnen(type, enx, eny, enwait)
  local myen = create_entity()
  myen.x = enx*2-64 or rnd(128)
  myen.y = eny-66 or rnd(128)
  myen.posx = enx or rnd(128)
  myen.posy = eny or rnd(128)
  myen.wait = enwait or 0
  myen.mission = 'flyin'
  myen.type = type
  myen.speed = 1
  myen.anispd = 0.1 + rnd(0.2)

  -- red alien
  if type == nil or type == 1 then
    myen.spr = 128
    myen.spr_ref = 128
    myen.ani = create_numbers(128, 142)
    myen.hp = hp_low
    myen.score = score_low
    myen.speed = sp_mid

    -- green alien
  elseif type == 2 then
    myen.spr = 144
    myen.spr_ref = 144
    myen.ani = create_numbers(144, 158)
    myen.hp = hp_high
    myen.score = score_mid
    myen.speed = sp_low

  -- squid
  elseif type == 3 then
    myen.spr = 160
    myen.spr_ref = 160
    myen.ani = create_numbers(160, 174)
    myen.hp = hp_low
    myen.score = score_mid
    myen.speed = sp_low

  -- invisible
  elseif type == 4 then
    myen.spr = 176
    myen.spr_ref = 176
    myen.ani = create_numbers(176, 190)
    myen.hp = hp_mid
    myen.score = score_high
    myen.speed = sp_low
    myen.invul = true

    -- metal
  elseif type == 5 then
    myen.spr = 192
    myen.spr_ref = 192
    myen.ani = create_numbers(192, 206)
    myen.hp = hp_high
    myen.score = score_high
    myen.invul = true

    -- star
  elseif type == 6 then
    myen.spr = 208
    myen.spr_ref = 208
    myen.ani = create_numbers(208, 222)
    myen.hp = hp_mid
    myen.score = score_mid

    -- egg
  elseif type == 7 then
    myen.spr = 224
    myen.spr_ref = 224
    myen.ani = create_numbers(224, 238)
    myen.hp = hp_high
    myen.score = score_high
    myen.invul = true

  -- boss
  elseif type == 8 then
    myen.spr = 68
    myen.hp = 150
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