//
//  ViewController.swift
//  ofo
//
//  Created by xiaomo on 17/5/22.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController , MAMapViewDelegate , AMapSearchDelegate{

    @IBOutlet weak var oView: UIView!
    var mapView : MAMapView!
    var search : AMapSearchAPI!
    var pin : MyPingPointAnnotation!
    var pinView : MAPinAnnotationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initEffect()
        // 创建高德地图并添加到视图中
        self.createMap()
        
    }
    
    /// 创建地图
    func createMap(){
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        self.view.addSubview(mapView)
        // 把view放到地图的上层
        self.view.bringSubview(toFront: oView)
        // 初始化搜索
        search = AMapSearchAPI();
        search.delegate = self
    }
    
    
    /// 初始化样式效果
    func initEffect(){
        // 左边的 barItem 样式 withRenderingMode设置为alwaysOriginal表示使用图片的本来颜色
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(.alwaysOriginal)
        // 右边的 barItem 样式 withRenderingMode设置为alwaysOriginal表示使用图片的本来颜色
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(.alwaysOriginal)
        // 中间的ofo Logo
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        // 回退按钮的设置(从webview退回到上一个视图)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if let revalVC = revealViewController() {
            revalVC.rearViewRevealWidth = 280
            self.navigationItem.leftBarButtonItem?.target = revalVC
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revalVC.panGestureRecognizer())
        }
    }
    
    
    
    /// 搜索附近的小黄车
    ///
    /// - Parameter sender: 定位按钮
    @IBAction func searchBike(_ sender: UIButton) {
        searchBicycleNearBy()
    }
    
    
    
    /// 把默认的大头钉替换成自定义的图片
    ///
    /// - Parameters:
    ///   - mapView: 地图
    ///   - annotation: 搜索结果
    /// - Returns: 返回
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation is MAUserLocation {
            return nil
        }
        
        let pointReuseIndetifier = "myId"
        var annotationView: MAPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as! MAPinAnnotationView?
            
        if annotationView == nil {
            annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
        }
        
        if (annotation is MyPingPointAnnotation){
            let per = "pid"
            var av = mapView.dequeueReusableAnnotationView(withIdentifier: per)
            if (av == nil){
                av = MAPinAnnotationView(annotation: annotation, reuseIdentifier: per)
            }
            av?.image = #imageLiteral(resourceName: "homePage_wholeAnchor")
            av?.canShowCallout = false
            self.pinView = av as! MAPinAnnotationView!
            return av
        }

        
        if annotation.title == "正常可用" {
            annotationView?.image = #imageLiteral(resourceName: "HomePage_nearbyBike")
        } else {
            annotationView?.image = #imageLiteral(resourceName: "HomePage_nearbyBikeRedPacket")
        }
        annotationView!.canShowCallout = true
        annotationView!.animatesDrop = true
        return annotationView!
    }
    
    
    
    /// 移动地图
    ///
    /// - Parameters:
    ///   - mapView: 地图
    ///   - wasUserAction: 用户操作
    func mapView(_ mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
        if wasUserAction {
            pin.isLockedToScreen = true
            serachCustomLocation(mapView.centerCoordinate)
            pinAnimate()
        }
    }
    
    // MARK: - 大头针动画 坠落动画
    func pinAnimate() {
        // 修改Y坐标
        let endFrame = pinView.frame
        pinView.frame = endFrame.offsetBy(dx: 0, dy: -15)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: {
            self.pinView.frame = endFrame
        }, completion: nil)
    }
    
    
    /// 搜索完小黄车之后标注到地图上
    ///
    /// - Parameters:
    ///   - request: 请求
    ///   - response: 返回
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        guard response.count > 0 else {
            print("周边没有小黄车")
            return
        }
        
        
        var annotations : [MAPointAnnotation] = []
        annotations = response.pois.map{
            let annotation = MAPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees($0.location.latitude),
                                                               longitude: CLLocationDegrees($0.location.longitude))
            if($0.distance < 300){
                annotation.title = "红包区域内开锁任意小黄车"
                annotation.subtitle = "骑行10分钟可得现金红包"
            } else {
                annotation.title = "正常可用"
            }
                
            return annotation
        }
            
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
    }
    
    
    
    /// 地图初始化完成(自定义图片)
    ///
    /// - Parameter mapView: 地图视图
    func mapInitComplete(_ mapView: MAMapView!) {
        self.pin = MyPingPointAnnotation()
        pin.coordinate = mapView.centerCoordinate
        pin.lockedScreenPoint = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
        pin.isLockedToScreen = true
        mapView.addAnnotation(pin)
        mapView.showAnnotations([pin], animated: true)

    }

    
    /// 搜索附近的小黄车
    func searchBicycleNearBy(){
        serachCustomLocation(mapView.userLocation.coordinate)
    }
    
    
    func serachCustomLocation(_ center : CLLocationCoordinate2D) {
        // 搜索
        let request = AMapPOIAroundSearchRequest()
        request.location = AMapGeoPoint.location(withLatitude: CGFloat(center.latitude), longitude: CGFloat(center.longitude))
        request.keywords = "餐馆"
        request.radius = 500
        request.requireExtension = true
        search.aMapPOIAroundSearch(request)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

