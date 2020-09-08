//
//  PostsContract.swift
//  BaianatFacebook
//
//  Created by Mostafa Samir on 9/8/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import Foundation

protocol PostsViewProtocol: class{
    func didLoadPosts(posts: [PostsContent], pageInfo: PageInfoModel)
    func displayError(message: String)
}

protocol PostsPresenterProtocol: class{
    func attachView(viewProtocol: PostsViewProtocol)
    func detachView()
    func getPosts()
}

protocol PostsBusinessHelperProtocol: class{
    func loadPosts(pageNumber: Float) -> Observable<PostsModel>
}
