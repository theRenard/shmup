function fire(myen, ang, spd)
  local myebul = create_entity()
  myebul.spr = 32
  myebul.x = myen.x+3
  myebul.y = myen.y+4

  if (myen.type == 4) then
    myebul.x = myen.x+7
    myebul.y = myen.y+6
  elseif myen.boss then
    myebul.x = myen.x+15
    myebul.y = myen.y+22
  end

  myebul.ani = { 32, 33, 34, 33 }
  myebul.anispd = 0.4

  myebul.sx = sin(ang)*spd
  myebul.sy = cos(ang)*spd

  myebul.colw=6
  myebul.colh=6
  myebul.bulmode = true
  if myen.boss != true then
    myen.flash = 3
  end
  sfx(29)
  add(ebuls, myebul)
  return myebul
end

function firespread(myen, num, spd, base)
  base = base or 0
  for i=1,num do
    fire(myen, 1/num*i+base, spd)
  end
end

function aimedfire(myen, spd)
  local myebul = fire(myen, 0, spd)
  local ang = atan2((ship.y+4)-myebul.y, (ship.x+4)-myebul.x)

  myebul.sx = sin(ang)*spd
  myebul.sy = cos(ang)*spd
end

function cherbomb()
  local spc = 0.25/(cherries*2)
  for i=0, cherries * 2 do
    local ang = 0.375 + spc*i
    local newbul = create_entity()
    newbul.x = ship.x
    newbul.y = ship.y - 3
    newbul.spr = 17
    newbul.dmg = 3
    newbul.sx = sin(ang)*4
    newbul.sy = cos(ang)*4
    add(buls, newbul)
  end
  big_shwave(ship.x+4, ship.y+4)
  shake = 10
  muzzle = 5
  sfx(0)
  invul = 60
  flash=3
end