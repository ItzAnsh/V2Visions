//
//  TopSearchBar.swift
//  V2Visions
//
//  Created by Ansh Chitkara on 24/02/24.
//

import SwiftUI

struct TopSearchBar: View {
    @State var SearchBody: String = ""
    @State var heightContent = CGFloat.zero
    var body: some View {
        VStack {
            ZStack(alignment: .top
            ) {

                VStack() {
                    let binding = Binding (
                        get: { self.SearchBody },
                        set: {self.SearchBody = $0}
                    )
                    ZStack(alignment: .top) {
                        
                        Section() {
                            HStack() {
                                //                    Image(systemName: "line.3.horizontal").imageScale(.large)
                                //                    Text("Search")
                                TextField("Enter a Location", text: binding).font(.system(size: 20.0)).fontWeight(.bold)
                            }.padding(20.0).background(Color.white).frame(width: .infinity)
                                .cornerRadius(.infinity)
                        }.padding(EdgeInsets(top: 60.0, leading: 20.0, bottom: 0, trailing: 20.0 ))
                        //                Spacer()
                    }.frame(minHeight: heightContent).frame(width: .infinity).edgesIgnoringSafeArea(.bottom).background(LinearGradient(stops: [
                        Gradient.Stop(color: .black.opacity(0.7), location: 0.01),
                        Gradient.Stop(color: .black.opacity(0.7), location: 0.2),
                        Gradient.Stop(color: .black.opacity(0.1), location: 0.8)
                    ], startPoint: .top, endPoint: .bottom))
                }
                
                
            }.onPreferenceChange(ViewHeightKey.self) {
                self.heightContent = $0 + 20.0
                
            }
        }
    }
}



struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}
