//
//  MoviesEndpoint.swift
//  RequestApp
//
//  Created by Victor Catão on 18/02/22.
//

enum MoviesEndpoint {
    case topRated
    case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .topRated:
            return "/3/tv/get-top-rated-tv"
        case .movieDetail(let tv_id):
            return "/3/tv/\(tv_id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .topRated, .movieDetail:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZTAwYWI5NzBlZDhmMTY4YmI0MjY2ZDcwODFjYTgxMiIsInN1YiI6IjYyZjc1MjlkNmU5MzhhMDA3YTNhYzYyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2hPPd1IcgyhSLIR_WLBj6E7CukVB1OjnaLmtYLf1dbM"
        switch self {
        case .topRated, .movieDetail:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .topRated, .movieDetail:
            return nil
        }
    }
}
