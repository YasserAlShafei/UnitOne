//
//  ViewController.swift
//  UnitOne Task
//
//  Created by Yasser Al-ShaFei on 24/03/2022.
//

import UIKit
import Alamofire
import SDWebImage
import FirebaseAuth



class ViewController: UIViewController {

    @IBOutlet weak var collectionApps: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var imagesArraySlider: [String] = []
    var citys: [ViewModel] = []
    
    @IBOutlet weak var viewBa: UIView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UIButton!
    @IBOutlet weak var signUp: UIButton!
    var isLogIN = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        collectionApps.reloadData()
        //pageController.delegate = self
        
        if Auth.auth().currentUser == nil {
            viewBa.backgroundColor = .red
            lbl1.text = "Hi"
            lbl2.titleLabel?.text = "Hi"

        }else{
            viewBa.backgroundColor = .yellow

        }
        
    }
    
    
    
    func getData(){
        var header = [String:Any]()
        AF.request("http://ahmedqazzaz.com/unitone/home", method: .get).responseJSON { [self] response in
            
            switch response.result {
            case .success(let result):
                let dic = result as! [String:Any]
                let status = dic["status"] as? Bool ?? false
                if status {
                    let result = dic["data"] as! [String:Any]
                    
                    let slider1 = result["slider"] as? [Any]
                    
                    do {
                        let sliderData = try! JSONSerialization.data(withJSONObject: slider1, options: [])
                        let userResponse = try JSONDecoder().decode([ViewModel].self, from: sliderData)
                        for i in userResponse {
                            imagesArraySlider.append(i.imageURL)
                        }
                        pageController.numberOfPages = imagesArraySlider.count
                        
                        for i in 0..<imagesArraySlider.count {
                            let imageView = UIImageView()
                            imageView.contentMode = .scaleToFill
                            imageView.image = UIImage(named: imagesArraySlider[i])
                            
                            imageView.sd_setImage(with: URL(string: "\(imagesArraySlider[i])"))
                            
                            let xPos = CGFloat(i)*self.view.bounds.size.width
                            imageView.frame = CGRect(x: xPos, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height)
                            scrollView.contentSize.width = view.frame.size.width*CGFloat(i+1)
                            scrollView.addSubview(imageView)
                        }
                        
                        
                    }catch{
                        print("ERROR")
                    }
                    
                    
                    
                    let slider2 = result["allCities"] as? [Any]
                    do {
                        let sliderData = try! JSONSerialization.data(withJSONObject: slider2, options: [])
                        let userResponse = try JSONDecoder().decode([ViewModel].self, from: sliderData)
                        for i in userResponse {
                            citys.append(i)
                            collectionApps.reloadData()
                        }
                        
                        
                    }catch{
                        print("ERROR")
                    }
                    
                    
                }else{
                    let message = dic["message"] as? String ?? ""
                    print(message)
                }
                
            case .failure(let error):
                print("==>2 \(error.localizedDescription)")
            }
            
        }
    }
    
    
}




extension ViewController: UIScrollViewDelegate, UIPageViewControllerDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.width
        pageController.currentPage = Int(page)
        if Int(page) == 2 {
            pageController.currentPage = 0
        }
    }
}




extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCVC", for: indexPath) as! CityCVC
        cell.nameC.text = citys[indexPath.row].name
        cell.imageC.sd_setImage(with: URL(string: citys[indexPath.row].imageURL))
        cell.imageC.layer.cornerRadius = 23
        return cell
    }
    
    
}
