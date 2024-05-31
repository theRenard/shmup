function draw_hud()
  for i=1,4 do
    if lives>=i then
      spr(35,i*9-8,1)
    else
      spr(36,i*9-8,1)
    end
  end

  cprint("score:"..makescore(score),64,3,9)

  palt(0, false)
  palt(3, true)
  spr(50,110,1)
  palt()
  print(powerups,121,3,9)

  print(log, 1, 120, 7)
end