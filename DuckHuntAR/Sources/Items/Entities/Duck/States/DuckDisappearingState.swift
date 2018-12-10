//
//  DuckDisappearingState.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 02.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import GameplayKit

class DuckDisappearingState: GKState {
    
    private let duration: TimeInterval
    private weak var entity: Entity?
    
    init(duration: TimeInterval, parent: Entity) {
        self.duration = duration
        entity = parent
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return false
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        guard let entity = entity else { return }
        
        entity.agentComponent()?.isAvailable = false
        entity.spriteComponent()?.node.runAction(SCNAction.fadeOut(duration: duration))
        entity.soundComponent()?.source = nil
    }
}
