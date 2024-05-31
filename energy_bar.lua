function decrease_energy_bar()
  energy_bar = energy_bar - 2
  if energy_bar < 0 then
    energy_bar = 0
  end
end

function update_energy_bar()
  if t % 5 == 0 and not is_firing then
    if energy_bar <= 40 then
      energy_bar += 2
    else
      energy_bar += 1
    end
    if energy_bar > 80 then
      energy_bar = 80
    end
  end
end

function fill_energy_bar()
  energy_bar = 80
end

function can_fire()
  return energy_bar > 0
end

function draw_energy_bar()
  local color = 10
  local x0 = 24
  local y0 = 124
  local x1 = energy_bar + 24
  local y1 = 124

  if energy_bar < 40 then
    color = 9
  end

  if energy_bar < 10 then
    color = 8
  end

  -- main bar
  rectfill(x0, y0, 104, y1, 1)
  rectfill(x0, y0, x1, y1, color)
end