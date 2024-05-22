function makestars()
  stars = {}
  for i = 1, 100 do
    local newstar = {}
    newstar.x = flr(rnd(128))
    newstar.y = flr(rnd(128))
    newstar.spd = rnd(1.5) + 0.5
    add(stars, newstar)
  end
end

function draw_starfield()
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

function animatestars(spd)
  local spd = spd or 1

  for i = 1, #stars do
    local mystar = stars[i]
    mystar.y = mystar.y + mystar.spd * spd
    if mystar.y > 128 then
      mystar.y = mystar.y - 128
    end
  end
end

function update_starfield()
  if mode == "wavetext" then
    animatestars(2)
  else
    animatestars()
  end
end