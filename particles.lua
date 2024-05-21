function draw_particles()
  --drawing particles
  for myp in all(parts) do
    local pc=7

    if myp.blue then
     pc=page_blue(myp.age)
    else
     pc=page_red(myp.age)
    end

    if myp.spark then
     pset(myp.x,myp.y,7)
    else
     circfill(myp.x,myp.y,myp.size,pc)
    end

    myp.x+=myp.sx
    myp.y+=myp.sy

    myp.sx=myp.sx*0.85
    myp.sy=myp.sy*0.85

    myp.age+=1

    if myp.age>myp.maxage then
     myp.size-=0.5
     if myp.size<0 then
      del(parts,myp)
     end
    end
   end
end

function draw_shwaves()
  --drawing shwaves
  for mysw in all(shwaves) do
    circ(mysw.x,mysw.y,mysw.r,mysw.col)
    mysw.r+=mysw.speed
    if mysw.r>mysw.tr then
     del(shwaves,mysw)
    end
   end
end

function draw_floats()
  --floats
  for myfloat in all(floats) do
    local mycol = 7
    if t%4<2 then
     mycol=8
    end
    cprint(myfloat.txt,myfloat.x,myfloat.y,mycol)
    myfloat.y-=1
    myfloat.age+=1
    if myfloat.age>30 then
      del(floats,myfloat)
    end
  end
end