//
//  ReminderViewController+Action.swift
//  DailyDo
//
//  Created by Patryk Soliński on 03/10/2022.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
