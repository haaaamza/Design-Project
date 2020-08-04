//
//  HealthViewController.swift
//  foodDetection
//
//  Created by Hamza Mian on 2020-04-14.
//  Copyright © 2020 Qiang Xu. All rights reserved.
//

import UIKit
import HealthKit

public let healthStore = HKHealthStore()
class HealthViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var glucoseLabel: UILabel!
    @IBOutlet weak var realglucoseLabel: UILabel!
    
    
    @IBAction func getDetails(_ sender: Any) {
        let (age, bloodType, sex) = self.readProfile()
        self.ageLabel.text = "\(age ?? 1)"
        self.sexLabel.text=self.getSex(sex: sex?.biologicalSex)
        self.glucoseLabel.text=self.getbloodType(bloodyType: bloodType?.bloodType)
    }
    @IBAction func healthAuthorize(_ sender: Any) {
        self.authorizeHealth()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func getbloodType (bloodyType: HKBloodType?) -> String{
        
        var bloodTypetext="";
        
        if bloodyType != nil {
            switch (bloodyType!){
            case .aPositive:
                bloodTypetext = "A+"
            case .aNegative:
                bloodTypetext = "A-"
            case .oNegative:
                bloodTypetext = "O-"
            case .oPositive:
                bloodTypetext = "O+"
            case .bPositive:
                bloodTypetext = "B+"
            case .bNegative:
                bloodTypetext = "B-"
            case .abPositive:
                bloodTypetext = "AB+"
            case .abNegative:
                bloodTypetext = "AB-"
            case .notSet:
                bloodTypetext = "NA"
            @unknown default:
                bloodTypetext = "NA"

            }
        }
        return bloodTypetext
    }
    func getSex (sex: HKBiologicalSex?) -> String{
        
        var sexText="";
        
        if sex != nil {
            switch (sex!){
            
            case .notSet:
                sexText="NA"
            case .female:
                sexText="F"
            case .male:
                sexText="M"
            case .other:
                sexText="Other"
            @unknown default:
                sexText="NA"

            }
    }
        return sexText

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func authorizeHealth(){
        let healthkitRead: Set<HKObjectType> = [ HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!,
                                                 HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose)!,
                                                 HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType)!,
                                                 HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!
           ]
        
        let healthkitWrite: Set<HKSampleType> = []
        
        if !HKHealthStore.isHealthDataAvailable(){
            print("error occured")
            return
        }
        
        healthStore.requestAuthorization(toShare: healthkitWrite, read: healthkitRead)
        { (success, error) -> Void in
            
            if !success {
                            print("Error when requesting authorization: \(String(describing: error))")
                        }
            
            print("Read Write Authorization Succeeded")
        }
         
        
    }
    func readProfile() ->  (age: Int?, bloodType: HKBloodTypeObject?, /*bloodGlucose: Double?,*/ sex: HKBiologicalSexObject? ){
        var age: Int?
        var bloodType: HKBloodTypeObject?
        //var bloodGlucose: Double?
        var sex: HKBiologicalSexObject?
        
        do {
            let birthDate = try healthStore.dateOfBirthComponents()
            let nowDate = Calendar.current
            let currentYear = nowDate.component(.year, from: Date())
            let age2 = currentYear - birthDate.year!
            age = age2
            } catch {
                print("Error when request age from HealthKit")
            }
        do{
            bloodType = try healthStore.bloodType()
        }catch{}
        
        do{
            sex = try healthStore.biologicalSex()
        }catch {}
//        do {
//            bloodGlucose = try HKStatisticsQuery(quantityType: HKUnitMolarMassBloodGlucose, quantitySamplePredicate: <#T##NSPredicate?#>, options: <#T##HKStatisticsOptions#>, completionHandler: <#T##(HKStatisticsQuery, HKStatistics?, Error?) -> Void#>)
//        }
        return (age, bloodType, sex)
                          
    }

}

