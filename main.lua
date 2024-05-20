
function _init()
  --this will clear the screen
  cls(0)

  cartdata("lerenard_shmup");
  highscore=dget(0)

  startscreen()
  blinkt=1
  t=0
  lockout=0
  shake=0
  flash=0
  version="v1.0"
 end

 function _update()
  t+=1

  blinkt+=1

  if mode=="game" then
   update_game()
  elseif mode=="start" then
   update_start()
  elseif mode=="wavetext" then
   update_wavetext()
  elseif mode=="over" then
   update_over()
  elseif mode=="win" then
   update_win()
  end

 end

 function _draw()

  doshake()

  if mode=="game" then
   draw_game()
  elseif mode=="start" then
   draw_start()
  elseif mode=="wavetext" then
   draw_wavetext()
  elseif mode=="over" then
   draw_over()
  elseif mode=="win" then
   draw_win()
  end

 end

 function startscreen()
  makestars()
  mode="start"
  music(7)
 end

 function startgame()
  t=0
  wave=0
  lastwave=4
  nextwave()

  ship=makespr()
  ship.x=60
  ship.y=90
  ship.sx=0
  ship.sy=0
  ship.spr=2

  flamespr=5

  bultimer=0
  firefreq=20

  muzzle=0

  score=0
  highscore=0
  cherries=0

  lives=4
  invul=0
  attackfreq=60
  nextfire=0

  buls={}
  ebuls={}
  enemies={}
  parts={}
  shwaves={}
  pickups={}
  floats={}

  log=""

 end

