//
//  MeetingsDetailView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit
import MapKit

class MeetingsDetailView: UIView, CLLocationManagerDelegate, MKMapViewDelegate {

    //MARK: - Properties
    var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    var locationManager = CLLocationManager()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .clear
        mainSetup()
   }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    fileprivate func initializeMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        let noLocation = CLLocationCoordinate2D()
        let viewRegion = MKCoordinateRegion(center: noLocation, latitudinalMeters: Distance.standard, longitudinalMeters: Distance.standard)
        mapView.setRegion(viewRegion, animated: false)
        mapView.showsUserLocation = true
        
        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: Distance.standard, longitudinalMeters: Distance.standard)
            mapView.setRegion(viewRegion, animated: false)
        }
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: - Setup and Layout
    override func layoutSubviews() {
        //createRouteButton.rounded()
        //existingRoutesButton.rounded()
    }
    
    fileprivate func mainSetup() {
        initializeMapView()
        
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        addSubview(mapView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.0),
            mapView.widthAnchor.constraint(equalToConstant: Screen.width),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1 * Screen.height * 0.40)
        ])
    }
}
