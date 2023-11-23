//
//  ContentView.swift
//  s<m
//
//  Created by Nicola De Pardo on 15/11/23.
//


import SwiftUI

struct ConversationCell: View {
    
    var conversation: Conversation
    
    var body: some View {
        HStack {
            Image(conversation.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(conversation.contactName)
                    .font(.headline)
                
                Text(conversation.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            if conversation.isUnread {
                Image(systemName: "circle.fill")
                    .foregroundColor(.blue)
            }
            
        }
        .padding(8)
    }
}

struct ContentView: View {
    @State private var searchText = ""
    let conversations = [
        Conversation(contactName: "John", lastMessage: "Hey there!", isUnread: true, chatMessages: [], image: "adriano"),
        Conversation(contactName: "Alice", lastMessage: "What's up?", isUnread: false, chatMessages: [], image: "alessia"),
        Conversation(contactName: "Simon", lastMessage: "Forget about it", isUnread: true, chatMessages: [], image: "alessandro"),
        Conversation(contactName: "Gabriella", lastMessage: "No", isUnread: false, chatMessages: [], image: "angela"),
        Conversation(contactName: "Santi", lastMessage: "bring da paper", isUnread: true, chatMessages: [], image: "sergio"),
        Conversation(contactName: "Angela", lastMessage: "I don't think so", isUnread: false, chatMessages: [], image: "pan"),
        Conversation(contactName: "Claudio", lastMessage: "", isUnread: false, chatMessages: [], image: "noah"),
        Conversation(contactName: "Sara", lastMessage: "", isUnread: false, chatMessages: [], image: "pietra"),
        Conversation(contactName: "Cletus", lastMessage: "", isUnread: false, chatMessages: [], image: "joan"),
        Conversation(contactName: "Carla", lastMessage: "", isUnread: false, chatMessages: [], image: "sale"),
        
    ]
    var filteredConversations: [Conversation] {
        if searchText.isEmpty {
            return conversations
        } else {
            return conversations.filter { $0.contactName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationStack{
            
            List {
                ForEach(filteredConversations){ conversation in
                    
                    
                    NavigationLink(destination: ChatView(conversation: conversation)) {
                        ConversationCell(conversation: conversation)
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("HI")
                    }
                label: {
                    Label("Import" , systemImage: "pencil")
                }
                    
                }
                .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) {
                    Button{
                        print("Delete")
                    }
                label: {
                    Label("Delete", systemImage: "xmark.bin")
                }
                .tint(.red)
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitle("Messages")
            .navigationBarItems(
                
                leading: Button(action: {
                    // Add action for the leading button
                    print("Leading button tapped")
                }) {
                    Text("Edit")
                },
                trailing: HStack {
                    
                    Button(action: {
                        // Add action for the second trailing button
                        print("Second trailing button tapped")
                        
                    }) {
                        Image(systemName: "square.and.pencil")
                    }.accessibilityLabel("retr")
                }
            ) }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}



#Preview{
    ContentView()
}
