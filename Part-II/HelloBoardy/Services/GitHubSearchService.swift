//
//  GitHubSearchService.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//

import Foundation

struct GitHubUser {
    let avatarUrl: String
    let username: String
    let homeUrl: String
}

protocol GitHubSearching {
    func searchUsers(query: String, completion: @escaping (Result<[GitHubUser], Error>) -> Void)
}

import Alamofire

final class GithubSearchService: GitHubSearching {
    func searchUsers(query: String, completion: @escaping (Result<[GitHubUser], Error>) -> Void) {
        let apiPath = "https://api.github.com/search/users?q=\(query)"
        AF.request(apiPath, method: .get)
            .responseDecodable(of: GitHubUserResponse.self) { response in
                let result: Result<[GitHubUser], Error> = response.result
                    .flatMap { .success($0.items) }
                    .mapError { $0 }
                completion(result)
            }
    }
}

struct GitHubUserResponse: Decodable {
    enum CodingKey {
        case items
    }

    let items: [GitHubUser]
}

extension GitHubUser: Decodable {
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case username = "login"
        case homeUrl = "html_url"

        var description: String { rawValue }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        username = try container.decode(String.self, forKey: .username)
        homeUrl = try container.decode(String.self, forKey: .homeUrl)
    }
}
