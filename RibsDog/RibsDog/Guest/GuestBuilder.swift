//
//  GuestBuilder.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol GuestDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var GuestViewController: GuestViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class GuestComponent: Component<GuestDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var GuestViewController: GuestViewControllable {
        return dependency.GuestViewController
    }

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
        return GuestRouter(interactor: interactor, viewController: component.GuestViewController)
    }
}
