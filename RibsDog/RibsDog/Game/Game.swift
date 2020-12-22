//
//  Game.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/21.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

public protocol GameListener: class {
    func gameDidEnd(winner: PlayerType?)
}

public protocol GameBuildable: Buildable {
    func build(listener: GameListener) -> ViewableRouting
}

public protocol Game {
    var id: String { get }
    var name: String { get }
    var builder: GameBuildable { get }
}
