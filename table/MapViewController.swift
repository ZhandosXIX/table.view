//
//  MapViewController.swift
//  table
//
//  Created by zhandos on 14.01.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate, MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Запрашиваем разрешение на использование местоположения пользователя
        locationManager.requestWhenInUseAuthorization()
        
        // delegate нужен для функции didUpdateLocations, которая вызывается при обновлении местоположения (для этого прописали CLLocationManagerDelegate выше)
        locationManager.delegate = self
        
        // Запускаем слежку за пользователем
        locationManager.startUpdatingLocation()
        
        
       
        
        
        let locations: [(lat: CLLocationDegrees, long: CLLocationDegrees, title: String, subtitle: String)] = [
                    (43.2374454, 76.909891, "Arsenal", "subtitle"),
                    (43.240589, 76.931661, "Barcelona", "subtitle 2"),
                    (43.250589, 76.981661, "PSG", "subtitle 3")                ]
                
                // Добавляем метки на карту
                for location in locations {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(location.lat, location.long)
                    annotation.title = location.title
                    annotation.subtitle = location.subtitle
                    mapView.addAnnotation(annotation)
                }
            }
        }
