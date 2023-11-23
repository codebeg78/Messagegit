//
//  AutoResponseProvider.swift
//  s<m
//
//  Created by Nicola De Pardo on 23/11/23.
//

import Foundation

struct AutoResponseProvider {
    static let responses = [
        "Hello!",
           "How are you?",
           "Nice to meet you.",
           "That's interesting!",
        "Oh, now we're getting into the good stuff!",
            "Wow, your perspective is wicked interesting.",
        "No way, that's lit! 🔥",
            "Whoa, that's dope! 😎",
            "Haha, you're on fire! 🔥",
            "That's wicked cool! 🤘",
            "Oh, snap! That's fresh! 🙌",
            "Nice flex, my friend! 💪",
            "Chill perspective, dude! 😎",
            "For real? That's sick! 🤯",
            "You're spitting truth! 🗣️",
        "❤️",
        "❤️",
        "🤍",
        "of course 😎",
        "What do you think about that?",
        "Exactly.",
            "That's true.",
            "Makes sense.",
            "I agree.",
            "Well put.",
        "Sick perspective, bro!",
          "Lit AF!",
          "Oh, you're onto something!",
          "Mad respect for that!",
          "Oh, that's a vibe!",
          "No doubt, that's fly!",
          "Ayy, that's smooth!",
          "You're the real MVP!",
          "Oh, that's savage!",
          "Dope take, my guy!",
          "Haha, you're crushing it!",
      
    ]
        
    static func getRandomResponse() -> String {
        return responses.randomElement() ?? "Hello!"
    }
}


