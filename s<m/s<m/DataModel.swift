//
//  DataModel.swift
//  s<m
//
//  Created by Nicola De Pardo on 15/11/23.
//
import Foundation
import Combine

class Conversation: Identifiable {
    @Published var contactName: String
    @Published var lastMessage: String
    @Published var isUnread: Bool
    @Published var chatMessages: [ChatMessage] {
        didSet {
            lastMessage = chatMessages.last?.content ?? ""
        }
    }
    @Published var image: String

    init(contactName: String, lastMessage: String, isUnread: Bool, chatMessages: [ChatMessage], image: String) {
        self.contactName = contactName
        self.lastMessage = lastMessage
        self.isUnread = isUnread
        self.chatMessages = chatMessages
        self.lastMessage = chatMessages.last?.content ?? ""
        self.image = image
    }
}

struct ChatMessage: Identifiable {
    var id: String
    var content: String
    var createdAt: Date
    var sender: Sender
}

enum Sender {
    case me
    case other
}

