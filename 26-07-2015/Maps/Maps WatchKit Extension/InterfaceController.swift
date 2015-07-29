//
//  InterfaceController.swift
//  Maps WatchKit Extension
//
//  Created by User on 26/07/15.
//  Copyright (c) 2015 User All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var map: WKInterfaceMap!

    let location = CLLocationCoordinate2D(latitude: 54.44321, longitude: 18.5600)
    let span = MKCoordinateSpan(latitudeDelta: Double(1), longitudeDelta: Double(1))

    func zoomMap(latitudeDeltaZoom: Float,longitudeDeltaZoom: Float){
        let spanZoomed = MKCoordinateSpan(latitudeDelta: Double(latitudeDeltaZoom), longitudeDelta: Double(longitudeDeltaZoom))
        showMap(spanZoomed)
    }

    func showMap(span: MKCoordinateSpan){
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region)
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        showMap(span)
    }
    
    @IBAction func sliderTapped(value: Float) {

        var latitudeDeltaZoom:Float = 1/value
        var longitudeDeltaZoom:Float = 1/value
        zoomMap(latitudeDeltaZoom, longitudeDeltaZoom: longitudeDeltaZoom)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
