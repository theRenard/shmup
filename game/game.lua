function update_game()
  update_starfield()
  update_ship()
  update_energy_bar()
  update_bullets()
  update_enemies()
  update_pickups()
  update_collisions()
  check_next_wave()
  check_game_over()
end

function draw_game()
  draw_flash()
  draw_starfield()
  draw_ship()
  draw_pickups()
  draw_enemies()
  draw_shwaves()
  draw_particles()
  draw_bullets()
  draw_muzzle()
  draw_floats()
  draw_hud()
  draw_energy_bar()
end