//
//  LoggedInInteractor.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
    func cleanupViews()
    func routeToTicTacToe()
    func routeToOffGame(with games: [Game])
}

protocol LoggedInListener: class {
}

final class LoggedInInteractor: Interactor, LoggedInInteractable {
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?
    private var games = [Game]()

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
    
    func gameDidEnd(winner: PlayerType?) {
        router?.routeToOffGame(with: games)
    }
}

extension LoggedInInteractor {
    func requestStart() {
        router?.routeToTicTacToe()
    }
    
    func didEnd(winner: PlayerType?) {
        
    }
}
