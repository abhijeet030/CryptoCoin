//
//  TopItemView.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import SwiftUI
import Kingfisher

struct TopItemView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack (alignment: .leading){
            // coin image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32) // width should be writen first it shows error when we pass width after height
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            // coin name and price
            HStack(spacing: 2){
                Text(coin.symbol)
                    .font(.caption)
                    .fontWeight(.bold)
                Text(coin.currentPrice.convertToCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            // coin profit or loss
            Text(coin.priceChangePercentage24H.convertToPercentage())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140,height: 140)
        .background(Color("itemBackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}

//struct TopItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopItemView()
//    }
//}
