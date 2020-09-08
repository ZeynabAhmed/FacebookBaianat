//
//  BusinessHelper.swift
//  BaianatFacebook
//
//  Created by Mostafa Samir on 9/8/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import Foundation

import Apollo
import RxSwift

class BusinessHelper: NSObject,PostsBusinessHelperProtocol{
    func loadPosts(pageNumber: Double) -> Observable<PostsModel>{
        let subject = PublishSubject<PostsModel>()
        let query = AllPostsQuery(pageNumber: pageNumber)
        var pageInfo = PageInfoModel(page: 1, totalPages: 1, limit: 1)
        var postsContentArray = [PostsContent]()
        
        Network.shared.apollo.fetch(query: query){ result in
            switch result{
            case .success(let graphqlResult):
                if let fetchedPosts = graphqlResult.data?.posts.data?.items?.compactMap({$0?.fragments.fragAllPostsDetails}){
                    for data in fetchedPosts{
                        postsContentArray.append(PostsContent(fName: data.user.fName, lName: data.user.lName ?? " lName ", avatar: data.user.avatar ?? " ", images: [""], video: [""], text: " ", likesCount: data.likesCount, commentsCount: data.commentsCount, sharesCount: data.sharesCount, createdAt: data.createdAt))
                        
                       // print(" posts content \(data)")
                    }
                }
                if let fetchedPageInfo = graphqlResult.data?.posts.data?.pageInfo{
                    pageInfo.page = fetchedPageInfo.fragments.fragPageInfo.page
                    pageInfo.totalPages = fetchedPageInfo.fragments.fragPageInfo.totalPages
                    pageInfo.limit = fetchedPageInfo.fragments.fragPageInfo.limit 
                  //  print(" posts content \(fetchedPageInfo)")
                }
                subject.onNext(PostsModel(pageInfoModel: pageInfo, postsContent: postsContentArray))
            
            case .failure(let error):
                subject.onError(error)
                print("Error loading data \(error)")
  
            }
        }
        return subject.asObservable()
    }
}
