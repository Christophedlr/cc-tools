-- Wget LUA ComputerCraft implementation
-- Version 1.0.0
-- Developed by Christophe Daloz - De Los Rios


local args = {...}
local link = args[1]
local dest = args[2]

--Copyright notice
function notice()
  print("wget 1.0.0")
  print("By Christophe Daloz - De Los Rios")
  print("Copyright (C) Christophe Daloz - De Los Rios, 2021")
  print()
end

--Usage informations
function usage()
  notice()
  print("Usage: wget link dest")
  print()
  print("link: HTTP link")
  print("dest: destination file")
end

-- Check if the URL is valid and work
function check()
  local success, message = http.checkURL(args[1])
  
  if not success then
    return false
  end
  
  return true
end

function get()
  local content = http.get(args[1])
  local file = fs.open(args[2], "w")
  
  file.write(content.readAll())
  file.close()
  
  print("File download to "..args[2])
end

if table.getn(args) < 1 then
  usage()
  return
end

-- If HTTP module is not enabled,
-- an error is returned and stopped program
if not http then
  error("HTTP module is not enabled")
  return
end


if (check()) then
  get()
else
  error("Invalid URL")
end

