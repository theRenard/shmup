function draw_hud()
  for i=1,4 do
    if lives>=i then
      spr(9,i*9-8,1)
    else
      spr(10,i*9-8,1)
    end
  end

  cprint("score:"..makescore(score),64,2,12)

  spr(11,110,1)
  print(cherries,120,2,14)

  print(log, 1, 120, 7)
end