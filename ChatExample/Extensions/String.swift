//
//  String.swift
//  ChatExample
//
//  Created by demothreen on 03.05.2022.
//

import Foundation

extension String {
  var localized: String {
    NSLocalizedString(self, comment: "")
  }
}
