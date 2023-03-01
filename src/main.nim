# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import data
from types/tasks import Task

when isMainModule:
  let tsks = data.getTaskList()
  for task in tsks:
    echo task

