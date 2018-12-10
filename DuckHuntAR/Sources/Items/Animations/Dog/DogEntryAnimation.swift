//
//  DogEntryAnimation.swift
//  DuckHuntAR
//
//  Created by Wojciech Trzasko Nomtek on 27.02.2018.
//  Copyright © 2018 Nomtek. All rights reserved.
//

import SceneKit

class DogEntryAnimation {

    let animation: NodeAnimation
    
    init?(points: [KeyPoint]) {
        guard
            let spawnPoint = points.position(named: "spawn_point"),
            let walkEndPoint = points.position(named: "walk_end_point"),
            let jumpEndPoint = points.position(named: "jump_end_point"),
            let fallEndPoint = points.position(named: "fall_end_point")
            else {
            return nil
        }
        
        let keyframes = NodeAnimationKeyframeFactory()
        
        animation = NodeAnimation(keyframes: [
            keyframes.fadeIn(
                thru: 1.0,
                child: keyframes.play(
                    animation: DogSpriteAnimations.standing,
                    child: keyframes.wait(
                        at: spawnPoint,
                        for: 1.0
                    )
                )
            ),
            
            keyframes.playSound(
                path: "hunt.scnassets/sounds/game_start.mp3",
                child: keyframes.play(
                    animation: DogSpriteAnimations.walking,
                    child: keyframes.move(
                        to: walkEndPoint,
                        thru: 5.0
                    )
                )
            ),
            
            keyframes.playSound(
                path: "hunt.scnassets/sounds/dog_bark.wav",
                child: keyframes.play(
                    animation: DogSpriteAnimations.hearing,
                    child: keyframes.wait(
                        at: walkEndPoint,
                        for: 1.0
                    )
                )
            ),
            
            keyframes.play(
                animation: DogSpriteAnimations.jumping,
                child: keyframes.move(
                    to: jumpEndPoint,
                    thru: 0.5
                )
            ),
            
            keyframes.play(
                animation: DogSpriteAnimations.falling,
                child: keyframes.move(
                    to: fallEndPoint,
                    thru: 0.5
                )
            ),
            
            keyframes.fadeOut(
                at: fallEndPoint,
                thru: 0.2)
        ])
    }
}
