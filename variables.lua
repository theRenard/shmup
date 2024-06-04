function reset_game()
  -- timers
  blinkt=1
  t=0
  lockout=0
  shake=0
  flash=0
  flamespr=5
  bultimer=0
  firefreq=20
  muzzle=0
  invul=0
  nextfire=0
  energy_bar=80
  is_firing=false

  -- Entities
  buls={}
  ebuls={}
  enemies={}
  parts={}
  shwaves={}
  pickups={}
  floats={}

  -- Gameplay
  score=0
  highscore=0
  powerups=0
  wave=0 -- 1-indexed
  lastwave=15
  lives=4
  attackfreq=60
  pickupFreq=0.1

  -- info
  log=""
  version="v1.1"
end