//
//  FeedCardView.swift
//  Neno-Asessment-MarkA
//
//  Created by Mark Alford on 3/15/23.
//

import SwiftUI

struct FeedCardView: View {
    
    //MARK: - Property
    var data: Datum
    var isLast: Bool
    @ObservedObject var listData: NetworkManager
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                //Profile Image
                Circle()
                    .fill(Color(#colorLiteral(red: 0.8509804010391235, green: 0.8509804010391235, blue: 0.8509804010391235, alpha: 1)))
                    .frame(width: 48, height: 48)
                
                //User Name
                Text("\(data.firstname) \(data.lastname)").font(.custom("Inter Semi Bold", size: 12))
            }
            
            //Date Formatted
            Text(data.birthday).font(.custom("Inter Regular", size: 12))
            
            /*
             IMPORTANT - the batch load is called here,
             - upon seeing the LAST current list cell, the api will get called again, thus loading in more rows (batches)
             */
            if self.isLast {
                //Lorem ipsum dolor sit amet...
                Text(data.address.country).font(.custom("Inter Regular", size: 12))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            // setting the limit of JSON responses to 50
                            if self.listData.data.count != 50 {
                                self.listData.updateData()
                            }
                        }
                    }
            } else {
                //Lorem ipsum dolor sit amet...
                Text(data.address.country).font(.custom("Inter Regular", size: 12))
            }
            
        } // Vstack
        . padding(.top)
    } // View
}

