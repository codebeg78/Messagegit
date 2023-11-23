//
//  ChatView.swift
//  s<m
//
//  Created by Nicola De Pardo on 15/11/23.
//

import SwiftUI

struct ChatView: View {
    
    @State var conversation: Conversation
    @State var message: String = ""
    @State var lastMessageID: String = ""
    @State private var showModal = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack{   
            

                
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(conversation.chatMessages, id: \.id) { message in
                            MessageView(message: message)
                        }
                    }
                }
                .onChange(of: self.lastMessageID) { id in
                    withAnimation{
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
            }
            
            HStack {
                TextField("Enter a message", text: $message) {}
                    .padding()
                    .background(colorScheme == .dark ? .gray.opacity(0.2) : .gray.opacity(0.4))
                    .cornerRadius(12)
                Button{
                    sendMessage()
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.blue)
                        .padding(.horizontal, 5)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                }
            }
            
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
            
                VStack {
                    Button { 
                        self.showModal = true
                    } label: {
                        
                        ZStack {
                            Image(conversation.image)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFit()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .clipShape(Circle())
                            
                        }
                            Text(conversation.contactName)
                            .foregroundColor(.black)
                            .bold()
                        }.sheet(isPresented: $showModal) {
                            ContactDetailView(conversation: conversation)
                        }
                        
                        
                        
                    
                }
            }
        })
        .padding()
        
        
    }
    
    func sendMessage (){
        guard message != "" else {return}
        
        let myMessage = ChatMessage(id: UUID().uuidString, content: message, createdAt: Date(), sender: .me)
        conversation.chatMessages.append(myMessage)
        lastMessageID = myMessage.id
        
        
        let randomResponse = AutoResponseProvider.getRandomResponse()
        
        let otherPersonResponse = ChatMessage(id: UUID().uuidString, content: randomResponse, createdAt: Date(), sender: .other)
        
        conversation.chatMessages.append(otherPersonResponse)
        lastMessageID = otherPersonResponse.id
        
        message = ""
    }
    
}

#Preview {
    ContentView()
}
