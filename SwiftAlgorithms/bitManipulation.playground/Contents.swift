
// 0b denotes that the number is binary

// NOT operator
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
print("\(String(invertedBits, radix: 2))")

// AND operator
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
print("\(String(middleFourBits, radix: 2))")


// OR operator
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits
print("\(String(combinedBits, radix: 2))")

// XOR operator
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
print("\(String(outputBits, radix: 2))")


// Shifting Behavior for Unsigned Integers
let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001


// Signed Integer, two's complement
let signedIntege: Int8 = 0b1111110

// Overflow Operators
var potentialOverflow = Int8.max
print("\(String(potentialOverflow, radix: 2))")
potentialOverflow = potentialOverflow &+ 1
print("\(String(potentialOverflow, radix: 2))")

potentialOverflow = Int8.min
print("\(String(potentialOverflow, radix: 2))")
potentialOverflow = potentialOverflow &- 1
print("\(String(potentialOverflow, radix: 2))")


var unsignedOverflow = UInt8.min
print("\(String(unsignedOverflow, radix: 2))")
unsignedOverflow = unsignedOverflow &- 1
print("\(String(unsignedOverflow, radix: 2))")

unsignedOverflow = UInt8.max
print("\(String(unsignedOverflow, radix: 2))")
unsignedOverflow = unsignedOverflow &+ 1
print("\(String(unsignedOverflow, radix: 2))")


// get bit: check if bit i has a 1
func getBit(num: Int8, i: Int8) -> Bool {
    print("\(String(num, radix: 2))")
    return ((num & (1 << i)) != 0)
}

getBit(num: 120, i: 2)


// Set bit: set bit i as 1
func setBit(num: Int8, i: Int8) -> Int8 {
    return num | (1 << i)
}

// Clear bit: set bit i as 0
func clearBit(num: Int8, i: Int8) -> Int8 {
    let mask : Int8 = ~(1 << i)
    return num & mask
}

// Clear bit from the most significant bit through i(inclusive)
func clearBitsMSBthroughI(num: Int8, i: Int8) -> Int8 {
    let mask : Int8 = (1 << i) - 1
    return num & mask
}

// Clear bit i through 0
func clearBitsIthrough0(num: Int8, i: Int8) -> Int8 {
    let mask : Int8 = (-1 << (i + 1))
    print("\(String(mask, radix: 2))")
    return num & mask
}

// Update bit
func updateBit(num: Int8, i: Int8, bitIs1: Bool) -> Int8 {
    let value : Int8 = bitIs1 ? 1 : 0
    let mask : Int8 = ~(1 << i)
    return (num & mask) | (value << i)
}
