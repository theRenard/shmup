function update_pickups()
  --move pickups
  for mypick in all(pickups) do
    move(mypick)

    if mypick.y > 128 then
      del(pickups, mypick)
    end
  end
end