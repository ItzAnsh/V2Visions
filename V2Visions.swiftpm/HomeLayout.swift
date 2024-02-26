//
//  HomeLayout.swift
//  V2Visions
//
//  Created by Ansh Chitkara on 24/02/24.
//

import SwiftUI

struct HomeLayout: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack (spacing: 260) {
                VStack(spacing: 100) {
                    TopSearchBar()
                    HStack() {
                        Spacer()
                        SOSButton().padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10.0))
                    }
                }
                
                VStack() {
                    Buttons()
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10.0))
            }
        }.frame(maxHeight: .infinity, alignment: .top)
        
    }
}

struct SOSButton: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack {
                Image(systemName: "bell.and.waves.left.and.right.fill").imageScale(.large).foregroundColor(.white)
                Text("SOS").font(.system(size: 10)).foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.frame(width: 25, height: 25).padding(16).background(.red).cornerRadius(.infinity).overlay(RoundedRectangle(cornerRadius: .infinity).stroke(.white, lineWidth: 2.0))
        }.frame(width: .infinity, alignment: .trailing)
    }
}

struct Buttons: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack() {
                Spacer()
                Image(systemName: "safari.fill").imageScale(.large).foregroundColor(.blue).padding(16).background(.white).cornerRadius(.infinity).overlay(RoundedRectangle(cornerRadius: .infinity).stroke(.blue, lineWidth: 4.0))
            }
            
            HStack() {
                Spacer()
                Image(systemName: "location.fill").imageScale(.large).foregroundColor(.purple).padding(16).background(.white).cornerRadius(.infinity).overlay(RoundedRectangle(cornerRadius: .infinity).stroke(.purple, lineWidth: 4.0))
            }
        }
    }
}
