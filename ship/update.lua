function update_ship()
  --controls
  ship.sx = 0
  ship.sy = 0
  ship.spr = 2

  if btn(0) then
    ship.sx = -2
    ship.spr = 1
  end
  if btn(1) then
    ship.sx = 2
    ship.spr = 3
  end
  if btn(2) then
    ship.sy = -2
  end
  if btn(3) then
    ship.sy = 2
  end

  if btnp(4) then
    if cherries > 0 then
      cherbomb()
      cherries = 0
    end
  end

  if btn(5) then
    if bultimer <= 0 then
      local newbul = create_entity()
      newbul.x = ship.x + 1
      newbul.y = ship.y - 3
      newbul.spr = 16
      newbul.colw = 6
      newbul.sy = -4
      newbul.dmg = 1

      add(buls, newbul)

      sfx(0)
      muzzle = 5
      bultimer = 4
    end
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
  if flamespr > 9 then
    flamespr = 5
  end

  --animate mullze flash
  if muzzle > 0 then
    muzzle = muzzle - 1
  end
end