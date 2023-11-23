//
//  ContactDetailView.swift
//  s<m
//
//  Created by Nicola De Pardo on 16/11/23.
//

import SwiftUI

struct ContactDetailView: View {
    @State var conversation: Conversation
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
                    
                    VStack {
                        VStack {
                            Image(conversation.image)
                                .resizable()
                                .frame(width: 200, height: 200) // Adjust the width and height according to your preference
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        }
                        Text(conversation.contactName)
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .bold()
                        
                        HStack{
                            ZStack {
                                
                                Rectangle()
                                    .frame(width: 90, height: 70)
                                .cornerRadius(12)
                                .foregroundColor(.gray)
                                VStack {
                                    Image(systemName: "message.fill")
                                        .foregroundColor(.white)
                                    Button("message")
                                        {
                                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                        
                                        }.foregroundColor(.white)

                                   
                                   
                                }
                                
                            }
                            ZStack {
                                Rectangle()
                                    .frame(width: 90, height: 70)
                                .cornerRadius(12)
                                .foregroundColor(.gray)
                                VStack {
                                    Image(systemName: "phone.fill")
                                        .foregroundColor(.white)
                                    Button("call")
                                        {
                                            
                                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                        
                                        }.foregroundColor(.white)
                                   
                                }
                                
                            }
                            ZStack {
                                Rectangle()
                                    .frame(width: 90, height: 70)
                                .cornerRadius(12)
                                .foregroundColor(.gray)
                                VStack {
                                    Image(systemName: "video.fill")
                                        .foregroundColor(.white)
                                    Button("FaceTime")
                                        {
                                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                        
                                        }.foregroundColor(.white)
                                }
                                
                            }
                            ZStack {
                                Rectangle()
                                    .frame(width: 90, height: 70)
                                .cornerRadius(12)
                                .foregroundColor(.gray)
                                VStack {
                                    Image(systemName: "envelope.fill")
                                        .foregroundColor(.white)
                                    Button("mail")
                                        {
                                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                        
                                        }.foregroundColor(.white)
                                }
                               
                                    
                                }
                            
                                Spacer()
                                }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            
                                Rectangle()
                                    .frame(width: 385, height:65 )
                                    .cornerRadius(12)
                                    .foregroundColor(.gray)
                                    .padding(2.5)
                            VStack(alignment: .leading){
                                    Text("Phone")
                                        .foregroundColor(.white)
                                    Button("+39335838394") {
                                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                    }.foregroundColor(.white)
                            }.padding()
                            
                                
                            
                        }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Rectangle()
                                .frame(width: 385, height:65 )
                                .cornerRadius(12)
                                .foregroundColor(.gray)
                                .padding(2.5)
                            VStack{
                               
                               
                                Button(action: {
                                               // Action to perform when the button is tapped
                                               print("Button tapped!")
                                           }) {
                                               Text( "FaceTime") // Replace "star.fill" with your desired SF Symbol name
                                                   .foregroundColor(.white) // Set the color of the SF Symbol
                                                   .font(.system(size: 16)) // Set the font size of the SF Symbol
                                           }
                            }.padding()

                               
                            

                                }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Rectangle()
                                .frame(width: 385, height:65 )
                                .cornerRadius(12)
                                .foregroundColor(.gray)
                                .padding(2.5)
                            VStack{
                                
                               
                                Button(action: {
                                               // Action to perform when the button is tapped
                                               print("Button tapped!")
                                           }) { Text("Notes")
                                                   .foregroundColor(.white) // Set the color of the SF Symbol
                                                   .font(.system(size: 16))
                                            
                                           }
                            }.padding()

                                
                                }
                                
                            
                        }
                        
                        
                            }
                            
                        }
                        
                        .padding(.bottom, 20)
                        Spacer()

                    }
                    .padding(.top, 10)
                }
                
            }
        
    
    



#Preview {
    ContactDetailView(conversation: Conversation(contactName: "John", lastMessage: "Hey there!", isUnread: true, chatMessages: [], image: ""))
}
