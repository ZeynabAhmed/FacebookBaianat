//
//  PostsPresenter.swift
//  BaianatFacebook
//
//  Created by Mostafa Samir on 9/8/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import Foundation
import RxSwift


class PostsPresenter: NSObject, PostsPresenterProtocol{
    weak var view: PostsViewProtocol?
    let helper:PostsBusinessHelperProtocol = BusinessHelper()
    let disposeBag = DisposeBag()
    var pageCount = 1
    
    func attachView(viewProtocol: PostsViewProtocol){
        self.view = viewProtocol
    }
    
    func detachView(){
        self.view = nil
    }
    
    func getPosts(){
        helper.loadPosts(pageNumber: Double(pageCount)).subscribe(onNext: { (result) in
            self.pageCount += 1
            self.view?.didLoadPosts(posts: result.postsContent, pageInfo: result.pageInfoModel)
        }, onError: { (error) in
            self.view?.displayError(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
}
