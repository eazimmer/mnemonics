// PhoneNumberMnemonicsTests.swift
// Created for Assignment 5 of CSI 380

import XCTest

@testable import PhoneNumberMnemonics

final class PhoneNumberMnemonicsTests: XCTestCase {
    
    func testLetters1() {
        let result = letters(for: "802")
        let expectation = [["T", "U", "V"], ["0"], ["A", "B", "C"]]
        XCTAssertEqual(result, expectation)
    }
    
    func testLetters2() {
        let result = letters(for: "2341")
        let expectation = [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"], ["1"]]
        XCTAssertEqual(result, expectation)
    }
    
    func testPermutations1() {
        let result = permutations(of: [["A","B"], ["A","B"]])
        let expectation = ["AA", "AB", "BA", "BB"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testPermutations2() {
        let result = permutations(of: [["A","B","C"], ["D","E","F"], ["G", "H"]])
        let expectation = ["ADG", "ADH", "AEG", "AEH", "AFG", "AFH", "BDG", "BDH", "BEG", "BEH", "BFG", "BFH", "CDG", "CDH", "CEG", "CEH", "CFG", "CFH"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testPossibles1() {
        let result = possibles(for: "802")
        let expectation = ["T0A", "T0B", "T0C", "U0A", "U0B", "U0C", "V0A", "V0B", "V0C"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testPossibles2() {
        let result = possibles(for: "8934")
        let expectation = ["TXDI", "VXDG", "TYDG", "TYDH", "VYDH", "VYEI", "VXFG", "TZFI", "UWDI", "UZDG", "TZEI", "VYFI", "UZFG", "VWDG", "UXEG", "TXEI", "UXDI", "UXEI", "UYFG", "UWDH", "UWEG", "TZEH", "VYDG", "VZFI", "UYDH", "TZDI", "VYFG", "UZFI", "VWEH", "UYFH", "VXFH", "UZFH", "VXFI", "VYDI", "TXDG", "UZDH", "UYEI", "VYEG", "UZEH", "VWFG", "TWFH", "UYDI", "UXFI", "TYFI", "TWDG", "TYFH", "UWDG", "TXEH", "VWDH", "TWFG", "VWEI", "VYEH", "VYFH", "TWFI", "TWDI", "TWEG", "TZDG", "UWEI", "TWEH", "TZFG", "TXFI", "TZFH", "TYEH", "VWEG", "VXDI", "UYEH", "UXEH", "UWFI", "TZDH", "UYFI", "TXFH", "UZEI", "UXFH", "VWFI", "UWFG", "TXFG", "UXDH", "VWDI", "UXFG", "UWFH", "TYDI", "VZDG", "TXDH", "VXEH", "UWEH", "VXDH", "TYEG", "TZEG", "VZEG", "TXEG", "VWFH", "UZDI", "VZEI", "TWEI", "UZEG", "VZDH", "VZFG", "UXDG", "TYFG", "VZFH", "TWDH", "UYEG", "TYEI", "VXEG", "UYDG", "VXEI", "VZDI", "VZEH"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testWordsInString1() {
        let result = wordsInString("APPLEBERRYFIG", ofMinLength: 4)
        let expectation = ["APPLE", "BERRY"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testWordsInString2() {
        let result = wordsInString("PINEAPPLE", ofMinLength: 1)
        let expectation = ["PINEAPPLE", "APPLE"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testWholeWords1() {
        let result = possiblesWithWholeWords(ofMinLength: 5, for: "6927753")
        let expectation = ["MWAPPLE", "MXAPPLE", "MYAPPLE", "MZAPPLE", "NWAPPLE", "NXAPPLE", "NYAPPLE", "NZAPPLE", "OWAPPLE", "OXAPPLE", "OYAPPLE", "OZAPPLE"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testWholeWords2() {
        let result = possiblesWithWholeWords(ofMinLength: 3, for: "3447586")
        let expectation = ["FIGPKTO", "EIGPLUM", "FIGPLUO", "FIGSJUO", "FIGSJUM", "FIGPJVO", "FIGRKTM", "DIGPLUM", "FIGQLVO", "FIGPJVM", "FIGPKTM", "FIGSJVM", "FIGSKUM", "FIGQKTM", "FIGRLVM", "FIGSKTN", "FIGRJVO", "EIHPLUM", "FGGPLUM", "FIGSKVO", "FIGRKVM", "FIGQJUM", "FIGPLTN", "FIGSKUO", "FIGSJTO", "FIGSLUM", "EGIPLUM", "FIGPLUM", "FGIPLUM", "FIGRJUN", "FIGRLTM", "DGIPLUM", "EGGPLUM", "FIGSLVN", "FIGQKTO", "DHHPLUM", "DHIPLUM", "FIGRJUM", "EHIPLUM", "FIGSKVN", "EIIPLUM", "FIGRJVN", "EGHPLUM", "FIGQKVM", "FHGPLUM", "FIGRKTO", "FIGPLVO", "FIGRJTM", "FIGPJTM", "DIHPLUM", "DIIPLUM", "FIGPJUO", "FIGQKUO", "EHGPLUM", "FIGRLUO", "FIGQJVO", "FIHPLUM", "FIGQLVN", "FIGPKUN", "FIGSJTN", "FIGSKTO", "FIGSLUN", "FIGQKVO", "FIGQLUN", "FIGPKVM", "FIGQLTO", "FIGPJTN", "FIGRKTN", "FIGPKUM", "FIGQJTM", "FIGQJTN", "FIGPKVN", "FIGRKUM", "FIGRJVM", "FIIPLUM", "FIGPKUO", "FIGSJTM", "FIGPJUM", "FIGSKUN", "FIGQJVM", "FIGSKTM", "FIGPJTO", "FIGQKUM", "FIGSLVM", "FIGSLUO", "FIGQLUM", "FIGPJVN", "FIGPLVM", "FHHPLUM", "FIGRJTO", "FIGSKVM", "FIGQLTM", "FIGSLTN", "FIGQJVN", "FIGRLUM", "FIGQJTO", "DGGPLUM", "FIGRKVO", "FIGRLVO", "FIGQJUO", "EHHPLUM", "FIGRKUO", "FIGSLTM", "FIGPLTM", "FIGRJUO", "FIGRKUN", "FIGQJUN", "FIGPJUN", "FGHPLUM", "FHIPLUM", "FIGPLUN", "FIGQLTN", "FIGRLTN", "FIGRLUN", "FIGSJUN", "FIGQKUN", "FIGSLVO", "FIGPKTN", "DGHPLUM", "DHGPLUM", "FIGQLUO", "FIGQLVM", "FIGQKTN", "FIGPLVN", "FIGSJVO", "FIGQKVN", "FIGPKVO", "FIGPLTO", "FIGRJTN", "FIGRLTO", "FIGRLVN", "FIGSJVN", "FIGSLTO", "FIGRKVN"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testMostWords1() {
        let result = mostWords(for: "3445463")
        let expectation = ["FIGLIME"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testMostWords2() {
        let result = mostWords(for: "73277586")
        let expectation = ["PEARPLUM"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }
    
    func testLongestWords1() {
        let result = longestWords(for: "746327753")
        let expectation = ["PINEAPPLE"]
        // check sets so order doesn't matter and we don't have duplicates
        let setResult = Set(result)
        let setExpectation = Set(expectation)
        XCTAssertEqual(setResult, setExpectation)
        // make sure there were no duplicates
        XCTAssertEqual(setResult.count, result.count)
    }

    static var allTests = [
        ("testLetters1", testLetters1),
        ("testLetters2", testLetters2),
        ("testPermutations1", testPermutations1),
        ("testPermutations2", testPermutations2),
        ("testPossibles1", testPossibles1),
        ("testPossibles2", testPossibles2),
        ("testWordsInString1", testWordsInString1),
        ("testWordsInString2", testWordsInString2),
        ("testWholeWords1", testWholeWords1),
        ("testWholeWords2", testWholeWords2),
        ("testMostWords1", testMostWords1),
        ("testMostWords2", testMostWords2),
        ("testLongestWords1", testLongestWords1),
    ]
}
