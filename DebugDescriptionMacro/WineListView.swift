//
//----------------------------------------------
// Original project: DebugDescriptionMacro
// by  Stewart Lynch on 2024-08-27
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct WineListView: View {
    var wines: [Wine] = Wine.wines
    @State var selectedWine: Wine?
    var body: some View {
        NavigationStack{
            List(wines) { wine in
                VStack(alignment: .leading) {
                    HStack {
                        Text(wine.winery)
                            .font(.title)
                        Spacer()
                        if let name = wine.name {
                            Text(name)
                        }
                    }
                    HStack {
                        Text(wine.variety)
                        Spacer()
                        Text("In stock: \(wine.inStock)")
                            .bold()
                    }
                }
                .onTapGesture {
                    selectedWine = wine
                }
            }
            .listStyle(.plain)
            .navigationTitle("Wine List")
        }
    }
}

#Preview {
    WineListView()
}

struct Wine: Identifiable {
    var id = UUID()
    var winery: String
    var variety: String
    var name: String?
    var inStock: Int

    static var wines: [Wine] {
        [
            Wine(winery: "Spearhead", variety: "Pinot Noir", name: "Pommard Clone", inStock: 3),
            Wine(winery: "Arrowleaf", variety: "Pino Gris", inStock: 3),
            Wine(winery: "Meyer", variety: "Chardonnay", name: "Deklava Clone", inStock: 4),
            Wine(winery: "Road 13", variety: "Cabernet Sauvignon", inStock: 4),
            Wine(winery: "Checkmate", variety: "Chardonnay", name: "Queens Taken", inStock: 1),
            Wine(winery: "Jackson Triggs", variety: "Cabernet Sauvignon", name: "Grand Reserve", inStock: 3),
            Wine(winery: "Peak Cellars", variety: "Grüner Veltliner", inStock: 3),
            Wine(winery: "inniskillin", variety: "Meritage", name: "Dark Horse Vineyard", inStock: 4),
            Wine(winery: "Black Sage Vineyards", variety: "Shiraz", inStock: 4),
            Wine(winery: "Red Barn", variety: "Viognier", name: "Off Centre", inStock: 1)
        ]
    }
}
