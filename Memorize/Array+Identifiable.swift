//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by David Halle on 02/06/2020.
//  Copyright © 2020 Nitai Halle. All rights reserved.
//

import Foundation
extension Array where Element : Identifiable{
    func firstIndex(matching :Element) -> Int?{
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
