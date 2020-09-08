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

struct PageInfoModel {
    var page: Int
    var totalPages: Int
    var limit: Int
}

struct PostsContent {
    var fName: String
    var lName: String
    var avatar: String
    var content: [String]
    var likesCount: Int
    var commentsCount: Int
    var sharesCount: Int
}
