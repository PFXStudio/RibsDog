//
//  TicTacToeInteractor.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/17.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift

struct GameConstant {
    static let maxRow = 3
    static let maxCol = 3
}

protocol TicTacToeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TicTacToePresentable: Presentable {
    var listener: TicTacToePresentableListener? { get set }
    var updateCellSubject: PublishSubject<(row: Int, col: Int, playerType: PlayerType)> { get set }
//    func setCell
    #warning("파선생 궁금함. 콜백.")
//    func announce(winner: PlayerType?, withCompletionHandler handler: @escaping () -> ())
    func announce(message: String)
}

protocol TicTacToeListener: class {
    func didEnd(winner: PlayerType?)
}

final class TicTacToeInteractor: PresentableInteractor<TicTacToePresentable>, TicTacToeInteractable {
    weak var router: TicTacToeRouting?
    weak var listener: TicTacToeListener?

    private let player1Name: String
    private let player2Name: String
    private var currentPlayer = PlayerType.player1
    private var board = [[PlayerType?]]()
    init(presenter: TicTacToePresentable,
                  player1Name: String,
                  player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        initBoard()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    private func initBoard() {
        for _ in 0..<GameConstant.maxRow {
            board.append([nil, nil, nil])
        }
    }
}

extension TicTacToeInteractor: TicTacToePresentableListener {
    func completed() {
        if let winner = checkWinner() {
            self.listener?.didEnd(winner: winner)
        }
    }
    
    private func getAndFlipCurrentPlayer() -> PlayerType {
        let player = self.currentPlayer
        self.currentPlayer = player == .player1 ? .player2 : .player1
        return player
    }
    
    func placeCurrentPlayerMark(row: Int, col: Int) {
        guard board[row][col] == nil else { return }
        let currentPlayer = getAndFlipCurrentPlayer()
        self.board[row][col] = currentPlayer
        self.presenter.updateCellSubject.onNext((row: row, col: col, playerType: currentPlayer))
        let endGame = checkEndGame()
        if let winner = endGame.winner {
            presenter.announce(message: winner == .player1 ? self.player1Name : self.player2Name)
            return
        }
        
        if endGame.didEnd == true {
            presenter.announce(message: "It's Tie!!!")
            return
        }
    }
    
    func checkEndGame() -> (winner: PlayerType?, didEnd: Bool) {
        if let winner = checkWinner() {
            return (winner as PlayerType, true)
        }
        
        if checkDraw() == true {
            return (nil, true)
        }
        
        return (nil, false)
    }
    
    func checkWinner() -> PlayerType? {
        for row in 0..<GameConstant.maxRow {
            let values = board[row]
            let result = [PlayerType : Int]()
            let check = values.filter {
                $0 != nil
            }
            .reduce(into: result) { (result, playerType) in
                result[playerType] = (result[playerType] ?? 0) + 1
            }

            if check[PlayerType.player1] == 3 {
                return PlayerType.player1
            }
            
            if check[PlayerType.player2] == 3 {
                return PlayerType.player2
            }
        }
        
        for col in 0..<GameConstant.maxCol {
            var values = [board[0][col]]
            values.append(board[1][col])
            values.append(board[2][col])
            let result = [PlayerType : Int]()
            let check = values.filter {
                $0 != nil
            }
            .reduce(into: result) { (result, playerType) in
                result[playerType] = (result[playerType] ?? 0) + 1
            }

            if check[PlayerType.player1] == 3 {
                return PlayerType.player1
            }
            
            if check[PlayerType.player2] == 3 {
                return PlayerType.player2
            }
        }

        var values = [board[0][0]]
        values.append(board[1][1])
        values.append(board[2][2])
        let result = [PlayerType : Int]()
        let check = values.filter {
            $0 != nil
        }
        .reduce(into: result) { (result, playerType) in
            result[playerType] = (result[playerType] ?? 0) + 1
        }

        if check[PlayerType.player1] == 3 {
            return PlayerType.player1
        }
        
        if check[PlayerType.player2] == 3 {
            return PlayerType.player2
        }

        return nil
    }
    
    func checkDraw() -> Bool {
        for row in 0..<GameConstant.maxRow {
            for col in 0..<GameConstant.maxCol {
                if board[row][col] == nil {
                    return false
                }
            }
        }
        
        return true
    }
}
