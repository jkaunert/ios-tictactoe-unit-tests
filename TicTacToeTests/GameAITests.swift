//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
         x o -
         x o -
         x - -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    
    func testIncompleteGame() {
        // FIXME: - not sure what constitutes an incomplete
        let incomplete = GameBoard()
        
        XCTAssertFalse(incomplete.isFull)
        
        let isWonByX = game(board: incomplete, isWonBy: .x)
        XCTAssertFalse(isWonByX, "Its X's Turn.")
        let isWonByO = game(board: incomplete, isWonBy: .o)
        XCTAssertFalse(isWonByO, "Its O's Turn.")
    }
    
    func testCatsGame() {
        
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (x: 0, y: 0))
        try! board.place(mark: .o, on: (x: 1, y: 0))
        try! board.place(mark: .x, on: (x: 2, y: 0))
        try! board.place(mark: .x, on: (x: 0, y: 1))
        try! board.place(mark: .o, on: (x: 1, y: 1))
        try! board.place(mark: .x, on: (x: 2, y: 1))
        try! board.place(mark: .o, on: (x: 0, y: 2))
        try! board.place(mark: .x, on: (x: 1, y: 2))
        try! board.place(mark: .o, on: (x: 2, y: 2))
        
        XCTAssertTrue(board.isFull, "Tie games only occur with a full board")
        
        let isWonByX = game(board: board, isWonBy: .x)
        XCTAssertFalse(isWonByX, "Tie games cannot have a winner")
        let isWonByO = game(board: board, isWonBy: .o)
        XCTAssertFalse(isWonByO, "Time games cannot have a winner")
    }
    
    func testEmptyBoard() {
        let empty = GameBoard()
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                let mark = empty[(x: x, y: y)]
                XCTAssertNil(mark, "Postion (\(x), \(y)) should be empty")
            }
        }
    }
}
