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
    
//    //緯度経度 -> 香林坊  36.566220, 136.659704
//    let lat: CLLocationDegrees = 36.562466
//    let lon: CLLocationDegrees = 136.653596

    //緯度経度 -> 金沢城内
    let lat: CLLocationDegrees = 36.566220
    let lon: CLLocationDegrees = 136.659704
    
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
//        let marker: GMSMarker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(lat, lon)
//        marker.map = googleMap
        
        /*
        惣構のピン作成
        */
        //金沢東別院北側(西外惣構)
        let westOutsideFenceLatitude: CLLocationDegrees = 36.575348
        let westOutsideFenceLongitude: CLLocationDegrees = 136.654999
        let westOutsideFence: GMSMarker = GMSMarker()
        westOutsideFence.position = CLLocationCoordinate2DMake(westOutsideFenceLatitude, westOutsideFenceLongitude)
        westOutsideFence.map = googleMap
        
        //升形
        let masugataLatitude: CLLocationDegrees = 36.573454
        let masugataLongitude: CLLocationDegrees = 136.653790
        let masugata: GMSMarker = GMSMarker()
        masugata.position = CLLocationCoordinate2DMake(masugataLatitude, masugataLongitude)
        masugata.map = googleMap

        //西外惣構跡(武蔵町地点)
        let MusashimachiLatitude: CLLocationDegrees = 36.572017
        let MusashimachiLongitude: CLLocationDegrees = 136.652761
        let westOutsideMusashimachi: GMSMarker = GMSMarker()
        westOutsideMusashimachi.position = CLLocationCoordinate2DMake(MusashimachiLatitude, MusashimachiLongitude)
        westOutsideMusashimachi.map = googleMap

        //香林坊2丁目街園(西外惣構)
        let westOutsideKorinboLatitude: CLLocationDegrees = 36.566762
        let westOutsideKorinboLongitude: CLLocationDegrees = 136.651079
        let westOutsideKorinbo: GMSMarker = GMSMarker()
        westOutsideKorinbo.position = CLLocationCoordinate2DMake(westOutsideKorinboLatitude, westOutsideKorinboLongitude)
        westOutsideKorinbo.map = googleMap

        //香林坊~長町_せせらぎ通り(西外惣構)
        let seseragiLatitude: CLLocationDegrees = 36.562382
        let seseragiLongitude: CLLocationDegrees = 136.652815
        let westOutsideSeseragi: GMSMarker = GMSMarker()
        westOutsideSeseragi.position = CLLocationCoordinate2DMake(seseragiLatitude, seseragiLongitude)
        westOutsideSeseragi.map = googleMap
        
        //宮内橋詰遺構(西外惣構)
        let kunaiLatitude: CLLocationDegrees = 36.560830
        let kunaiLongitude: CLLocationDegrees = 136.656103
        let westOutsideKunai: GMSMarker = GMSMarker()
        westOutsideKunai.position = CLLocationCoordinate2DMake(kunaiLatitude, kunaiLongitude)
        westOutsideKunai.map = googleMap
        
        //金沢21世紀美術館南側(西外惣構)
        let kanazawa21biLatitude: CLLocationDegrees = 36.560301
        let kanazawa21biLongitude: CLLocationDegrees = 136.657438
        let westOutside21bi: GMSMarker = GMSMarker()
        westOutside21bi.position = CLLocationCoordinate2DMake(kanazawa21biLatitude, kanazawa21biLongitude)
        westOutside21bi.map = googleMap
        
        //広坂遺跡
        let hirosakaRuinsLatitude: CLLocationDegrees = 36.560278
        let hirosakaRuinsLongitude: CLLocationDegrees = 136.658553
        let hirosakaRuins: GMSMarker = GMSMarker()
        hirosakaRuins.position = CLLocationCoordinate2DMake(hirosakaRuinsLatitude, hirosakaRuinsLongitude)
        hirosakaRuins.map = googleMap
        
        //兼六園_山崎山(東外惣構)
        let eastKenrokuenLatitude: CLLocationDegrees = 36.561623
        let eastKenrokuenLongitude: CLLocationDegrees = 136.664208
        let eastKenrokuen: GMSMarker = GMSMarker()
        eastKenrokuen.position = CLLocationCoordinate2DMake(eastKenrokuenLatitude, eastKenrokuenLongitude)
        eastKenrokuen.map = googleMap
        
        //東兼六町(東外惣構)
        let eastKenrokumachiLatitude: CLLocationDegrees = 36.562846
        let eastKenrokumachiLongitude: CLLocationDegrees = 136.667692
        let eastKenrokumachi: GMSMarker = GMSMarker()
        eastKenrokumachi.position = CLLocationCoordinate2DMake(eastKenrokumachiLatitude, eastKenrokumachiLongitude)
        eastKenrokumachi.map = googleMap
        
        //小将町中学校東側(東内惣構)
        let kosyoCityLatitude: CLLocationDegrees = 36.565057
        let kosyoCityLongitude: CLLocationDegrees = 136.665744
        let kosyoCity: GMSMarker = GMSMarker()
        kosyoCity.position = CLLocationCoordinate2DMake(kosyoCityLatitude, kosyoCityLongitude)
        kosyoCity.map = googleMap
        
        
        //橋場_枯木橋_東内惣構
        let karekiBridgeLatitude: CLLocationDegrees = 36.570637
        let karekiBridgeLongitude: CLLocationDegrees = 136.663729
        let karekiBridge: GMSMarker = GMSMarker()
        karekiBridge.position = CLLocationCoordinate2DMake(karekiBridgeLatitude, karekiBridgeLongitude)
        karekiBridge.map = googleMap
        
        //東内惣構跡_枯木橋詰遺構
        let karekiBridgeEastLatitude: CLLocationDegrees = 36.571394
        let karekiBridgeEastLongitude: CLLocationDegrees = 136.663659
        let karekiBridgeEast: GMSMarker = GMSMarker()
        karekiBridgeEast.position = CLLocationCoordinate2DMake(karekiBridgeEastLatitude, karekiBridgeEastLongitude)
        karekiBridgeEast.map = googleMap

        //尾山神社前(西内惣構)
        let oyamaShrineLatitude: CLLocationDegrees = 36.566186
        let oyamaShrineLongitude: CLLocationDegrees = 136.654478
        let oyamaShrine: GMSMarker = GMSMarker()
        oyamaShrine.position = CLLocationCoordinate2DMake(oyamaShrineLatitude, oyamaShrineLongitude)
        oyamaShrine.map = googleMap
        
        //尾山神社南側(西内惣構)
        let oyamaShrineSouthLatitude: CLLocationDegrees = 36.565132
        let oyamaShrineSouthLongitude: CLLocationDegrees = 136.655791
        let oyamaShrineSouth: GMSMarker = GMSMarker()
        oyamaShrineSouth.position = CLLocationCoordinate2DMake(oyamaShrineSouthLatitude, oyamaShrineSouthLongitude)
        oyamaShrineSouth.map = googleMap
        
        
        //主計町緑水苑(西内惣構)
        let kazueCityLatitude: CLLocationDegrees = 36.572859
        let kazueCityLongitude: CLLocationDegrees = 136.662629
        let kazueCity: GMSMarker = GMSMarker()
        kazueCity.position = CLLocationCoordinate2DMake(kazueCityLatitude, kazueCityLongitude)
        kazueCity.map = googleMap

        
        
        
        
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
        
        var icon = UIImage(named: "map2.png")
        
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

