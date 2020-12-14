//
//  GuestBuilder.swift
//  TicTacToe
//
//  Created by PFXStudio on 2020/12/14.
//  Copyright © 2020 Uber. All rights reserved.
//

import RIBs

protocol GuestDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class GuestComponent: Component<GuestDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol GuestBuildable: Buildable {
    func build(withListener listener: GuestListener) -> GuestRouting
}

final class GuestBuilder: Builder<GuestDependency>, GuestBuildable {

    override init(dependency: GuestDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: GuestListener) -> GuestRouting {
        let component = GuestComponent(dependency: dependency)
        let interactor = GuestInteractor()
        interactor.listener = listener
        return GuestRouter(interactor: interactor)
    }
}
