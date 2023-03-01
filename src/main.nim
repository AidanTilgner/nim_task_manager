# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import ui/menu

when isMainModule:
  menu.displayWelcomeMessage()
  menu.displayMenu()
  var picked: char = ' '

  while picked != 'q':
    echo "What would you like to do?"
    picked = menu.awaitMenuInput()

    case picked:
    of '1':
      echo "You picked 1"
    of '2':
      echo "You picked 2"
    of '3':
      echo "You picked 3"
    of '4':
      echo "You picked 4"
    of '5':
      echo "You picked 5"
    of '6':
      echo "You picked 6"
    of 'q':
      echo "You picked q"
    else:
      echo "You picked something else"
