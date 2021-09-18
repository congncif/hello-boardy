//
//  Entities+Codable.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//

import Foundation

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
