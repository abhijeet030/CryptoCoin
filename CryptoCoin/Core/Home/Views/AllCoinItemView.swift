//
//  AllCoinItemView.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import SwiftUI
import Kingfisher

struct AllCoinItemView: View {
    let coin: Coin
    var body: some View {
        HStack{
            // rank of the coin
            
            Text("\(coin.marketCapRank)")
                .font(.caption2)
            
            // image of the coin
            
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32)
                .foregroundColor(.orange)
            
            // name and nickname of the coin
            
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading,6)   // using 6 here beacuse of size of the uper text for alingment and beter ui part
            }
            .padding(.leading,2)
            Spacer()
            
            // price and the loss or profit
            
            VStack(alignment: .trailing,spacing: 4){
                Text(coin.currentPrice.convertToCurrency())
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(coin.priceChangePercentage24H.convertToPercentage())
                    .font(.caption)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,2)
    }
}

//struct AllCoinItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinItemView()
//    }
//}
