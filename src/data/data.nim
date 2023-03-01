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

proc updateIndividualTask*(id: int, task: Task) =
    var tsks = getTaskList()

    for i in 0 ..< tsks.len:
        if tsks[i].id == id:
            tsks[i] = task

    writeTaskList(tsks)

proc deleteIndividualTask*(id: int) =
    var tsks = getTaskList()

    for i in 0 ..< tsks.len:
        if tsks[i].id == id:
            tsks.delete(i)
            break

    writeTaskList(tsks)
