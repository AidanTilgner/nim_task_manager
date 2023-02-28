var
    filename* = "data/tasks.txt"

proc getTaskList*(): seq[string] =
    var lines = newSeq[string]()
    iterator fitems(name : string) : string = 
        let f = open(name)
        defer: f.close()
        var line : string
        while f.read_line(line):
            yield line
    
    for s in fitems(filename):
        lines.add(s)
    
    return lines