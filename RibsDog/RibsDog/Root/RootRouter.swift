//
//  RootRouter.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

// interactor는 RootInteractable을 채택해야 자신의 라우터와 다른 RIBs의 Interactor에 접근 가능하다.
protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {
    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOut: ViewableRouting?
    private let loggedInBuilder: LoggedInBuildable
    
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuilder: LoggedOutBuildable, loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToLoggedOut()
    }
    
    private func routeToLoggedOut() {
        let loggedOut = self.loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
}

extension RootRouter: RootRouting {
    func routeToLoggedIn(player1: String, player2: String) {
        if let loggedOut = self.loggedOut {
            detachChild(loggedOut)
            self.viewController.dismiss(viewController: loggedOut.viewControllable)
            self.loggedOut = nil
        }
        
        let loggedIn = self.loggedInBuilder.build(withListener: self.interactor,
                                                  player1Name: player1,
                                                  player2Name: player2
        )
        attachChild(loggedIn)
    }
}
