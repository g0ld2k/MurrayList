//
//  ContentView.swift
//  Animation Playground
//
//  Created by Chris Golding on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    @Namespace var animation
    
    @StateObject private var viewModel = MurrayViewModel()
    @StateObject var detailViewModel = MurrayDetailViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.title) { murray in
                        VStack{
                        MurrayCardView(animation: animation, murray: murray)
                            .environmentObject(detailViewModel)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1.2, blendDuration: 0.8)) {
                                    detailViewModel.selectedItem = murray
                                    detailViewModel.show.toggle()
                                }
                            }
                        }
                    }
                }
            }
            .background(.blue)
            .opacity(detailViewModel.show ? 0 : 1)
            
            if detailViewModel.show {
                MurrayDetailView(animation: animation, viewModel: detailViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
