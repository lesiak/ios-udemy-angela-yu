//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let stories = [Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
                   Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
                   Story(title: "You find a treasure chest.", choice1: "Open it.", choice2: "Check for traps.")
    ]
    
    var storyNumber = 0
    
    mutating func nextStory(userChoice: String) {
        let currentStory = stories[storyNumber]
        if (userChoice == currentStory.choice1) {
            storyNumber = 2 * storyNumber + 1
        } else {
            storyNumber = 2 * storyNumber + 2
        }
        if (storyNumber >= stories.count) {
            storyNumber = 0
        }
    }
    
    func getCurrentStory() -> Story {
        return stories[storyNumber]
    }
}
