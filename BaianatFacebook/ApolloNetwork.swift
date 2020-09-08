//
//  ApolloNetwork.swift
//  BaianatFacebook
//
//  Created by Mostafa Samir on 9/8/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    var apollo = ApolloClient(url: URL(string: "http://api.rigow.com/graphql")!)
}



