//
//  LoginViewModel.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 22/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewModelDelagte {
    
    func getSuccessOTP(isSuccess:Bool)
    func verfiyOTP(isSuccess:Bool)
    func finishOTPTimer()
}


class LoginViewModel:NSObject {
    var delegate: LoginViewModelDelagte!
    private var lblTimer = UILabel()
    private var objOtp: OTPFeed!
    var countdownTimer: Timer!
    var totalTime = 30
    
    func getOTP(mNumber:String){
        APICall.share.requestOTPAuthentication(mobileNumber: mNumber) { (response) in
            let feedData:String =  (response.Status! == "Success") ?  response.Details! : ""
            if !(feedData.isEmpty) {
             self.objOtp = response
                self.delegate.getSuccessOTP(isSuccess: true)
            }
            
        }
       
    }
    func verifyOTP(otp:String) {
        APICall.share.requestOTPAuthenticationVerify(otp: otp, sessionID: self.objOtp.Details!, requestFor: .requestVerifyOTP) { (response) in
            let feedData:String =  (response.Status! == "Success") ?  response.Details! : ""
            if !(feedData.isEmpty) {
                self.delegate.verfiyOTP(isSuccess: true)
            }
        }
        
    }
    func startOtpTimer(label:UILabel, timeLimit:Int) {
        self.totalTime = timeLimit
        self.lblTimer = label
        self.lblTimer.isHidden =  false
         countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
        self.lblTimer.text = "\(timeFormatted(totalTime))"
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }

    private func endTimer() {
        self.lblTimer.isHidden = true
        self.delegate.finishOTPTimer()
        countdownTimer.invalidate()
    }

    private func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func switchDashboardController() {
        let leftMenuVC: SliderMenuVC = mainStoryboard.instantiateViewController(withIdentifier: "SliderMenuVC") as! SliderMenuVC
        let centerVC = (dashboardStoryboard.instantiateViewController(withIdentifier: "MainNavigation") as! UINavigationController)
        let rootController = FAPanelController ()
        rootController.configs.rightPanelWidth = 808
        rootController.configs.bounceOnRightPanelOpen = false
       NavigationHelper.helper.navController =  centerVC
     _ = rootController.center(centerVC).left(leftMenuVC)
        UIApplication.shared.windows.first!.rootViewController =  rootController
        
   /*    old code
    let tabBarController =  CustomTabbarController()
   NavigationHelper.helper.navController = (dashboardStoryboard.instantiateViewController(withIdentifier: "MainNavigation") as! UINavigationController)
     //   NavigationHelper.helper.navController.viewControllers = [tabBarController]
        UIApplication.shared.windows.first!.rootViewController =  tabBarController //NavigationHelper.helper.navController
  
    */
    }
    
}

