-- SGCraft program V1.0.0
-- Developed by Christophe Daloz - De Los Rios

local sgcraft = peripheral.find("stargate")
local args = {...}

if sgcraft == nil then
  print("No stargate found")
  exit()
end

-- Display informations notice
function notice()
  print("SGCraft Manager V1.0.0")
  print("By Christophe Daloz - De Los Rios")
  print()
end

-- Help of commands
function help(command)
  if command[3] == nil then
    print("List of commands:")
    print()
    print("- dial: dialling the specified stargate address")
    print("- dialling: dialling the specified stargate address")
    print("- iris: open or close iris")
    print("- close: close the wormhole")
    print("- disconnect: close the wormhole")
    print("- energy: print the actual level of energy stored in stargate (for 4 seconds)")
    print("- exit: quit the program")
    print("- quit: quit the program")
    print("- help: display this help")
  elseif command[3] == "dial" or command[3] == "dialling" then
    print("Dialling command help")
    print()
    print("The parameter is an address in different format:")
    print("- aaaaaaa")
    print("- aaaaaaaaa")
    print("- aaaa-aaa")
    print("- aaaa-aaa-aa")
  elseif command[3] == "iris" then
    print("Iris help")
    print()
    print("The parameter is open or close")
  elseif command[3] == "close" or command[3] == "disconnect" then
    print("Not parameters for close command")
  elseif command[3] == "energy" then
    print("Not parameters for energy command")
  elseif command[3] == "exit" or command[3] == "quit" then
    print("Not parameters for exit command")
  elseif command[3] == "help" then
    print("Help command help")
    print()
    print("The parameter is name of command for display help")
  else
    print("Unknown help command")
  end
end

-- Console manager
function console()
  continue = true

  while continue do
    list = {}

    term.clear()
    term.setCursorPos(1, 1)
    notice()
    
    term.write("Command> ")
    local command = read()
    
    local i = 1
    for element in string.gmatch(command, "%S+") do
      list[i] = element
      i = i+1
    end
    
    continue = commands(list)
  end
end

-- Loop event
-- Manage SGCraft events
function eventLoop(command)
  while true do
    local name, p2, p3, p4 = os.pullEvent()

    if name == "sgDialOut" then
      print("Dialling "..command[2])
    elseif name == "sgChevronEngaged" then
      if p3 == 7 or p3 == 9 then
        print("Chevron "..(p3).. "locked")
        os.sleep(2)
        break
      else
        print("Chevron "..(p3).." engaged")
      end
    elseif name == "sgStargateStateChange" then
      if p3 == "Closing" then
        print("Closed in progress")
      elseif p3 == "Offline" or p3 == "Opening" or p3 == "Idle" then
        break
      end
    end
  end
end

-- Console commands
function commands(command)
  if command[1] == "dial" or command[1] == "dialling" then
    if sgcraft.dial(command[2]) == true then
      eventLoop(command)
      return true
    end
  elseif command[1] == "exit" or command[1] == "quit" then
    print("Exiting program")
    os.sleep(1)
    return false
  elseif command[1] == "close" or command[1] == "disconnect" then
    sgcraft.disconnect()
    eventLoop(command)
    return true
  elseif command[1] == "energy" then
    print(sgcraft.energyAvailable())
    os.sleep(4)
    return true
  elseif command[1] == "iris" then
    if command[2] == "open" then
      sgcraft.openIris()
    elseif command[2] == "close" then
      sgcraft.closeIris()
    end
    return true
  else
    print("Command not found")
    os.sleep(2)
    return true
  end
end

console()
