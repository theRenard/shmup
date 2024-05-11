function fire(myen, ang, spd)
  local myebul = makespr()
  myebul.spr = 32
  myebul.x = myen.x+3
  myebul.y = myen.y+4

  if (myen.entype == 4) then
    myebul.x = myen.x+7
    myebul.y = myen.y+6
  end

  myebul.ani = { 32, 33, 34, 33 }
  myebul.anispd = 0.4

  myebul.sx = sin(ang)*spd
  myebul.sy = cos(ang)*spd

  myebul.colw=6
  myebul.colh=6
  myebul.bulmode = true
  myen.flash = 3
  sfx(29)
  add(ebuls, myebul)
end

function firespread(myen, num, spd, base)
  base = base or 0
  for i=1,num do
    fire(myen, 1/num*i+base, spd)
  end
end