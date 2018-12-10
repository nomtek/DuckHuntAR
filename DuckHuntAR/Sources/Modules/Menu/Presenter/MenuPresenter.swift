//
//  MenuPresenter.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 08.03.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import Foundation

class MenuPresenter: MenuViewOutput {
    
    private weak var input: MenuViewInput!
    private let wireframe: MenuWireframe
    
    init(input: MenuViewInput, wireframe: MenuWireframe) {
        self.input = input
        self.wireframe = wireframe
    }
    
    func proceed() {
        // INFO:
        // According to newhacks.info for male with 188cm height, the distance
        // from top of the head to his chest equals 38.9cm, which is around 20%
        // of his whole height. In case of female body, for 174cm tall person,
        // the same distance equals 36.6cm, which is around 21% of whole height.
        // source: http://newhacks.info/human-anatomy-proportions/
        let phonePosition = input.playerHeight - 0.205 * input.playerHeight
        wireframe.showHunt(at: phonePosition)
    }
}
