//
//  SearchInOut.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

struct SearchInput {
    let query: String
}

typealias SearchOutput = [GitHubUser]

typealias SearchCommand = Any?

typealias SearchParameter = SearchInput
