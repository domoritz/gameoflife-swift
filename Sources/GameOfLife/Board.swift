public class Board: CustomStringConvertible {
    var alive: Set<Cell> = []
    
    public init(board: String = "") {
        let rows = board.split(separator: "\n")
        for (y, row) in rows.enumerated() {
            for (x, c) in row.enumerated() {
                if c == "X" {
                    alive.insert(Cell(x: x,y: y))
                }
            }
        }
    }
    
    public func neighborCounts() -> [Cell: Int] {
        var counts: [Cell: Int] = [:]
        for cell in alive {
            for neighbor in cell.neighbors() {
                let count = counts[neighbor] ?? 0
                counts[neighbor] = count + 1
            }
        }
        
        return counts
    }
    
    public func step() {
        var newAlive: Set<Cell> = []
        
        for (key: cell, value: count) in neighborCounts() {
            if count == 3 || alive.contains(cell) && count == 2 {
                newAlive.insert(cell)
            }
        }
        
        alive = newAlive
    }
    
    public var description: String {
        let xs = alive.map {(cell) in
            return cell.x
        }
        let ys = alive.map {(cell) in
            return cell.y
        }
        
        var out = ""
        
        let minX = xs.min() ?? 0
        let maxX = xs.max() ?? 0
        let minY = ys.min() ?? 0
        let maxY = ys.max() ?? 0
        
        for y in minY-1...maxY+1 {
            for x in minX-1...maxX+1 {
                if alive.contains(Cell(x: x, y: y)) {
                    out.append("X")
                } else {
                    out.append(".")
                }
            }
            out.append("\n")
        }
        
        return out
    }
}
