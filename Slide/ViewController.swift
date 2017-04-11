//
//  ViewController.swift
//  Slide
//
//  Created by Salem Khan on 3/3/17.
//  Copyright © 2017 Salem Khan. All rights reserved.
//

import UIKit

struct Places {
    let nameAddress: String
    let mainImage: UIImage
    let secondImage: UIImage?
    let lat: Double
    let long: Double
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func switchToCategoryFromButton(_ sender: Any) {
        let categoryDefaults = UserDefaults.standard
        switch (sender as AnyObject).tag {
        case 0:
            categoryDefaults.set("Coffee", forKey: "Category")
            break
        case 1:
            categoryDefaults.set("Dining", forKey: "Category")
            break
        case 2:
            categoryDefaults.set("Nightlife", forKey: "Category")
            break
        case 3:
            categoryDefaults.set("Party", forKey: "Category")
            break
        case 4:
            categoryDefaults.set("Fitness", forKey: "Category")
            break
        case 5:
            categoryDefaults.set("Gaming", forKey: "Category")
            break
        case 6:
            categoryDefaults.set("Study Group", forKey: "Category")
            break
        case 7:
            categoryDefaults.set("Causes", forKey: "Category")
            break
        case 8:
            categoryDefaults.set("Chill", forKey: "Category")
            break
        case 9:
            categoryDefaults.set("Others", forKey: "Category")
            break
        default:
            break
        }
        
        print("button press \(categoryDefaults.value(forKey: "Category") as! String)")
        
        performSegue(withIdentifier: "categoryDetail", sender: self)
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Create Event",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(eventBtn)
        )
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Profile",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(profileBtn)
            
            
        )
        
        setupPlaces()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Home"
    }
    
    var places = [Places]()
    
    func setupPlaces() {
        places.append(Places.init(nameAddress: "RPAC, Ohio State", mainImage: #imageLiteral(resourceName: "RPAC1-yelp"), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "The Union, Ohio State", mainImage: #imageLiteral(resourceName: "Union"), secondImage: nil, lat: 39.997957, long: -83.0085650))
        places.append(Places.init(nameAddress: "18th Ave Library, Ohio State", mainImage: #imageLiteral(resourceName: "18thAvelibrary"), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "Thompson Library, Ohio State", mainImage: #imageLiteral(resourceName: "ThompsonLibrary"), secondImage: #imageLiteral(resourceName: "ThompsonLibrary1"), lat: 39.999472, long: -83.014833))
        
        places.append(Places.init(nameAddress: "Capital University", mainImage: #imageLiteral(resourceName: "CapitalUni"), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "Columbus State CC.", mainImage: #imageLiteral(resourceName: "ColumbusStateCC"), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Ohio Expo Center", mainImage: #imageLiteral(resourceName: "ohioexpocenter"), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Columbus Convention Center", mainImage: #imageLiteral(resourceName: "GreaterConventionCenter"), secondImage: nil, lat: 39.970323, long: -83.000803))
        places.append(Places.init(nameAddress: "Starbucks Coffee (across Union)", mainImage: #imageLiteral(resourceName: "Starbucks1"), secondImage: nil, lat: 39.999009, long: -83.007331))
        places.append(Places.init(nameAddress: "Chipotle (across Union)", mainImage: #imageLiteral(resourceName: "Chipotle"), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Ugly Tuna", mainImage: #imageLiteral(resourceName: "UglyTuna "), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Short North Pint House", mainImage: #imageLiteral(resourceName: "Pinthouse"), secondImage: nil, lat: 39.978351, long: -83.003153))
        places.append(Places.init(nameAddress: "Axis Nightclub", mainImage: #imageLiteral(resourceName: "Axisnightclub"), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "World of Beer", mainImage: #imageLiteral(resourceName: "WorldofBeer3"), secondImage: #imageLiteral(resourceName: "WorldofBeer1"), lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Park street Cantina", mainImage: #imageLiteral(resourceName: "ParkStreetCantina"), secondImage: #imageLiteral(resourceName: "ParkStreetCantina1"), lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Char bar", mainImage: #imageLiteral(resourceName: "Charbar"), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Mapfre stadium", mainImage: #imageLiteral(resourceName: "mapfre-stadium"), secondImage: nil, lat: 40.009521, long: -82.991087))
        places.append(Places.init(nameAddress: "Nationwide Arena", mainImage: #imageLiteral(resourceName: "NationwideArena"), secondImage: #imageLiteral(resourceName: "NationWideArena1"), lat: 39.969274, long: -83.005992))
        
        places.append(Places.init(nameAddress: "Out R Inn", mainImage: #imageLiteral(resourceName: "OutRInn"), secondImage: nil, lat: 40.005088, long: -83.008432))
        
        places.append(Places.init(nameAddress: "Midway Bar and Grill", mainImage: #imageLiteral(resourceName: "MidwayonHigh-Yelp"), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "Newport Music & Big Bar", mainImage: #imageLiteral(resourceName: "NewportMusicHall-yelp"), secondImage: nil, lat: 39.997719, long: -83.007267))
        places.append(Places.init(nameAddress: "Polaris Fashion Mall", mainImage: #imageLiteral(resourceName: "PolarisFashionPlace"), secondImage: #imageLiteral(resourceName: "PolarisFashionPlace1-yelp"), lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Easton Town Center", mainImage: #imageLiteral(resourceName: "EastonTownCenter"), secondImage: nil, lat: 0, long: 0))
        places.append(Places.init(nameAddress: "Downtown, Columbus", mainImage: #imageLiteral(resourceName: "DowntownColumbus "), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "Short North", mainImage: #imageLiteral(resourceName: "ShortNorth"), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "German Village", mainImage: #imageLiteral(resourceName: "germanvillage"), secondImage: nil, lat: 0, long: 0))
        
        places.append(Places.init(nameAddress: "Fox in the Snow Cafe", mainImage: #imageLiteral(resourceName: "FoxandSnowCafe"), secondImage: nil, lat: 39.984228, long: -82.999388))
        
        self.collectionView.reloadData()
    }
    
    func eventBtn(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Events", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SelectionViewController") as UIViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func profileBtn(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! ProfileViewController
        controller.userId = Authenticator.currentFIRUser?.uid
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlaceDetailViewController") as! PlaceDetailViewController
        vc.place = place
        self.navigationController?.pushViewController(vc, animated: true)
       // self.performSegue(withIdentifier: "categoryDetail", sender: self)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        (cell.viewWithTag(1) as! UIImageView).image = places[indexPath.row].mainImage
        (cell.viewWithTag(2) as! UILabel).text = places[indexPath.row].nameAddress
        return cell
    }
}

extension ViewController : TRMosaicLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
//        if indexPath.item != 0 {
//            if (indexPath.item + 1 - 0) / 3 == 0 {
//                return .small
//            }else if (indexPath.item + 1 - 1) / 3 == 0  {
//                return .small
//            }else if (indexPath.item + 1 - 2) / 3 == 0  {
//                return .small
//            }
//        }
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.5, left: 0.5, bottom: 0.5, right: 0.5)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 200
    }
}
