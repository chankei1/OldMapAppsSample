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
        
        //古地図の表示
        overLay()
        
        //viewにMapViewを追加.
        self.view.addSubview(googleMap)
    }
    
    
    func overLay(){
        
        //var southWest = CLLocationCoordinate2DMake(36.549910, 136.632714);
        //var northEast = CLLocationCoordinate2DMake(36.582960, 136.683321);
        var southWest = CLLocationCoordinate2DMake(36.583648, 136.681735);
        var northEast = CLLocationCoordinate2DMake(36.550341, 136.631738);
        
        var overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        
        var icon = UIImage(named: "sample.jpg")
        
        //mapプロパティにGMSMapViewをセットする
        overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
        overlay.bearing = 0
        overlay.map = googleMap
        print("aaa")
        print(overlay)
        
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
        //self.nextButton.backgroundColor = UIColor.blackColor()
        self.chengeButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
    }
    
    //ボタンの領域内で指を離したときの処理
    func onClickChengeButton(){
        
        //flg == 0なら古地図を消す
        if(flg == 0){
            overlay.map = nil;
            print("現代MAPに切り替えました")
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
        print("ずれました")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

