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
    func loadPosts(pageNumber: Float) -> Observable<PostsModel>{
        let subject = PublishSubject<PostsModel>()
        let query = AllPosts(pageNumber: pageNumber)
        var pageInfo = PageInfoModel(page: 1, totalPages: 1, limit: 1)
        var postsContentArray = [PostsContent]()
        
        Network.shared.apollo.fetch(query: query){ result in
            switch result{
            case .success(let graphqlResult):
                if let fetchedPosts = graphqlResult.data?.Posts?.data?.items?.compactMap({$0?.fragments.fragAllPostsDetails}){
                    for data in fetchedPosts{
//                        postsContentArray.append(PostsContent())
                        print(" posts content \(data)")
                    }
                }
                if let fetchedPageInfo = graphqlResult.data?.Posts?.data?.pageInfo{
                    pageInfo.page = fetchedPageInfo.fragments.fragPageInfo.page ?? 0
                    pageInfo.totalPages = fetchedPageInfo.fragments.fragPageInfo.totalPages ?? 0
                    pageInfo.limit = fetchedPageInfo.fragments.fragPageInfo.limit ?? 0
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
