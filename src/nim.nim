# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import data

when isMainModule:
  let tasks = data.getTaskList()
  for task in tasks:
    echo task
