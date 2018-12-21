//
//  SilderMenuVC.swift
//  BhaktiSagar
//
//  Created by Jitendra Kumar Agarwal on 21/12/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class SliderMenuVC: UIViewController {
    @IBOutlet var tblSliderMenu: UITableView!
    private let model = SliderMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
// MARK:- Table view Delegate and Datascource
extension SliderMenuVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowInSection
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
      let cell:SliderMenuCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(model.heightForRow)
    }
}
