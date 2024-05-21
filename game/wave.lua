function update_wavetext()
  update_game()
  wavetime -= 1
  if wavetime <= 0 then
    mode = "game"
    spawnwave()
  end
end

