//
//  PostsModel.swift
//  BaianatFacebook
//
//  Created by Mostafa Samir on 9/8/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import Foundation

struct PostsModel {
    var pageInfoModel: PageInfoModel
    var postsContent: [PostsContent]
}
struct ContentModel {
    var value:String
}
struct PageInfoModel {
    var page: Int
    var totalPages: Int
    var limit: Int
}

struct PostsContent {
    var fName: String
    var lName: String
    var avatar: String
    var images: [String]
    var video: [String]
    var text: String
    var likesCount: Int
    var commentsCount: Int
    var sharesCount: Int
    var createdAt: String
}
