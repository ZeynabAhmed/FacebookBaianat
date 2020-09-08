// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum ContentTypeEnum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case video
  case image
  case text
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "VIDEO": self = .video
      case "IMAGE": self = .image
      case "TEXT": self = .text
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .video: return "VIDEO"
      case .image: return "IMAGE"
      case .text: return "TEXT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ContentTypeEnum, rhs: ContentTypeEnum) -> Bool {
    switch (lhs, rhs) {
      case (.video, .video): return true
      case (.image, .image): return true
      case (.text, .text): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ContentTypeEnum] {
    return [
      .video,
      .image,
      .text,
    ]
  }
}

public final class AllPostsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllPosts($pageNumber: Float) {
      Posts(paginate: {page: $pageNumber}) {
        __typename
        data {
          __typename
          pageInfo {
            __typename
            ...fragPageInfo
          }
          items {
            __typename
            ...fragAllPostsDetails
          }
        }
      }
    }
    """

  public let operationName: String = "AllPosts"

  public var queryDocument: String { return operationDefinition.appending("\n" + FragPageInfo.fragmentDefinition).appending("\n" + FragAllPostsDetails.fragmentDefinition) }

  public var pageNumber: Double?

  public init(pageNumber: Double? = nil) {
    self.pageNumber = pageNumber
  }

  public var variables: GraphQLMap? {
    return ["pageNumber": pageNumber]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Posts", arguments: ["paginate": ["page": GraphQLVariable("pageNumber")]], type: .nonNull(.object(Post.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(posts: Post) {
      self.init(unsafeResultMap: ["__typename": "Query", "Posts": posts.resultMap])
    }

    public var posts: Post {
      get {
        return Post(unsafeResultMap: resultMap["Posts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "Posts")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GqlPostsResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("data", type: .object(Datum.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: Datum? = nil) {
        self.init(unsafeResultMap: ["__typename": "GqlPostsResponse", "data": data.flatMap { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var data: Datum? {
        get {
          return (resultMap["data"] as? ResultMap).flatMap { Datum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["GqlPostsPagination"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("items", type: .list(.object(Item.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, items: [Item?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "GqlPostsPagination", "pageInfo": pageInfo.resultMap, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public var items: [Item?]? {
          get {
            return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragPageInfo.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(page: Int, totalPages: Int, limit: Int) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "page": page, "totalPages": totalPages, "limit": limit])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragPageInfo: FragPageInfo {
              get {
                return FragPageInfo(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Post"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragAllPostsDetails.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragAllPostsDetails: FragAllPostsDetails {
              get {
                return FragAllPostsDetails(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public struct FragPageInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment fragPageInfo on PageInfo {
      __typename
      page
      totalPages
      limit
    }
    """

  public static let possibleTypes: [String] = ["PageInfo"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("page", type: .nonNull(.scalar(Int.self))),
      GraphQLField("totalPages", type: .nonNull(.scalar(Int.self))),
      GraphQLField("limit", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(page: Int, totalPages: Int, limit: Int) {
    self.init(unsafeResultMap: ["__typename": "PageInfo", "page": page, "totalPages": totalPages, "limit": limit])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var page: Int {
    get {
      return resultMap["page"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "page")
    }
  }

  public var totalPages: Int {
    get {
      return resultMap["totalPages"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "totalPages")
    }
  }

  public var limit: Int {
    get {
      return resultMap["limit"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "limit")
    }
  }
}

public struct FragAllPostsDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment fragAllPostsDetails on Post {
      __typename
      content {
        __typename
        contentType
      }
      user {
        __typename
        fName
        lName
        avatar
      }
      createdAt
      likesCount
      commentsCount
      sharesCount
    }
    """

  public static let possibleTypes: [String] = ["Post"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("content", type: .nonNull(.list(.nonNull(.object(Content.selections))))),
      GraphQLField("user", type: .nonNull(.object(User.selections))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("likesCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("commentsCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("sharesCount", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(content: [Content], user: User, createdAt: String, likesCount: Int, commentsCount: Int, sharesCount: Int) {
    self.init(unsafeResultMap: ["__typename": "Post", "content": content.map { (value: Content) -> ResultMap in value.resultMap }, "user": user.resultMap, "createdAt": createdAt, "likesCount": likesCount, "commentsCount": commentsCount, "sharesCount": sharesCount])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var content: [Content] {
    get {
      return (resultMap["content"] as! [ResultMap]).map { (value: ResultMap) -> Content in Content(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Content) -> ResultMap in value.resultMap }, forKey: "content")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var likesCount: Int {
    get {
      return resultMap["likesCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "likesCount")
    }
  }

  public var commentsCount: Int {
    get {
      return resultMap["commentsCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "commentsCount")
    }
  }

  public var sharesCount: Int {
    get {
      return resultMap["sharesCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "sharesCount")
    }
  }

  public struct Content: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Content"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("contentType", type: .nonNull(.scalar(ContentTypeEnum.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(contentType: ContentTypeEnum) {
      self.init(unsafeResultMap: ["__typename": "Content", "contentType": contentType])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var contentType: ContentTypeEnum {
      get {
        return resultMap["contentType"]! as! ContentTypeEnum
      }
      set {
        resultMap.updateValue(newValue, forKey: "contentType")
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fName", type: .nonNull(.scalar(String.self))),
        GraphQLField("lName", type: .scalar(String.self)),
        GraphQLField("avatar", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(fName: String, lName: String? = nil, avatar: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "User", "fName": fName, "lName": lName, "avatar": avatar])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fName: String {
      get {
        return resultMap["fName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "fName")
      }
    }

    public var lName: String? {
      get {
        return resultMap["lName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lName")
      }
    }

    public var avatar: String? {
      get {
        return resultMap["avatar"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "avatar")
      }
    }
  }
}
