import GameOfLife
import Darwin

let board = Board(board: "......X.\nXX......\n.X...XXX")

for _ in 0...130 {
    board.step()
    print("\u{001B}[2J")
    print(board)
    usleep(200000)
}
