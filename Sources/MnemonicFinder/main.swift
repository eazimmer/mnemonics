import PhoneNumberMnemonics

print("Enter phone number:")
if let phoneNumber = readLine() {
    print("All possible mnemonics:")
    print(possiblesWithWholeWords(ofMinLength: 1, for: phoneNumber))
    print("Mnemonics with the most number of valid words in them:")
    print(mostWords(for: phoneNumber))
    print("Mnemonics with the longest words:")
    print(longestWords(for: phoneNumber))
} else {
    print("Need a valid input phone number")
}
