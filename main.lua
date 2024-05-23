function _init()
  cls(0)
  reset_game()
  cartdata("lerenard_shmup")
  highscore = dget(0)
  startscreen()
  init_ship()
end

function _update()
  t += 1
  blinkt += 1

  if mode == "game" then
    update_game()
  elseif mode == "start" then
    update_start()
  elseif mode == "wavetext" then
    update_wavetext()
  elseif mode == "over" then
    update_over()
  elseif mode == "win" then
    update_win()
  end
end

function _draw()
  draw_shake()

  if mode == "game" then
    draw_game()
  elseif mode == "start" then
    draw_start()
  elseif mode == "wavetext" then
    draw_wavetext()
  elseif mode == "over" then
    draw_over()
  elseif mode == "win" then
    draw_win()
  end
end

function startscreen()
  makestars()
  mode = "start"
  music(7)
end

function startgame()
  t = 0
  reset_game()
  nextwave()
end