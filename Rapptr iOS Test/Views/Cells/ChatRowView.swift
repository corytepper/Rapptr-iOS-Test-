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
        HStack(alignment: .top, spacing: 7) {
            AsyncImage(url: message.avatarURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } placeholder: {
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            }
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.username)
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Chat_fonts"))
                Text(message.text)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(Color("Chat_fonts"))
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 0.1))
                    .background(.white)
            }
            
            Spacer()
        }
        
        .padding(.horizontal, 24).padding(.vertical, 12)
        .background(Color("UIView_BG"))
    }
}

struct ChatTableViewCell_SwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView(message: MockData.sampleMessage)
    }
}
