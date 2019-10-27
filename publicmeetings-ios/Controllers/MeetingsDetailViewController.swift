//
//  MeetingsDetailViewController.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/6/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit
import MapKit

class MeetingsDetailViewController: UIViewController {

    var meetingsDetail: MeetingsDetailView = {
        var map = MeetingsDetailView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    var meetingAddress: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupView()
        setupLayout()
        
        coordinates(forAddress: meetingAddress) {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            
            self.openMapForPlace(lat: location.latitude, long: location.longitude)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    //Experimental mapping by address
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    public func openMapForPlace(lat:Double = 0, long:Double = 0, placeName:String = "") {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long

        let regionDistance:CLLocationDistance = 100
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "City Hall"
        mapItem.openInMaps(launchOptions: options)
    }
    
    //MARK: - Setup and Layout
    private func setupView() {
        view.addSubview(meetingsDetail)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            meetingsDetail.topAnchor.constraint(equalTo: view.topAnchor),
            meetingsDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            meetingsDetail.widthAnchor.constraint(equalToConstant: Screen.width)
        ])
    }
}
