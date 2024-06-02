function init_ship()
  ship=create_entity()
  ship.x=60
  ship.y=90
  ship.sx=0
  ship.sy=0
  ship.spr=2
end

function update_ship()
  --controls
  ship.sx = 0
  ship.sy = 0
  ship.spr = 2
  ship.colw = 7

  if btn(⬅️) then
    ship.sx = -2
    ship.spr = 1
  end
  if btn(➡️) then
    ship.sx = 2
    ship.spr = 3
  end
  if btn(⬆️) then
    ship.sy = -2
  end
  if btn(⬇️) then
    ship.sy = 2
  end

  if btnp(❎) then
    if powerups > 0 then
      cherbomb()
      powerups = 0
    end
  end

  if btn(🅾️) then
    if bultimer <= 0 and can_fire() then
      local newbul = create_entity()
      newbul.x = ship.x + 1
      newbul.y = ship.y - 3
      newbul.spr = 16
      newbul.colw = 5
      newbul.sy = -4
      newbul.dmg = 1

      add(buls, newbul)

      sfx(0)
      muzzle = 5
      bultimer = 4
      decrease_energy_bar()
    end
  end

  if btn(🅾️) then
    is_firing = true
  else
    is_firing = false
  end

  bultimer -= 1

  --moving the ship
  ship.x += ship.sx
  ship.y += ship.sy

  --checking if we hit the edge
  if ship.x > 120 then
    ship.x = 120
  end
  if ship.x < 0 then
    ship.x = 0
  end
  if ship.y < 0 then
    ship.y = 0
  end
  if ship.y > 120 then
    ship.y = 120
  end

  --animate flame
  flamespr = flamespr + 1
  if flamespr > 8 then
    flamespr = 4
  end

  --animate mullze flash
  if muzzle > 0 then
    muzzle = muzzle - 1
  end
end

function draw_muzzle()
  if muzzle>0 then
    circfill(ship.x+3,ship.y-2,muzzle,7)
   end
end

function draw_ship()
  if lives>0 then
    if invul<=0 then
    --  rectfill(ship.x,ship.y, ship.x + ship.colw - 1, ship.y + ship.colh - 1,8)
     drwmyspr(ship)
     spr(flamespr,ship.x,ship.y+8)
    else
      --invul state
      if sin(t/5)<0.1 then
        drwmyspr(ship)
      spr(flamespr,ship.x,ship.y+8)
     end
    end
  end
end

function ship_die()
  explode(ship.x + 4, ship.y + 4, true)
  shake=16
  sfx(1)
  invul=60
  -- ship.x=60
  -- ship.y=100
  lives=lives-1
  fill_energy_bar()
end

