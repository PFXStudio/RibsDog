//
//  AppComponent.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/05.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import Foundation
import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
