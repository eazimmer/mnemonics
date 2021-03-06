// Eric Zimmer
// Adam Currier

// WordSearch.swift
// Created for Assignment 5 of CSI 380

import Foundation

// Feel free to put in additional utility code as long as you have
// no loops, no *mutable* global variables, and no custom classes.

// Takes a string character and returns a String array
// of numbers that can represent that character
public func convert(_ char: String) -> [String] {
    var letters: [String] = []
    switch char.uppercased() {
        case "2":
            letters = ["A","B","C"]
        case "3":
            letters = ["D","E","F"]
        case "4":
            letters = ["G","H","I"]
        case "5":
            letters = ["J","K","L"]
        case "6":
            letters = ["M","N","O"]
        case "7":
            letters = ["P","Q","R","S"]
        case "8":
            letters = ["T","U","V"]
        case "9":
            letters = ["W","X","Y","Z"]
        default:
            letters = [char.uppercased()]
    }
    return letters
}


// Replaces each character in a phone number with an array of the
// possible letters that could be in place of that character
// For instance, 234 becomes [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"]]
public func letters(for phoneNumber: String) -> [[String]] {
  let stringArray = phoneNumber.map (String.init).filter{$0 != "-"} // Converting string into array of strings
  let letters = stringArray.map {convert($0)} // Translating string numbers into char equivs
  return letters
}


// Finds all of the ordered permutations of a given
// array of arrays of strings
// combining each choice in one
// array with each choice in the next array, and so on to produce strings
// For instance permuations(of: [["a", "b"], ["c"], ["d", "e"]]) will return
// ["acd", "ace" "bcd", "bce"]
public func permutations(of arrays: [[String]]) -> [String] {
  let viewing = arrays.first! // Force unwrapping of optional

  if arrays.count == 1 { 
    return viewing
  }
  
  let output = permutations(of: Array(arrays.dropFirst(1)))
  return viewing.flatMap { x in output.map { y in x + y}} // Will return optional
}


// Finds all of the possible strings of characters that a phone number
// can potentially represent
// Uses letters(for:) and permutations(of:) to do this
public func possibles(for phoneNumber: String) -> [String] {
  let options = permutations(of: letters(for: phoneNumber))
  return options
}


// Returns all of the words in a given *string* from the wordlist.txt file
// using only words in the word list of minimum length ofMinLength
public func wordsInString(_ string: String, ofMinLength length: UInt) -> [String] {
  let words = queryFile()
  return words.filter {string.contains($0) && $0.length >= length}.sorted{$0.length > $1.length}
}


// Returns all possibles strings of characters that a phone number
// can potentially represent that contain words in words.txt
// greater than or equal to ofMinLength characters
public func possiblesWithWholeWords(ofMinLength length: UInt, for phoneNumber: String) -> [String] {
  let phoneNumberOptions = possibles(for: phoneNumber)
  return phoneNumberOptions.filter {wordsInString($0, ofMinLength: length).count > 0}
}


// Returns the phone number mnemonics that have the most words present in words.txt
// within them (note that these words could be overlapping)
// For instance, if there are two mnemonics that contain three words from
// words.txt, it will return both of them, if the are no other mnemonics
// that contain more than three words
public func mostWords(for phoneNumber: String) -> [String] {
  let phoneNumberOptions = possibles(for: phoneNumber)

  if phoneNumberOptions == [] {
    return []
  }

  let optionsWithCount = phoneNumberOptions.map{ wordsInString($0, ofMinLength: 1).count }
  let most = Dictionary(uniqueKeysWithValues : zip(phoneNumberOptions, optionsWithCount)).sorted{$0.value > $1.value}.filter{$0.value != 0}

  if most.count == 0 {
    return []
  }

  let mostv = most.first!
  return most.filter{$0.value >= mostv.value}.map{$0.key}
}


// Returns the phone number mnemonics with the longest words from words.txt
// If more than one word is tied for the longest, returns all of them
public func longestWords(for phoneNumber: String) -> [String] {
  let phoneNumberOptions = possiblesWithWholeWords(ofMinLength: 1, for: phoneNumber)

  if phoneNumberOptions == [] {
    return []
  }

  let optionsWithCount = phoneNumberOptions.map{ wordsInString($0, ofMinLength: 1).first }
  let most = Dictionary(uniqueKeysWithValues : zip(phoneNumberOptions, optionsWithCount)).filter{ $0.value != nil}.sorted{($0.value!).length > ($1.value!).length}
  let mostv = most.first!

  return most.filter{($0.value!).length >= (mostv.value!).length}.map{$0.key}
}
