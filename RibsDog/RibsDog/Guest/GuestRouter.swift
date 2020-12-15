//
//  GuestRouter.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol GuestInteractable: Interactable {
    var router: GuestRouting? { get set }
    var listener: GuestListener? { get set }
}

protocol GuestViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class GuestRouter: Router<GuestInteractable>, GuestRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: GuestInteractable, viewController: GuestViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    // MARK: - Private

    private let viewController: GuestViewControllable
}
