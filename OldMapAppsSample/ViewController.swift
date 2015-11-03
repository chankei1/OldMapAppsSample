//
//  ViewController.swift
//  OldMapAppsSample
//
//  Created by Keisuke.K on 2015/11/01.
//  Copyright © 2015年 Keisuke.K. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    var googleMap : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 緯度.
        let lat: CLLocationDegrees = 36.562450
        
        // 経度.
        let lon: CLLocationDegrees = 136.653662
        
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
        marker.title = "notice"
        marker.snippet = "japan"
        marker.map = googleMap
        
        // viewにMapViewを追加.
        self.view.addSubview(googleMap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

