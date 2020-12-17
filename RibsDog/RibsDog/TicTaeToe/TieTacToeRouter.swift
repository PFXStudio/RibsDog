//
//  TieTaeToeRouter.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/16.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol TieTaeToeInteractable: Interactable {
    var router: TieTaeToeRouting? { get set }
    var listener: TieTaeToeListener? { get set }
}

protocol TieTaeToeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TieTaeToeRouter: ViewableRouter<TieTaeToeInteractable, TieTaeToeViewControllable>, TieTaeToeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TieTaeToeInteractable, viewController: TieTaeToeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
