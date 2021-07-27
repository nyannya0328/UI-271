//
//  Home.swift
//  UI-271
//
//  Created by nyannyan0328 on 2021/07/27.
//

import SwiftUI

let colos : [Color] = [.red,.green,.orange,.purple,.pink]

let random = colos.randomElement() ?? .red

struct Home: View {
    
    let maxH = UIScreen.main.bounds.height < 750 ? (UIScreen.main.bounds.height / 1.9) : (UIScreen.main.bounds.height / 2.3)
    
    var topEdge : CGFloat
    
    
    @State var offset : CGFloat = 0
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(spacing:20){
                
                
                GeometryReader{proxy in
                    
                    TopBar(offset: $offset, topEdger: topEdge, maxH: maxH)
                   
                    .frame(maxWidth: .infinity)
                    .frame(height:getHearderHeight(), alignment: .bottom)
                    .background(random,in: CustomShape(radi: getRadi(), corner: [.bottomRight]))
                    .overlay(
                    
                    TopNavBar(offset: $offset, topEdger: topEdge, maxH: maxH)
                        .padding(.horizontal)
                        .frame(height: 80)
                        .padding(.top,topEdge)
                    
                    
                    ,alignment: .top
                    
                    )
                    
                    
                    
                    
                }
                .foregroundColor(.white)
                .frame(height: maxH)
                .offset(y: -offset)
                .zIndex(1)
                
                
                VStack{
                    
                    
                    ForEach(messages){message in
                        
                        
                        MessageCardView(message: message)
                        
                    }
                }
                .padding()
                .zIndex(0)
               
                
                
                
                
            }
            .modifier(OffsetModefiers(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    func getHearderHeight()->CGFloat{
        
        
        let topHight = maxH + offset
        
        return topHight > (80 + topEdge) ? topHight : (80 + topEdge)
    }
    
    
    func getRadi()->CGFloat{
        
        
        let progress = -offset / (maxH - (80 + topEdge))
        
        let value = 1 - progress
        
        let radi = value * 30
        
        return offset < 0 ? radi : 30
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar : View{
    
    @Binding var offset : CGFloat
    var topEdger : CGFloat
    var maxH : CGFloat
    var body: some View{
        
        
        VStack(alignment:.leading,spacing: 15){
            
            
          
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            
            
            Text("Deer")
            
            
            
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                Text("Deer or true deer are hoofed ruminant mammals forming the family Cervidae. The two main groups of deer are the Cervinae, including the muntjac, the elk (wapiti), the red deer, the fallow deer, and the chital; and the Capreolinae, including the reindeer (caribou), the roe deer, the mule deer, and the moose. Female reindeer, and male deer of all species except the Chinese water deer, grow and shed new antlers each year. In this they differ from permanently horned antelope, which are part of a different family (Bovidae) within the same order of even-toed ungulates (Artiodactyla).")
                
                
                
            }
            .font(.footnote.italic())
            .frame(height: 60)
            
        
            
            
                
            

            
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
    
    func getOpacity()->CGFloat{
        
        
        
        let porgress = -offset / 70
        
        let opa = 1 - porgress
        
        return offset < 0 ? opa : 1
    }
    
    
    
}

struct TopNavBar : View{
    
    @Binding var offset : CGFloat
    var topEdger : CGFloat
    var maxH : CGFloat
    
    var body: some View{
        
        
        HStack(spacing:10){
            
            
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .font(.body.bold())
            }
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .opacity(getTopBaropa())
            
            Text("Deer")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .opacity(getTopBaropa())
            
            
            Spacer(minLength: 0)
            
            
            Button {
                
            } label: {
                Image(systemName: "line.horizontal.3")
                
                    .font(.body.bold())
                                        
                
            }


            
        }
    }
    
    func getTopBaropa()->CGFloat{
        
        
        
        let progress = -(offset + 60) / (maxH - (80 + topEdger))
        
        return progress
    }
    
    
    
}


struct MessageCardView : View{
    
    var message : Message
    
    var body: some View{
        
        HStack(spacing:15){
            
            
            Circle()
                .fill(message.color)
                .frame(width: 50, height: 50)
                .background(Circle().stroke(.black,lineWidth: 3))
                .opacity(0.8)
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text(message.userName)
                    .font(.footnote.italic())
                    .foregroundColor(.primary)
                
                
                Text(message.message)
                    .lineLimit(1)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
          
            
            
            
        }
    }
}
