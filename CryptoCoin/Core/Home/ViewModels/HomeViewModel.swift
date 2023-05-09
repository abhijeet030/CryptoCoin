//
//  HomeViewModel.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinData()
    }

    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                print("Debug: Erorr \(error.localizedDescription)")
            }
            if let responce = responce as? HTTPURLResponse {
                print("Debug: Responce \(responce.statusCode)")
            }
            guard let data = data else {return}
            
        // encoding of the data
            
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {          // here dispatchqueue is used for making it asyncronus in the thread and also for calling the function outside the class 
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("Debug: error \(error)")
            }
            
        }.resume()
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: {
            $0.priceChangePercentage24H > $1.priceChangePercentage24H
        })
        self.topMovingCoins = Array(topMovers.prefix(10))
    }
}

