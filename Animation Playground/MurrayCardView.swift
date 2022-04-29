//
//  MurrayCardView.swift
//  Animation Playground
//
//  Created by Chris Golding on 4/27/22.
//

import SwiftUI

struct MurrayCardView: View {
    @EnvironmentObject var detailViewModel: MurrayDetailViewModel
    var animation: Namespace.ID
    
    var murray: Murray
    
    var body: some View {
        
        VStack {
            Text(murray.title)
                .matchedGeometryEffect(id: murray.title, in: animation)
                .padding(.top, 8.0)
            Image(murray.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                .matchedGeometryEffect(id: murray.image, in: animation)
        }
        .background(.white)
        .cornerRadius(15)
        .padding()
        
    }
}

struct MurrayCardView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        MurrayCardView(animation: animation, murray: Murray(image: "murray-1", title: "Murray 1"))
    }
}
