import XCTest
@testable import GameOfLife

final class GameOfLifeTests: XCTestCase {
    func testReadBoard() {
        let board = Board(board: ".X.\nX.X")
        XCTAssertEqual(
            board.alive,
            [Cell(x: 2, y: 1), Cell(x: 0, y: 1), Cell(x: 1, y: 0)]
        )
        XCTAssertEqual(board.description, ".....\n..X..\n.X.X.\n.....\n")
    }
    
    func testCellNeighbors() {
        let cell = Cell(x: 4, y: 1)
        XCTAssertEqual(
            cell.neighbors(),
            [Cell(x: 3, y: 0), Cell(x: 3, y: 1), Cell(x: 3, y: 2), Cell(x: 4, y: 0),
             Cell(x: 4, y: 2), Cell(x: 5, y: 0), Cell(x: 5, y: 1), Cell(x: 5, y: 2)]
        )
    }
    
    func testStepEmpty() {
        let board = Board()
        board.step()
        XCTAssertEqual(board.alive, [])
    }
    
    func testStepSingle() {
        let board = Board(board: "X")
        XCTAssertEqual(board.alive, [Cell(x: 0, y: 0)])
        board.step()
        XCTAssertEqual(board.alive, [])
    }
    
    func testCountNeighbors() {
        let board = Board()
        board.alive = [Cell(x: 0, y: 0), Cell(x: 1, y: 1)]
        XCTAssertEqual(
            board.neighborCounts(),
            [
                Cell(x: 1, y: 1): 1,
                Cell(x: -1, y: 1): 1,
                Cell(x: 2, y: 1): 1,
                Cell(x: 2, y: 2): 1,
                Cell(x: 1, y: 2): 1,
                Cell(x: 0, y: 2): 1,
                Cell(x: -1, y: -1): 1,
                Cell(x: 0, y: 0): 1,
                Cell(x: 0, y: 1): 2,
                Cell(x: -1, y: 0): 1,
                Cell(x: 0, y: -1): 1,
                Cell(x: 1, y: -1): 1,
                Cell(x: 1, y: 0): 2,
                Cell(x: 2, y: 0): 1
            ]
        )
    }
    
    static var allTests = [
        ("testReadBoard", testReadBoard),
        ("testCellNeighbors", testCellNeighbors),
        ("testCountNeighbors", testCountNeighbors),
        ("testStepEmpty", testStepEmpty),
        ("testStepSingle", testStepSingle),
    ]
}
