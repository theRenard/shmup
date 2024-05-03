
function spawnwave()
  if wave==1 then
   spawnen(1)

  elseif wave==2 then
   spawnen(2)
  elseif wave==3 then
   spawnen(3)
  elseif wave==4 then
   spawnen(4)
  end
 end

 function nextwave()
  wave+=1

  if wave>4 then
   mode="win"
   lockout=t+30
   music(4)
  else
   if wave==1 then
    music(0)
   else
    music(3)
   end

   mode="wavetext"
   wavetime=80
  end

 end

 function spawnen(entype)
  local myen=makespr()
  myen.x=rnd(120)
  myen.y=-8

  if entype==nil or entype==1 then
   -- green alien
   myen.spr=21
   myen.hp=5
   myen.ani={21,22,23,24}
  elseif entype==2 then
   -- red flame guy
   myen.spr=148
   myen.hp=5
   myen.ani={148,149}
  elseif entype==3 then
   -- spinning ship
   myen.spr=184
   myen.hp=5
   myen.ani={184,185,186,187}
  elseif entype==4 then
   -- boss
   myen.spr=208
   myen.hp=5
   myen.ani={208,210}
   myen.sprw=2
   myen.sprh=2
   myen.colw=16
   myen.colh=16
  end

  add(enemies,myen)
 end