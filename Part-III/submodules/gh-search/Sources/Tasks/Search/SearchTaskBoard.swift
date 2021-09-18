//
//  SearchTaskBoard.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Alamofire
import Boardy
import Foundation
import SiFUtilities

enum SearchTaskBoardFactory {
    static func make(identifier: BoardID) -> ActivatableBoard {
        TaskBoard<SearchInput, SearchOutput>(identifier: identifier) { _, input, completion in
            let apiPath = "https://api.github.com/search/users?q=\(input.query)"
            AF.request(apiPath, method: .get)
                .responseDecodable(of: GitHubUserResponse.self) { response in
                    let result: Result<[GitHubUser], Error> = response.result
                        .flatMap { .success($0.items) }
                        .mapError { $0 }
                    completion(result)
                }
        }
        processingHandler: { $0.showDefaultLoading($0.isProcessing) }
    }
}
