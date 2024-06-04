function spawnwave()
  if wave == 1 then
    attackfreq = 60
    firefreq = 10
    pickupFreq = 0.1
    -- test = 7
    -- place_enemies({
    --   { test, test, test, test, test, test, test, test, test, test },
    --   { test, test, test, test, test, test, test, test, test, test },
    --   { test, test, test, test, test, test, test, test, test, test },
    --   { test, test, test, test, test, test, test, test, test, test }
    -- })
    place_enemies({
      { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 },
      { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 },
      { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 },
      { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 }
    })
  elseif wave == 2 then
    attackfreq = 60
    firefreq = 10
    pickupFreq = 0.1
    place_enemies({
      { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
      { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
      { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
      { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 }
    })
  elseif wave == 3 then
    attackfreq = 120
    firefreq = 5
    pickupFreq = 0.1
    place_enemies({
      { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
      { 1, 2, 1, 1, 1, 1, 1, 1, 2, 1 },
      { 1, 2, 1, 1, 1, 1, 1, 1, 2, 1 },
      { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    })
  elseif wave == 4 then
    attackfreq = 120
    firefreq = 10
    pickupFreq = 0.1
    place_enemies({
      { 3, 2, 1, 0, 0, 0, 0, 1, 2, 3 },
      { 0, 3, 2, 1, 1, 1, 1, 2, 3, 0 },
      { 0, 0, 3, 2, 3, 3, 2, 3, 0, 0 },
      { 0, 0, 0, 3, 0, 0, 3, 0, 0, 0 }
    })
  elseif wave == 5 then
    attackfreq = 30
    firefreq = 10
    pickupFreq = 0.1
    place_enemies({
      { 0, 2, 2, 0, 0, 0, 0, 2, 2, 0 },
      { 1, 3, 3, 1, 0, 0, 1, 3, 3, 1 },
      { 1, 3, 3, 1, 0, 0, 1, 3, 3, 1 },
      { 0, 1, 1, 0, 0, 0, 0, 1, 1, 0 }
    })
  elseif wave == 6 then
    attackfreq = 60
    firefreq = 10
    pickupFreq = 0.1
    place_enemies({
      { 4, 0, 4, 0, 4, 0, 4, 0, 4, 0 },
      { 0, 4, 0, 4, 0, 4, 0, 4, 0, 4 },
      { 4, 0, 4, 0, 4, 0, 4, 0, 4, 0 },
      { 0, 4, 0, 4, 0, 4, 0, 4, 0, 4 }
    })
  elseif wave == 7 then
    attackfreq = 10
    firefreq = 10
    pickupFreq = 0.2
    place_enemies({
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 },
      { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 }
    })
  elseif wave == 8 then
    attackfreq = 120
    firefreq = 10
    pickupFreq = 0.1
    place_enemies({
      { 0, 6, 6, 0, 0, 0, 0, 6, 6, 0 },
      { 6, 6, 6, 6, 0, 0, 6, 6, 6, 6 },
      { 5, 6, 6, 5, 0, 0, 5, 6, 6, 5 },
      { 0, 5, 5, 0, 0, 0, 0, 5, 5, 0 }
    })
  elseif wave == 9 then
    attackfreq = 120
    firefreq = 10
    pickupFreq = 0.2
    place_enemies({
      { 7, 0, 0, 1, 1, 1, 1, 0, 0, 7 },
      { 7, 0, 0, 1, 1, 1, 1, 0, 0, 7 },
      { 7, 0, 0, 1, 1, 1, 1, 0, 0, 7 },
      { 7, 0, 0, 5, 5, 5, 5, 0, 0, 7 }
    })
  elseif wave == 10 then
    attackfreq = 10
    firefreq = 10
    pickupFreq = 0.2
    place_enemies({
      { 1, 0, 2, 3, 3, 3, 3, 2, 0, 1 },
      { 1, 0, 2, 3, 3, 3, 3, 2, 0, 1 },
      { 0, 0, 0, 7, 7, 7, 7, 0, 0, 0 },
      { 0, 0, 0, 7, 7, 7, 7, 0, 0, 0 }
    })
  elseif wave == 11 then
    attackfreq = 30
    firefreq = 60
    pickupFreq = 0.2
    place_enemies({
      { 3, 1, 3, 6, 6, 6, 6, 3, 1, 3 },
      { 3, 1, 3, 6, 6, 6, 6, 3, 1, 3 },
      { 0, 7, 0, 7, 7, 7, 7, 0, 7, 0 },
      { 0, 7, 0, 1, 1, 1, 1, 0, 7, 0 }
    })
  elseif wave == 12 then
    attackfreq = 240
    firefreq = 5
    pickupFreq = 0.2
    place_enemies({
      { 1, 2, 5, 7, 7, 7, 7, 5, 2, 1 },
      { 0, 1, 2, 5, 5, 5, 5, 2, 1, 0 },
      { 0, 0, 1, 2, 2, 2, 2, 1, 0, 0 },
      { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 }
    })
  elseif wave == 13 then
    attackfreq = 240
    firefreq = 10
    pickupFreq = 0.2
    place_enemies({
      { 4, 5, 5, 6, 6, 6, 6, 5, 5, 4 },
      { 0, 4, 5, 5, 5, 5, 5, 5, 4, 0 },
      { 0, 0, 4, 5, 5, 5, 5, 4, 0, 0 },
      { 0, 0, 0, 4, 4, 4, 4, 0, 0, 0 }
    })
  elseif wave == 14 then
    attackfreq = 120
    firefreq = 3
    pickupFreq = 0.2
    place_enemies({
      { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1 }
    })
  elseif wave == 15 then
    attackfreq = 10
    firefreq = 10
    pickupFreq = 0.2
    place_enemies({
      { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
      { 0, 0, 0, 0, 8, 0, 0, 0, 0, 0 },
      { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
      { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    })
  end
end

function place_enemies(lvl)
  for y = 1, 4 do
    for x = 1, 10 do
      if lvl[y][x] > 0 then
        spawnen(lvl[y][x], x * 12 - 6, 10 + y * 12, x * 3 + y * 3)
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