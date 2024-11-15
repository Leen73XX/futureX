//
//  theProject.swift
//  future contract
//
//  Created by Leen Almejarri on 28/03/1446 AH.
//

import Foundation
import SwiftUI

struct theProject  {
    var project1 = Project(name: "RECI", Objective: "Reducing the crime rate in Brooklyn by 15% \n - in case of success you will receive an additional 20% profit. \n - in case of failure you will receive only 50% of the basic value of the contract.", SuccessRate: 20, PotentialReturn1: " 5-10% for investors if targets are met", PotentialReturn2: "Savings on incarceration costs ( $30,000 per year).", PotentialReturn3: "Reduction in crime-related costs to society", potintialRisks: "No return if recidivism reduction targets are not achieved", MitigationStrategy: "Rigorous selection of evidence-based interventions and service providers", BudgetDetail1: [30:"Mental health and substance abuse treatment", 40:"Employment services", 20: "Housing assistance", 10:"Program administration" ], balance: 400, potintialReturn1Icon: "dollarsign.circle", potintialReturn2Icon: "arrowshape.up", potintialReturn3Icon: "person.3", CallGain: "50,000", PutGain: "10,000")
    var project2 = Project(name: "LEARN CHILD", Objective: "Improving Early Childhood Education in Riyadh by 25% \n - in case of success you will receive an additional 25% profit. \n - in case of failure you will receive only 30% of the basic value of the contract.", SuccessRate: 15, PotentialReturn1: "3-7% for investors if targets are met", PotentialReturn2: "Increased consumer spending as stable income", PotentialReturn3: "Enhanced community engagement and stability.", potintialRisks: "Partial or no return if educational improvement targets are not reached", MitigationStrategy: " Continuous monitoring and adjustment of interventions based on interim results ", BudgetDetail1: [ 25 :"Curriculum materials", 20 :"Family engagement programs", 35: "Facilities improvements"], balance: 6453.54, potintialReturn1Icon: "dollarsign.circle",potintialReturn2Icon: "arrowshape.up",potintialReturn3Icon: "person.3", CallGain: "100,000", PutGain: "30,000")
    var project3 = Project(name: "MY HOME", Objective: "Reducing Homelessness in Paris by 50% \n - in case of success you will receive an additional 25% profit. \n - in case of failure you will receive only 30% of the basic value of the contract.", SuccessRate: 30, PotentialReturn1: " 4-8% for investors if targets are met", PotentialReturn2: "Enhanced community quality of life.", PotentialReturn3: "Decreased emergency room visits and costs", potintialRisks: "No return if homelessness reduction targets are not achieved", MitigationStrategy: "Partnerships with multiple service providers to offer comprehensive support", BudgetDetail1: [45 : "Housing subsidies and placement", 25: "Case management services"], balance: 1346.21, potintialReturn1Icon: "dollarsign.circle",potintialReturn2Icon: "house",potintialReturn3Icon: "exclamationmark.triangle", CallGain: "25,000", PutGain: "5,000")
}
