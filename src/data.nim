from types/tasks import Task
import json

var
    filename* = "data/tasks.json"

proc getTaskList*(): seq[Task] =
    let tasksJson = open(filename)
    defer: tasksJson.close()
    let jsonObject = json.parseJson(tasksJson.readAll())
    let tsks = json.to(jsonObject, seq[Task])
    
    return tsks

proc writeTaskList*(tsks: seq[Task]) =
    let tasksJson = open(filename, fmWrite)
    defer: tasksJson.close()
    let newTasks = %* tsks
    tasksJson.write(newTasks.pretty())

proc getIndividualTask*(id: int): Task | typeof(nil) =
    let tsks = getTaskList()
    
    for task in tsks:
        if task.id == id:
            return task
    
    return nil