//
//  MurrayViewModel.swift
//  Animation Playground
//
//  Created by Chris Golding on 4/27/22.
//

import Foundation

class MurrayViewModel: ObservableObject {
    @Published var items: [Murray] = [
        Murray(image: "murray-1", title: "Murray 1"),
        Murray(image: "murray-2", title: "Murray 2"),
        Murray(image: "murray-3", title: "Murray 3"),
        Murray(image: "murray-4", title: "Murray 4")
    ]
}

struct Murray {
    var image: String
    var title: String
}
