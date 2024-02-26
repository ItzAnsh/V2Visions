import SwiftUI
import MapKit

final class MyPointAnnotation: NSObject, MKAnnotation{
var vehicleID: String
dynamic var coordinate: CLLocationCoordinate2D
init(coordinate: CLLocationCoordinate2D, vehicleID:String) {
    self.coordinate = coordinate
    self.vehicleID = vehicleID
    super.init()
}
}

//class CircleRender: MKCircleRenderer {
//
//}

class viewer : MKAnnotationView {
    
}

struct MapView: UIViewRepresentable {
    
      var currLat: Double
      var currLong: Double

      init(lat: Double, lng: Double) {
          self.currLat = lat
          self.currLong = lng
      }

//      func makeUIView(context: Context) -> MKMapView {
//          let mapView = MKMapView(frame: .zero) // Create the map view
//                 mapView.delegate = context.coordinator // Set delegate
//          mapView.delegate = context.coordinator
//          mapView.showsUserLocation = false // Disable showing user's location
//          mapView.overrideUserInterfaceStyle = .dark
//
//          // Set initial region
//          let initialCoordinates = CLLocationCoordinate2D(latitude: currLat, longitude: currLong)
//          let initialCoordinates2 = CLLocationCoordinate2D(latitude: currLat + 0.1, longitude: currLong + 0.1)
//          let initialRegion = MKCoordinateRegion(center: initialCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//          let initialRegion2 = MKCoordinateRegion(center: initialCoordinates2, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//          mapView.setRegion(initialRegion, animated: true)
//          
////          mapView.setRegion(initialRegion2, animated: true)
//
//          // Add an annotation
//          let annotation1 = MyPointAnnotation(coordinate: initialCoordinates, vehicleID: "your_vehicle_id")
//          
//          let annotation2 = MyPointAnnotation(coordinate: initialCoordinates2, vehicleID: "your_vehicle_id")
//          
//          let mkCircle = MKCircle(center: initialCoordinates, radius: 2000.0)
//          let circleRender = MKCircleRenderer(circle: mkCircle)
//          circleRender.strokeStart = 3.0
//          circleRender.strokeEnd = 3.0
//          circleRender.fillColor = .purple
//          circleRender.strokeColor = .white
//          
//          mapView.addAnnotation(annotation1)
//          mapView.addAnnotation(annotation2)
//          mapView.addOverlay(mkCircle)
//          
//
//          return mapView
//      }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator

        // Set initial region
        let initialCoordinates = CLLocationCoordinate2D(latitude: currLat, longitude: currLong)
        let region = MKCoordinateRegion(center: initialCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        mapView.setRegion(region, animated: true)

        // Create and add the circle directly to the map
        let circle = MKCircle(center: CLLocationCoordinate2D(latitude: 30.6987952, longitude: 76.7614388), radius: 2000.0) // Update coordinates and radius as needed
        mapView.addOverlay(circle) // Add the circle directly to the map

        return mapView
      }

      func updateUIView(_ uiView: MKMapView, context: Context) {
          // Update annotation coordinates when needed
//          if let annotation = uiView.annotations.first as? MyPointAnnotation {
//                     annotation.coordinate = CLLocationCoordinate2D(latitude: currLat, longitude: currLong) // Replace with desired new coordinate
//              annotation.
//                 }
      }

      func makeCoordinator() -> Coordinator {
          Coordinator(self)
      }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            // Optionally, handle user location updates
            
            // Add dot marker for user's location
            mapView.removeAnnotations(mapView.annotations) // Remove previous annotations
            let annotation = MKPointAnnotation()
            annotation.coordinate = userLocation.coordinate
            mapView.addAnnotation(annotation)
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization() // Request always authorization for background access
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location

        // Optionally, update the map view region or add annotations here
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location access granted by user")
        case .denied, .restricted:
            print("Location access denied by user")
        case .notDetermined:
            print("Location access not determined")
        @unknown default:
            print("Unknown authorization status")
        }
    }
}
