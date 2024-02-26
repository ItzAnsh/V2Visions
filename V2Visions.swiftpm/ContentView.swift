import SwiftUI

extension UIColor {
convenience init(hex: String) {
    let scanner = Scanner(string: hex)
    scanner.scanLocation = 0

    var rgbValue: UInt64 = 0

    scanner.scanHexInt64(&rgbValue)

    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff

    self.init(
        red: CGFloat(r) / 0xff,
        green: CGFloat(g) / 0xff,
        blue: CGFloat(b) / 0xff, alpha: 1
    )
    }
}


struct ContentView: View {
    @State var newScreen = false
    @State var currLat: Double = 37.7749
    @State var currLong: Double = -122.4194
    
    func Increaser () {
        currLat += 1;
        currLong += 1;
    }
    
    var body: some View {
            ZStack {
                ZStack {
                    Image("Home")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: newScreen ? 20 : 0) // Apply blur effect when newScreen is true
                    Image("LocationHome 1")
                    Image("Logo").resizable().scaledToFit().frame(width: 200)
                }
                .opacity(newScreen ? 0 : 1) // Hide ZStack when newScreen is true
                .animation(.easeInOut) // Apply animation for opacity change
                
                MapView(lat: currLat, lng: currLong)
                    .opacity(newScreen ? 1 : 0) // Show NewScreen when newScreen is true
                    .animation(.easeInOut) // Apply animation for opacity change
                    .edgesIgnoringSafeArea(.top)
                
                
                HomeLayout().opacity(newScreen ? 1 : 0).animation(.easeInOut).edgesIgnoringSafeArea(.all)
                
                
                Button(action: Increaser) {
                                    // Button label and style
                                }
                
            }
            .onAppear {
                // Dissolve and navigate after 1.5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    newScreen = true
                    currLat += 100
                    currLong += 1
                }
        }
    }
}



