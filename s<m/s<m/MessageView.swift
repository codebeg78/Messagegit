//
//  MessageView.swift
//  s<m
//
//  Created by Nicola De Pardo on 16/11/23.
//

import SwiftUI

struct MessageView: View {
    var message: ChatMessage
    var body: some View {
            HStack{
                    if message.sender == .me{Spacer()}
                    Text(message.content)
                        .foregroundColor(message.sender == .me ? .white : nil)
                        .padding()
                        .background(message.sender == .me ? .blue : .gray.opacity(0.4))
                        .cornerRadius(24)
                    if message.sender == .other{Spacer()}
            }
        }

}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
