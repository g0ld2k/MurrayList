//
//  MurrayDetailView.swift
//  Animation Playground
//
//  Created by Chris Golding on 4/27/22.
//

import SwiftUI

struct MurrayDetailView: View {
    var animation: Namespace.ID
    
    @ObservedObject var viewModel: MurrayDetailViewModel
    @State var scale: CGFloat = 1
    
    var body: some View {
        ScrollView {
            ZStack (alignment: Alignment(horizontal: .center, vertical: .top)) {
                Image(viewModel.selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                    .matchedGeometryEffect(id: viewModel.selectedItem.image, in: animation)
                
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1.2, blendDuration: 0.8)) {
                            viewModel.show.toggle()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black.opacity(0.7))
                            .padding()
                            .background(.white.opacity(0.8))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
            }
            .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
            
            Text(viewModel.selectedItem.title)
                .matchedGeometryEffect(id: viewModel.selectedItem.title, in: animation)
            
            Text("""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nam at lectus urna duis convallis convallis tellus id interdum. Eleifend mi in nulla posuere sollicitudin aliquam. Ante in nibh mauris cursus mattis molestie a iaculis. Blandit massa enim nec dui nunc mattis enim ut tellus. Et ligula ullamcorper malesuada proin libero nunc. Libero enim sed faucibus turpis in eu mi bibendum neque. A condimentum vitae sapien pellentesque habitant morbi. Arcu odio ut sem nulla. Ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit. Nisl nunc mi ipsum faucibus vitae aliquet nec.

Egestas dui id ornare arcu. In cursus turpis massa tincidunt dui ut ornare lectus sit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Quis hendrerit dolor magna eget est lorem ipsum dolor. Condimentum lacinia quis vel eros donec ac odio. Dui id ornare arcu odio ut sem nulla pharetra. Sagittis id consectetur purus ut faucibus pulvinar. Urna nec tincidunt praesent semper feugiat nibh. Purus ut faucibus pulvinar elementum integer. Mattis ullamcorper velit sed ullamcorper morbi tincidunt. Ultrices eros in cursus turpis massa tincidunt dui. Nec dui nunc mattis enim ut tellus. Quam elementum pulvinar etiam non quam lacus suspendisse faucibus. Est velit egestas dui id ornare arcu odio ut. Mi sit amet mauris commodo quis. Egestas diam in arcu cursus euismod quis viverra nibh. Viverra accumsan in nisl nisi scelerisque. Tristique magna sit amet purus gravida. Elementum curabitur vitae nunc sed velit dignissim. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam.

Diam quis enim lobortis scelerisque. Sem et tortor consequat id porta nibh venenatis cras sed. Mauris vitae ultricies leo integer malesuada nunc vel risus commodo. Diam maecenas sed enim ut sem viverra aliquet. Gravida neque convallis a cras semper auctor. Lectus proin nibh nisl condimentum id venenatis. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Facilisis magna etiam tempor orci eu lobortis elementum. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing. Sit amet purus gravida quis blandit turpis cursus in. Sit amet mauris commodo quis. Id ornare arcu odio ut sem nulla. Et malesuada fames ac turpis. Enim sit amet venenatis urna cursus eget nunc. Donec pretium vulputate sapien nec sagittis.

Aliquam malesuada bibendum arcu vitae. Habitasse platea dictumst quisque sagittis purus sit. Dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh. Tincidunt augue interdum velit euismod in pellentesque massa. Malesuada fames ac turpis egestas. Eros in cursus turpis massa tincidunt dui ut ornare lectus. Congue quisque egestas diam in arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Ultricies integer quis auctor elit sed vulputate mi sit. A diam maecenas sed enim ut sem. Enim diam vulputate ut pharetra sit amet aliquam. Et magnis dis parturient montes nascetur. Tortor posuere ac ut consequat semper viverra nam libero. Sit amet dictum sit amet. Nam libero justo laoreet sit amet. Massa sed elementum tempus egestas sed sed. Mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Sit amet venenatis urna cursus eget nunc scelerisque viverra mauris. Sit amet luctus venenatis lectus magna fringilla. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel.

At augue eget arcu dictum varius duis. Mattis aliquam faucibus purus in massa tempor. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. Nunc lobortis mattis aliquam faucibus purus in massa tempor. Integer eget aliquet nibh praesent tristique magna sit amet. Massa tincidunt dui ut ornare lectus. Ut eu sem integer vitae justo eget magna fermentum iaculis. Viverra mauris in aliquam sem fringilla ut morbi tincidunt augue. Sagittis nisl rhoncus mattis rhoncus. Et magnis dis parturient montes nascetur ridiculus mus mauris. At imperdiet dui accumsan sit amet. Turpis tincidunt id aliquet risus feugiat in. Tempor nec feugiat nisl pretium fusce. Mauris ultrices eros in cursus turpis. Neque gravida in fermentum et sollicitudin ac orci phasellus egestas.
""")
            .padding()
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func onChanged(value: DragGesture.Value) {
        let scale = value.translation.height / UIScreen.main.bounds.height
        
        if 1 - scale > 0.7 {
            self.scale = 1 - scale
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if scale < 0.9 {
                viewModel.show.toggle()
            }
            scale = 1
        }
    }
}

//struct MurrayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MurrayDetailView()
//    }
//}
