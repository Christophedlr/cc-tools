-- Farming program V1.0.0
-- Developed by Christophe DALOZ - DE LOS RIOS <christophedlr@gmail.com>
-- Copyright (C) 2021 Christophe DALOZ - DE LOS RIOS


-- Action to command
-- @param string cmd Command name
-- @param int num Number of times the action is performed
-- @return bool true if action has been executed, false if command not found
function command(cmd, num)
  if num == nil then
    num = 1
  end

  if (string.upper(cmd) == 'D') then
    for i=1,num do
      turtle.down()
    end
  elseif (string.upper(cmd) == 'U') then
    for i=1,num do
      turtle.up()
    end
  elseif (string.upper(cmd) == 'L') then
    for i=1,num do
      turtle.turnLeft()
    end
  elseif (string.upper(cmd) == 'R') then
    for i=1,num do
      turtle.turnRight()
    end
  elseif (string.upper(cmd) == 'F') then
    for i=1,num do
      turtle.forward()
    end
  elseif (string.upper(cmd) == 'B') then
    for i=1,num do
      turtle.back()
    end
  elseif (string.upper(cmd) == 'T') then
    turtle.suck(num)
  elseif (string.upper(cmd) == 'G') then
    if (num == 1) then
      turtle.drop()
    else
      turtle.drop(num)
    end
  elseif (string.upper(cmd) == 'S') then
    turtle.select(num)
  elseif (string.upper(cmd) == 'I') then
    turtle.dig()
  elseif (string.upper(cmd) == 'J') then
    turtle.digDown()
  elseif (string.upper(cmd) == 'K') then
    turtle.digUp()
  elseif (string.upper(cmd) == 'P') then
    turtle.place()
  else
    return false
  end

  return true
end

-- Parse string for retrieve command & optionally number
-- @param string str String for parsing
function separate(str)
  cmd = string.sub(str, 1, 1)
  num = 1

  if (string.len(str) > 1) then
    num = tonumber(string.sub(str, 3))
  end

  command(cmd, num)
end

-- Execute routine
function execute()
  if (fs.exists('actions.txt')) then
    handle = fs.open('actions.txt', 'r')
    line = handle.readLine()

    while (true) do
      i = string.find(line, '|')

      if (i ~= nil) then
        separate(string.sub(line, 1, i-1))
        line = string.sub(line, i+1)
      else
        separate(line)
        break
      end
    end

    handle.close()
  end
end

execute()
