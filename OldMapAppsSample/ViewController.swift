//
//  ViewController.swift
//  OldMapAppsSample
//
//  Created by Keisuke.K on 2015/11/01.
//  Copyright © 2015年 Keisuke.K. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController,GMSMapViewDelegate {

    var googleMap : GMSMapView!
    
    //緯度経度 -> 香林坊
    let lat: CLLocationDegrees = 36.562466
    let lon: CLLocationDegrees = 136.653596
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ズームレベル.
        let zoom: Float = 15
        
        // カメラを生成.
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(lat,longitude: lon, zoom: zoom)
        
        // MapViewを生成.
        googleMap = GMSMapView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        
        // MapViewにカメラを追加.
        googleMap.camera = camera
        
        //マーカーの作成
        let marker: GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(lat, lon)
        marker.map = googleMap
//
        
        //var southWest = CLLocationCoordinate2DMake(40.712216,-74.22655);
        //var northEast = CLLocationCoordinate2DMake(40.773941,-74.12544);
        var southWest = CLLocationCoordinate2DMake(36.549910, 136.632714);
        var northEast = CLLocationCoordinate2DMake(36.582960, 136.683321);
        
        var overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        
        var icon = UIImage(named: "sample.jpg")
        
        var overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
        overlay.bearing = 0
        overlay.map = googleMap
        
//        //-----
//        /* MapView inital values & dependencies */
//        //initialLocation = CLLocationCoordinate2DMake(37.78, -122.41)
//        let initialDirection = CLLocationDirection()
//        let zoom: Float = 15
//        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(lat,longitude: lon, zoom: zoom)
//        
//        /* Set up MapView */
//        var mapView_ = GMSMapView(frame: CGRectZero)
//        mapView_.camera = camera
//        mapView_.myLocationEnabled = true
//        self.view = mapView_
//        mapView_.delegate = self
//        
//        //レイヤーの作成
//        //let southWest: CLLocationCoordinate2D = CLLocationCoordinate2DMake(40.712216, -74.22655)
//        //let northEast: CLLocationCoordinate2D = CLLocationCoordinate2DMake(40.773941, -74.12544)
//        let overlayBounds: GMSCoordinateBounds = GMSCoordinateBounds(coordinate: southwest, coordinate: northeast)
//        //let icon: UIImage = UIImage.imageNamed("kanazawa.jpg")
//        let icon = UIImage(named:"kanazawa.png")
//        //var overlay: GMSGroundOverlay = GMSGroundOverlay.groundOverlayWithBounds(overlayBounds, icon: icon)
//        let overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
//        overlay.bearing = 0
//        overlay.map = googleMap
        
        //viewにMapViewを追加.
        self.view.addSubview(googleMap)
    }

    
//    class TestTileLayer: GMSSyncTileLayer {
//        override func tileForX(x: UInt, y: UInt, zoom: UInt) -> UIImage! {
//            // On every odd tile, render an image.
//            if (x % 2 == 0) {
//                return UIImage(named: "kanazawa")
//            } else {
//                return kGMSTileLayerNoTile;
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

