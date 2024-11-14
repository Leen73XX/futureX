//
//  Peoject.swift
//  future contract
//
//  Created by Leen Almejarri on 24/03/1446 AH.
//

import Foundation

import SwiftUI

struct Project {
   
    var name: String
    var Objective: String
    var SuccessRate : Int
    var PotentialReturn1: String
    var PotentialReturn2: String
    var PotentialReturn3: String
    var potintialRisks: String
    var MitigationStrategy: String
    var BudgetDetail1 : [Int : String]
    var balance : Float
    var potintialReturn1Icon: String
    var potintialReturn2Icon: String
    var potintialReturn3Icon: String
    
    init(name: String, Objective: String, SuccessRate: Int, PotentialReturn1: String, PotentialReturn2: String, PotentialReturn3: String, potintialRisks: String, MitigationStrategy: String, BudgetDetail1: [Int : String], balance: Float, potintialReturn1Icon: String, potintialReturn2Icon: String, potintialReturn3Icon: String) {
        self.name = name
        self.Objective = Objective
        self.SuccessRate = SuccessRate
        self.PotentialReturn1 = PotentialReturn1
        self.PotentialReturn2 = PotentialReturn2
        self.PotentialReturn3 = PotentialReturn3
        self.potintialRisks = potintialRisks
        self.MitigationStrategy = MitigationStrategy
        self.BudgetDetail1 = BudgetDetail1
        self.balance = balance
        self.potintialReturn1Icon = potintialReturn1Icon
        self.potintialReturn2Icon = potintialReturn2Icon
        self.potintialReturn3Icon = potintialReturn3Icon
    }
}

