//
//  AppComponent.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import Foundation

class AppComponent: Component<EmptyComponent>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
