//
//  GuestInteractor.swift
//  TicTacToe
//
//  Created by PFXStudio on 2020/12/14.
//  Copyright © 2020 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol GuestRouting: Routing {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol GuestListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class GuestInteractor: Interactor, GuestInteractable {

    weak var router: GuestRouting?
    weak var listener: GuestListener?

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
