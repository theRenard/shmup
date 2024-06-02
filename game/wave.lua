function update_wavetext()
  update_game()
  wavetime -= 1
  if wavetime <= 0 then
    mode = "game"
    spawnwave()
  end
end

function draw_wavetext()
  draw_game()
  if wave == lastwave then
    cprint("final wave",64,40,blink_color())
  else
    cprint("wave "..wave.. " of "..lastwave,64,40,blink_color())
  end
 end