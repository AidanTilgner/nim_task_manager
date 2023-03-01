proc displayWelcomeMessage*() =
    echo """
    Welcome to the Task Manager!
    """

proc displayMenu*() =
    echo """
[1] Get all tasks
[2] Get a task
[3] Add a task
[4] Update a task
[5] Delete a task
[6] Search tasks
Select an Option:
    """

proc awaitMenuInput*(): char =
    echo "> "
    let input = readChar(stdin)
    return input
