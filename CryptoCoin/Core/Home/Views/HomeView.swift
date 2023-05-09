//
//  HomeView.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel() 
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false){
                // top coins View
                TopCoinsView(viewModel: viewModel)
                
                Divider()
                // all coins View
                AllCoinView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
