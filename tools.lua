function starfield()
  for i = 1, #stars do
    local mystar = stars[i]
    local scol = 6

    if mystar.spd < 1 then
      scol = 1
    elseif mystar.spd < 1.5 then
      scol = 13
    end

    pset(mystar.x, mystar.y, scol)
  end
end

function animatestars()
  for i = 1, #stars do
    local mystar = stars[i]
    mystar.y = mystar.y + mystar.spd
    if mystar.y > 128 then
      mystar.y = mystar.y - 128
    end
  end
end

function blink()
  local banim = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 7, 7, 6, 6, 5 }

  if blinkt > #banim then
    blinkt = 1
  end

  return banim[blinkt]
end

function drwoutline(myspr)
  spr(myspr.spr, myspr.x, myspr.y, myspr.sprw, myspr.sprh)
  spr(myspr.spr, myspr.x - 1, myspr.y, myspr.sprw, myspr.sprh)
  spr(myspr.spr, myspr.x + 1, myspr.y, myspr.sprw, myspr.sprh)
  spr(myspr.spr, myspr.x, myspr.y - 1, myspr.sprw, myspr.sprh)
  spr(myspr.spr, myspr.x, myspr.y + 1, myspr.sprw, myspr.sprh)
end

function drwmyspr(myspr)
  local sprx = myspr.x
  local spry = myspr.y

  if myspr.shake > 0 then
    myspr.shake -= 1
    --sprx += abs(sin(t/2.5)*1.5)
    if t % 4 < 2 then
      sprx += 1
    end
  end

  if myspr.bulmode then
    sprx -= 2
    spry -= 2
  end

  spr(myspr.spr, sprx, spry, myspr.sprw, myspr.sprh)
end

function col(a, b)
  local a_left = a.x
  local a_top = a.y
  local a_right = a.x + a.colw - 1
  local a_bottom = a.y + a.colh - 1

  local b_left = b.x
  local b_top = b.y
  local b_right = b.x + b.colw - 1
  local b_bottom = b.y + b.colh - 1

  if a_top > b_bottom then return false end
  if b_top > a_bottom then return false end
  if a_left > b_right then return false end
  if b_left > a_right then return false end

  return true
end

function explode(expx, expy, isblue)
  local myp = {}
  myp.x = expx
  myp.y = expy

  myp.sx = 0
  myp.sy = 0

  myp.age = 0
  myp.size = 10
  myp.maxage = 0
  myp.blue = isblue

  add(parts, myp)

  for i = 1, 30 do
    local myp = {}
    myp.x = expx
    myp.y = expy

    myp.sx = rnd() * 6 - 3
    myp.sy = rnd() * 6 - 3

    myp.age = rnd(2)
    myp.size = 1 + rnd(4)
    myp.maxage = 10 + rnd(10)
    myp.blue = isblue

    add(parts, myp)
  end

  for i = 1, 20 do
    local myp = {}
    myp.x = expx
    myp.y = expy

    myp.sx = (rnd() - 0.5) * 10
    myp.sy = (rnd() - 0.5) * 10

    myp.age = rnd(2)
    myp.size = 1 + rnd(4)
    myp.maxage = 10 + rnd(10)
    myp.blue = isblue
    myp.spark = true

    add(parts, myp)
  end

  big_shwave(expx, expy)
end

function page_red(page)
  local col = 7

  if page > 5 then
    col = 10
  end
  if page > 7 then
    col = 9
  end
  if page > 10 then
    col = 8
  end
  if page > 12 then
    col = 2
  end
  if page > 15 then
    col = 5
  end

  return col
end

function page_blue(page)
  local col = 7

  if page > 5 then
    col = 6
  end
  if page > 7 then
    col = 12
  end
  if page > 10 then
    col = 13
  end
  if page > 12 then
    col = 1
  end
  if page > 15 then
    col = 1
  end

  return col
end

function smol_shwave(shx, shy)
  local mysw = {}
  mysw.x = shx
  mysw.y = shy
  mysw.r = 3
  mysw.tr = 6
  mysw.col = 9
  mysw.speed = 1
  add(shwaves, mysw)
end

function big_shwave(shx, shy)
  local mysw = {}
  mysw.x = shx
  mysw.y = shy
  mysw.r = 3
  mysw.tr = 25
  mysw.col = 7
  mysw.speed = 3.5
  add(shwaves, mysw)
end

function smol_spark(sx, sy)
  --for i=1,2 do
  local myp = {}
  myp.x = sx
  myp.y = sy

  myp.sx = (rnd() - 0.5) * 8
  myp.sy = (rnd() - 1) * 3

  myp.age = rnd(2)
  myp.size = 1 + rnd(4)
  myp.maxage = 10 + rnd(10)
  myp.spark = true

  add(parts, myp)
  --end
end

function makespr()
  local myspr = {}
  myspr.x = 0
  myspr.y = 0
  myspr.sx = 0
  myspr.sy = 0
  myspr.flash = 0
  myspr.shake = 0
  myspr.aniframe = 1
  myspr.spr = 0
  myspr.sprw = 1
  myspr.sprh = 1
  myspr.colw = 8
  myspr.colh = 8
  return myspr
end

function animate(entity)
  entity.aniframe += entity.anispd
  if flr(entity.aniframe) > #entity.ani then
    entity.aniframe = 1
  end
  entity.spr = entity.ani[flr(entity.aniframe)]
end

function doshake()
  local shakex = rnd(shake) - shake / 2
  local shakey = rnd(shake) - shake / 2
  camera(shakex, shakey)

  if shake > 10 then
    shake *= 0.9
  else
    shake -= 1
    if shake < 1 then
      shake = 0
    end
  end
end

function popfloat(fltxt, flx, fly)
  local fl = {}
  fl.x = flx
  fl.y = fly
  fl.txt = fltxt
  fl.age = 0
  add(floats, fl)
end

function cprint(txt, x, y, col)
  print(txt, x-#txt*2, y, col)
end