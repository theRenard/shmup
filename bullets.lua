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

function draw_bullets()
  --drawing bullets
  for mybul in all(buls) do
    -- rectfill(mybul.x,mybul.y, mybul.x + mybul.colw - 1, mybul.y + mybul.colh - 1,8)
    drwmyspr(mybul)
  end
  --drawing bullets
  for myebul in all(ebuls) do
    -- rectfill(myebul.x,myebul.y, myebul.x + myebul.colw - 1, myebul.y + myebul.colh - 1,8)
    drwmyspr(myebul)
  end
end