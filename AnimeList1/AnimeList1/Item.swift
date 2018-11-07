//
//  Item.swift
//  AnimeList1
//
//  Created by Sierra on 31.10.2018.
//  Copyright © 2018 Sergey Ovchinnikov. All rights reserved.
//

import Foundation

struct Item {
    
    let name:String
    let type: String
    let episodes: String
    let episode_length: String
    let description: String

}

extension Item {
    
    init?(dict: NSDictionary) {
        guard
            let name = dict["name"] as? String,
            let type = dict["type"] as? String,
            let episodes = dict["episodes"] as? String,
            let episode_length = dict["episode_length"] as? String,
            let description = dict["description"] as? String
            else { return nil }
        
        self.name = name
        self.type = type
        self.episodes = episodes
        self.episode_length = episode_length
        self.description = description
    }

}
