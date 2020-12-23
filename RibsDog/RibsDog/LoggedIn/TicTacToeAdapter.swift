//
//  TicTacToeAdapter.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/19.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

class TicTacToeAdapter: Game, GameBuildable, TicTacToeListener {
    let id: String = "tictactoe"
    let name: String = "Tic Tac Toe"
    let ticTacToeBuilder: TicTacToeBuilder
    var builder: GameBuildable {
        return self
    }
    
    weak var listener: GameListener?
    init(dependency: TicTacToeDependency) {
        self.ticTacToeBuilder = TicTacToeBuilder(dependency: dependency)
    }
    
    func build(listener: GameListener) -> ViewableRouting {
        self.listener = listener
        return self.ticTacToeBuilder.build(withListener: self)
    }
    
    func didEnd(winner: PlayerType?) {
        self.listener?.gameDidEnd(winner: winner)
    }
}
