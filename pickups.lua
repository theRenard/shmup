function update_pickups()
  --move pickups
  for mypick in all(pickups) do
    move(mypick)

    if mypick.y > 128 then
      del(pickups, mypick)
    end
  end
end

function draw_pickups()
  --drawing pickups
  for mypick in all(pickups) do
    local pc=0
    if t%4<2 then
     pc=7
    end
    for i=1,15 do
     pal(i,pc)
    end
    drwoutline(mypick)
    pal()
    drwmyspr(mypick)
  end
end