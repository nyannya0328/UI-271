//
//  Message.swift
//  UI-271
//
//  Created by nyannyan0328 on 2021/07/27.
//

import SwiftUI

struct Message: Identifiable {
    
    var id = UUID().uuidString
    var message : String
    var userName : String
    var color : Color
  
}

var messages : [Message] = [

    Message(message: "You don't have to brag", userName: "Mother", color: .red),
    
    Message(message: "I love father in the world", userName: "Sister", color: .orange),
    
    Message(message: "Swung on a nose hair", userName: "Sister", color: .green),
    
    Message(message: "Snoring is noisy", userName: "Father", color: .purple),
    
    Message(message: "I konw. its pretty selfish,But  Hey thats  me", userName: "Sister", color: .yellow),
    
    Message(message: "I'm going to make myself happy", userName: "Brother", color: .blue),
    
    Message(message: "I can't live without pappy", userName: "Sister", color: .red),
    
    Message(message: "I'm going to make myself happy", userName: "Brother", color: .blue),
    
    Message(message: "I'm going to make myself happy", userName: "Brother", color: .blue),
    
    
    Message(message: "I'm going to make myself happy", userName: "Brother", color: .blue),
    
    Message(message: "I'm going to make myself happy", userName: "Brother", color: .blue),


]
