function update_game()
  if mode == "wavetext" then
    animatestars(2)
  else
    animatestars()
  end

  update_ship()
  update_bullets()
  update_enemies()
  update_pickups()
  update_collisions()

  picktimer()

  check_next_wave()
  check_game_over()
end
