//
//  GetPhotosResponse.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation

struct GetPhotosResponse: Codable {
  let data: [PhotoResponse]
}

struct PhotoResponse: Codable {
  let id: String?
  let user: UserResponse?
  let desc: String?
  let photoUrls: PhotoUrl?
  enum CodingKeys: String, CodingKey {
    case id, user, desc = "description", photoUrls = "urls"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decodeIfPresent(String.self, forKey: .id)
    user = try container.decodeIfPresent(UserResponse.self, forKey: .user)
    desc = try container.decodeIfPresent(String.self, forKey: .desc)
    photoUrls = try container.decodeIfPresent(PhotoUrl.self, forKey: .photoUrls)
  }
}

struct UserResponse: Codable {
  let id: String?
  let username: String?
  let name: String?
}

struct PhotoUrl: Codable {
  let raw: String?
  let full: String?
  let regular: String?
  let small: String?
  let thumb: String?
}
