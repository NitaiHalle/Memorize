//
//  Grid.swift
//  Memorize
//
//  Created by David Halle on 02/06/2020.
//  Copyright © 2020 Nitai Halle. All rights reserved.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item : Identifiable, ItemView :View{
    var items : [Item]
    var viewFotItem : (Item) -> ItemView
    
    init(_  items : [Item], viewFotItem : @escaping (Item) -> ItemView) {
        self.items = items
        self.viewFotItem = viewFotItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body (for layout : GridLayout) -> some View{
        ForEach(items) { item in
            self.body(for : item , in : layout)
        }
    }
    
    func body(for item : Item, in layout : GridLayout) -> some View {
        let index = self.items.firstIndex(matching: item)!
        return self.viewFotItem(item)
            .frame(width : layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}

