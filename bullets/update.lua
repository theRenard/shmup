function update_bullets()
  --move the bullets
  for mybul in all(buls) do
    move(mybul)

    if mybul.y < -8 then
      del(buls, mybul)
    end
  end

  --move the enemy bullets
  for mybul in all(ebuls) do
    move(mybul)
    animate(mybul)

    if mybul.y > 128 or mybul.x < -8 or mybul.x > 128 or mybul.y < -8 then
      del(ebuls, mybul)
    end
  end



end