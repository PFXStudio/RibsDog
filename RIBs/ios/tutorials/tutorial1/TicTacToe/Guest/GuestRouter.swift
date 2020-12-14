//
//  GuestRouter.swift
//  TicTacToe
//
//  Created by PFXStudio on 2020/12/14.
//  Copyright © 2020 Uber. All rights reserved.
//

import RIBs

protocol GuestInteractable: Interactable {
    var router: GuestRouting? { get set }
    var listener: GuestListener? { get set }
}

final class GuestRouter: Router<GuestInteractable>, GuestRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: GuestInteractable) {
        super.init(interactor: interactor)
        interactor.router = self
    }
}
