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
    func setCell(row: Int, col: Int, playerType: PlayerType)
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TicTacToeListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TicTacToeInteractor: PresentableInteractor<TicTacToePresentable>, TicTacToeInteractable {
    weak var router: TicTacToeRouting?
    weak var listener: TicTacToeListener?

    private var currentPlayer = PlayerType.player1
    private var board = [[PlayerType?]]()
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TicTacToePresentable) {
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
    private func getAndFlipCurrentPlayer() -> PlayerType {
        let player = self.currentPlayer
        self.currentPlayer = player == .player1 ? .player2 : .player1
        return player
    }
    
    func placeCurrentPlayerMark(row: Int, col: Int) {
        guard board[row][col] == nil else { return }
        let currentPlayer = getAndFlipCurrentPlayer()
        self.board[row][col] = currentPlayer
        self.presenter.setCell(row: row, col: col, playerType: currentPlayer)
        
        // TODO : check endgame
    }
}
