//
//  LoggedInRouter.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener, TicTacToeListener, GameListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

// 상위 RIBs의 Interactor에 전달
protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {
    private let viewController: LoggedInViewControllable
    private let offGameBuilder: OffGameBuildable
    private let ticTacToeBuilder: TicTacToeBuildable
    private var currentChild: ViewableRouting?
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         offGameBuilder: OffGameBuildable,
         ticTacToeBuilder: TicTacToeBuildable) {
        self.viewController = viewController
        self.offGameBuilder = offGameBuilder
        self.ticTacToeBuilder = ticTacToeBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        self.attachOffGame()
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    func attachOffGame() {
        let child = offGameBuilder.build(withListener: interactor)
        self.currentChild = child
        attachChild(child)
        viewController.present(viewController: child.viewControllable)
    }
    
    // MARK: - Private
    private func detachCurrentChild() {
        if let child = self.currentChild {
            detachChild(child)
            viewController.dismiss(viewController: child.viewControllable)
        }        
    }

    func routeToTicTacToe() {
        detachCurrentChild()
        
        let child = self.ticTacToeBuilder.build(withListener: interactor)
        currentChild = child
        attachChild(child)
        viewController.present(viewController: child.viewControllable)
    }
    
    func routeToOffGame(with games: [Game]) {
        
    }
}
