//
//  TopCoinsView.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import SwiftUI

struct TopCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Coins")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 16){
                    ForEach(viewModel.topMovingCoins) { coin in
                        TopItemView(coin: coin)
                    }
                }
            }
        }.padding()
    }
}

//struct TopCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopCoinsView()
//    }
//}
