//
//  TicTacToeRouter.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/17.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol TicTacToeInteractable: Interactable {
    var router: TicTacToeRouting? { get set }
    var listener: TicTacToeListener? { get set }
}

protocol TicTacToeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TicTacToeRouter: ViewableRouter<TicTacToeInteractable, TicTacToeViewControllable>, TicTacToeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TicTacToeInteractable, viewController: TicTacToeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
