// Eric Zimmer
// Adam Currier

// WordList.swift
// Created for Assignment 5 of CSI 380

import Foundation

// You'll want to create a mechanism here for loading and querying
// words.txt. It's up to you how you do this. You may consider a struct.

public func queryFile() -> [String] {
  do {
    return try String(contentsOfFile: "words.txt").uppercased().components(separatedBy: "\n")
  } catch {
    print("An error occurred, the file could not be read.")
  }

  return [] //pointless return for compilers sake
}