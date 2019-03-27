//
//  URL+Helper.swift
//  WorldCountries and Capitals
//
//  Created by TIEGO Ouedraogo on 3/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
//

import Foundation
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        guard var components: URLComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil;
        }
        components.queryItems = queries.map {URLQueryItem(name: $0.0, value: $0.1)}
        return components.url;
    }
}
