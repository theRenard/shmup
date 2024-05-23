function spawnwave()
  if wave == 1 then
    attackfreq = 50
    firefreq = 20
    place_enemies({
      {0, 0, 1, 1, 1, 1, 1, 1, 0, 0},
      {0, 0, 1, 1, 1, 1, 1, 1, 0, 0},
      {0, 0, 1, 1, 1, 1, 1, 1, 0, 0},
      {0, 0, 1, 1, 1, 1, 1, 1, 0, 0},
    })
  elseif wave == 2 then
    attackfreq = 40
    firefreq = 20
    place_enemies({
      {0, 0, 2, 2, 2, 2, 2, 2, 0, 0},
      {0, 0, 2, 2, 2, 2, 2, 2, 0, 0},
      {0, 0, 2, 2, 2, 2, 2, 2, 0, 0},
      {0, 0, 2, 2, 2, 2, 2, 2, 0, 0},
    })
  elseif wave == 3 then
    attackfreq = 30
    firefreq = 20
    place_enemies({
      {0, 0, 0, 3, 3, 3, 3, 0, 0, 0},
      {0, 0, 0, 3, 3, 3, 3, 0, 0, 0},
      {0, 0, 0, 3, 3, 3, 3, 0, 0, 0},
      {0, 0, 0, 3, 3, 3, 3, 0, 0, 0},
    })
  elseif wave == 4 then
    attackfreq = 20
    firefreq = 20
    place_enemies({
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 5, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    })
  end
end

function place_enemies(lvl)
  for y=1,4 do
    for x=1,10 do
      if lvl[y][x] > 0 then
        spawnen(lvl[y][x], x*12-6, 10+y*12, x*3+y*3)
      end
    end
  end
end

function nextwave()
  wave += 1

  if wave > lastwave then
    mode = "win"
    lockout = t + 30
    music(4)
  else
    if wave == 1 then
      music(0)
    else
      music(3)
    end

    mode = "wavetext"
    wavetime = 80
  end
end

function check_next_wave()
  --check if wave over
  if mode == "game" and #enemies == 0 then
    ebuls = {}
    nextwave()
  end
end