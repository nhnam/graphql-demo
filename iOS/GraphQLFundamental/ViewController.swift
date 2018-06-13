//
//  ViewController.swift
//  GraphQLFundamental
//
//  Created by ナム Nam Nguyen on 6/12/18.
//  Copyright © 2018 Nguyen Pte, Ltd. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initialize()
    }

    func initialize() {
        let client: ApolloClient = {
            let configuration = URLSessionConfiguration.default

            let url = URL(string: "http://localhost:4000/graphql")!
            
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
        
        client.fetch(query: DemoQuery(name: "RingMD"), cachePolicy: CachePolicy.returnCacheDataAndFetch, queue: DispatchQueue.main) { (result:GraphQLResult<DemoQuery.Data>?, error) in
            guard let data = result?.data else { return }
            print(data.xinChao)
        }
    }

}

