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

    
    //切り替えボタンの作成
    let chengeButton: UIButton = UIButton()
    
    var overlay = GMSGroundOverlay()
    
    //切り替えボタンのフラグ
    var flg:Int = 0
    
    //画面サイズ
    let screenRotationWidth = UIScreen.mainScreen().bounds.size.width
    let screenRotationHeight = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //googleMapと古地図の表示
        googleMapView()
        
        //ボタンの作成
        chenge()
        
    }
    
    
    func googleMapView(){
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
        
        /*
        ここからmapの調節で使用するマーカー
        */
        let l2: CLLocationDegrees = 36.571837
        let lo2: CLLocationDegrees = 136.657223
        let m2: GMSMarker = GMSMarker()
        m2.position = CLLocationCoordinate2DMake(l2, lo2)
        m2.map = googleMap
        
        let l3: CLLocationDegrees = 36.572669
        let lo3: CLLocationDegrees = 136.658648
        let m3: GMSMarker = GMSMarker()
        m3.position = CLLocationCoordinate2DMake(l3, lo3)
        m3.map = googleMap
        
        let l4: CLLocationDegrees = 36.572326
        let lo4: CLLocationDegrees = 136.661357
        let m4: GMSMarker = GMSMarker()
        m4.position = CLLocationCoordinate2DMake(l4, lo4)
        m4.map = googleMap
        
        let l5: CLLocationDegrees = 36.560295
        let lo5: CLLocationDegrees = 136.656937
        let m5: GMSMarker = GMSMarker()
        m5.position = CLLocationCoordinate2DMake(l5, lo5)
        m5.map = googleMap

        let l6: CLLocationDegrees = 36.565506
        let lo6: CLLocationDegrees = 136.665878
        let m6: GMSMarker = GMSMarker()
        m6.position = CLLocationCoordinate2DMake(l6, lo6)
        m6.map = googleMap
        
        
        let L1C1_la: CLLocationDegrees = 36.577517
        let L1C1_lo: CLLocationDegrees = 136.649726
        let MapL1C1: GMSMarker = GMSMarker()
        MapL1C1.position = CLLocationCoordinate2DMake(L1C1_la, L1C1_lo)
        MapL1C1.map = googleMap
        
        
        //古地図の表示
        overLay()
        
        //viewにMapViewを追加.
        self.view.addSubview(googleMap)
    }
    
    
    func overLay(){
       
        //基準
        var southWest = CLLocationCoordinate2DMake(36.555973, 136.649793);
        var northEast = CLLocationCoordinate2DMake(36.576272, 136.668853);
        
        var overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        
        var icon = UIImage(named: "map.png")
        
        //mapプロパティにGMSMapViewをセットする
        overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
        overlay.bearing = 0
        overlay.map = googleMap
        
    }
    
    
    //切り替えボタン
    func chenge(){
        // ボタンを生成する.
        chengeButton.frame = CGRectMake(0, 0, screenRotationWidth/4.0, screenRotationHeight/8.0)
        chengeButton.backgroundColor = UIColor.redColor();
        chengeButton.layer.masksToBounds = true
        chengeButton.setTitle("切替", forState: .Normal)
        
        chengeButton.layer.cornerRadius = 38.0
        chengeButton.alpha = 0.8
        chengeButton.layer.position = CGPoint(x: self.view.bounds.width - (self.view.bounds.width/3) , y:self.view.bounds.height/1.2)
        chengeButton.addTarget(self, action: "moveClickChengeButton", forControlEvents: .TouchDown)
        chengeButton.addTarget(self, action: "onClickChengeButton", forControlEvents: .TouchUpInside)
        chengeButton.addTarget(self, action: "outClickChengeButton", forControlEvents: .TouchUpOutside)
        // ボタンを追加する.
        self.view.addSubview(chengeButton);
        
    }
    
    //ボタンを押している状態の処理
    func moveClickChengeButton(){
        self.chengeButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    
    //ボタンの領域内で指を離したときの処理
    func onClickChengeButton(){
        
        //flg == 0なら古地図を消す
        if(flg == 0){
            overlay.map = nil;
            //print("現代MAPに切り替えました")
            flg = 1
        }
        else {
            overlay.map = googleMap
            
            flg  = 0
        }
        
        //ボタンの色を元に戻す
        chengeButton.backgroundColor = UIColor.redColor();
    }
    
    func outClickChengeButton(){
        //print("ずれました")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

