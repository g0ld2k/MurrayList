//
//  MurrayDetailViewModel.swift
//  Animation Playground
//
//  Created by Chris Golding on 4/27/22.
//

import Foundation

class MurrayDetailViewModel: ObservableObject {
    @Published var selectedItem: Murray = Murray(image: "", title: "")
    @Published var show = false
}
