
function draw_game()
  if flash>0 then
    flash-=1
    cls(2)
   else
    cls(0)
   end

  draw_starfield()
  draw_ship()
  draw_muzzle()
  draw_pickups()
  draw_enemies()
  draw_shwaves()
  draw_particles()
  draw_bullets()
  draw_floats()
  draw_hud()
 end

 function makescore(val)
  if val == 0 then
    return "0"
  else
    return val.. "00"
  end
 end
