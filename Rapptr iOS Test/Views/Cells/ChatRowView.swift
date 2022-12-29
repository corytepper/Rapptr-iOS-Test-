//
//  ChatTableViewCell_SwiftUI.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/21/22.
//

import SwiftUI

struct ChatRowView: View {
    
    var message: Message
    
    var body: some View {
        HStack(spacing: 15) {
            Image("drew_avatar")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(message.username).font(.body)
                    .bold()
                Text(message.text).font(.body)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 0.1))
            }
            
            Spacer()
        }
        
        .padding(.horizontal, 20).padding(.vertical, 12)
    }
}

struct ChatTableViewCell_SwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView(message: MockData.sampleMessage)
    }
}
