//
//  AuthError.swift
//

import Foundation

enum AuthError {
  case notFilled
  case invalidEmail
  case passwordsNotMatched
  case unknownError
  case serverError
}

extension AuthError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .notFilled:
      return "Заполните все поля".localized
    case .invalidEmail:
      return "Формат почты не является допустимым".localized
    case .passwordsNotMatched:
      return "Пароли не совпадают".localized
    case .unknownError:
      return "Неизвестная ошибка".localized
    case .serverError:
      return "Ошибка сервера".localized
    }
  }
}
