//
//  Path.swift
//  EasyLib
//
//  Created by 杜哲 on 2018/11/29.
//

import Foundation

public enum PathError: Error, LocalizedError {
  case notFound
  case containerNotFound(String)
  
  public var errorDescription: String? {
    switch self {
    case .notFound: return "Resource not found"
    case .containerNotFound(let id): return "Shared container for group \(id) not found"
    }
  }
}

public class Path {
  
  public static func inLibrary(_ name: String) throws -> URL {
    return try FileManager.default
      .url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      .appendingPathComponent(name)
  }
  
  public static func inDocuments(_ name: String) throws -> URL {
    return try FileManager.default
      .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      .appendingPathComponent(name)
  }
  
  public static func inBundle(_ name: String) throws -> URL {
    guard let url = Bundle.main.url(forResource: name, withExtension: nil) else {
      throw PathError.notFound
    }
    return url
  }
  
  public static func documents() throws -> URL {
    return try FileManager.default
      .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
  }
}
