import UIKit

//var collectionView = UICollectionView()

 class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var cellWidth = CGFloat()
    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         //statusBar & navigation
         let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
         let statusBarColor = ThemeColors.shared.color(for: "background")
         self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(test))
         
         //add to view
         view.addSubview(collectionView)
         view.addSubview(statusBarView)
         
         //collectionView settings
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
         
         
         //constraints
         updateAllForGameData()
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         
         
         //navigationController settings
         navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "text")]
         
         
         statusBarView.backgroundColor = statusBarColor
     }
     
    
    //update layouts for cell
    override func viewDidLayoutSubviews() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        cellWidth = collectionView.bounds.width / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        collectionView.collectionViewLayout = layout
    }
    
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forGameData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell

        // cell settings
        cell.imageView.image = (forGameData[indexPath[1]].image)
        cell.label.text = forGameData[indexPath[1]].name
        cell.backgroundColor = forGameData[indexPath[1]].color
        
        //checkmark set
        if forGameData[indexPath.row].checked == true {
            cell.checkMark.image = UIImage(systemName: "checkmark")
        } else {cell.checkMark.image = UIImage(systemName: "")}
        
        
        // cell border
        
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.systemGray.cgColor
        
        return cell
    }
    
    
    //set all nil to false in forGameData
    func updateAllForGameData(){
        for i in 0..<forGameData.count {
            if forGameData[i].checked == nil {
                forGameData[i].checked = false
            }
        }

    }

    
    // MARK: - collectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let taskViewController = TaskViewController()
        taskViewController.createLabels(taskLabelFromTable: indexPath.row)
        view.addSubview(taskViewController.currentView)
        navigationController?.pushViewController(taskViewController, animated: true)
        
       }
   
     
     func forReloadData() {
         collectionView.reloadData()
         saveGameDataToDefaults()   
     }

    
    @objc func test(){}
}
