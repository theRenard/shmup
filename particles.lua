function draw_particles()
  --drawing particles
  for part in all(parts) do
    local c = 7

    if part.blue then
      c = page_blue(part.age)
    else
      c = page_red(part.age)
    end

    if part.spark then
      pset(part.x, part.y, 7)
    else
      circfill(part.x, part.y, part.size, c)
    end

    part.x += part.sx
    part.y += part.sy

    part.sx = part.sx * 0.85
    part.sy = part.sy * 0.85

    part.age += 1

    if part.age > part.maxage then
      part.size -= 0.5
      if part.size < 0 then
        del(parts, part)
      end
    end
  end
end

function draw_shwaves()
  --drawing shwaves
  for shwave in all(shwaves) do
    circ(shwave.x, shwave.y, shwave.r, shwave.col)
    shwave.r += shwave.speed
    if shwave.r > shwave.tr then
      del(shwaves, shwave)
    end
  end
end

function draw_floats()
  --floats
  for float in all(floats) do
    local c = 7
    if t % 4 < 2 then
      c = 8
    end
    cprint(float.txt, float.x, float.y, c)
    float.y -= 1
    float.age += 1
    if float.age > 30 then
      del(floats, float)
    end
  end
end