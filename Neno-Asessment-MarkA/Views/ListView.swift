//
//  ListView.swift
//  Neno-Asessment-MarkA
//
//  Created by Mark Alford on 3/15/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var listData = NetworkManager()
    
    var body: some View {
        List(0..<listData.data.count, id: \.self) { item in
            if item == self.listData.data.count - 1 {
                FeedCardView(data: listData.data[item], isLast: true, listData: self.listData)
            } else {
                FeedCardView(data: listData.data[item], isLast: false, listData: self.listData)
            }
        }
    }
}

