//
//  AllCoinView.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import SwiftUI

struct AllCoinView: View {
    @StateObject var viewModel: HomeViewModel   // here we are not intializing it we are just passing it 
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            HStack{
                Text("Coin")
                Spacer()
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            ScrollView(.vertical){
                VStack{
                    ForEach(viewModel.coins){ coin in
                        AllCoinItemView(coin: coin)
                    }
                }
            }
        }
    }}

//struct AllCoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinView()
//    }
//}
