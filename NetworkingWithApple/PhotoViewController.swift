import UIKit



class PhotoViewController: UIViewController {
    
    let photoInfoController = PhotoInfoController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            self.updateUI(with: photoInfo!)
        }
        
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        print("it works")
    }



}

