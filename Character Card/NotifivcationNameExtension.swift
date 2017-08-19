//
//  NotifivcationNameExtension.swift
//  Character Card
//
//  Created by user on 2017/7/19.
//  Copyright © 2017年 allen. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let agePickerChanged = Notification.Name("agePickersChanged")
    static let genderPickerChanged = Notification.Name("genderPickersChanged")
    static let careerPickerChanged = Notification.Name("careerPickerChanged")
    static let timeAgePickerChanged = Notification.Name("timeAgePickersChanged")
    static let careerPointPickerChanged = Notification.Name("careerPointPickersChanged")
    static let normalPointPickerChanged = Notification.Name("normalPointPickersChanged")
    static let creditLevelPickerChanged = Notification.Name("creditLevelPickersChanged")
    static let tapFunc = Notification.Name("tapFunc")
    static let alert = Notification.Name("alert")
    static let valueSelected = Notification.Name("valueSelected")
    static let skillsHeaderAlert = Notification.Name("skillsHeaderAlert")
}
