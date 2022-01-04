// Copyright 2014 Sonia Keys
// License MIT: http://opensource.org/licenses/MIT

// +build !386,!arm

package graph

const (
	wordSize = 64
	wordExp  = 6 // 2^6 = 64
)

// reference: http://graphics.stanford.edu/~seander/bithacks.html
const deBruijnMultiple = 0x03f79d71b4ca8b09
const deBruijnShift = 58

var deBruijnBits = []int{
	0, 1, 56, 2, 57, 49, 28, 3, 61, 58, 42, 50, 38, 29, 17, 4,
	62, 47, 59, 36, 45, 43, 51, 22, 53, 39, 33, 30, 24, 18, 12, 5,
	63, 55, 48, 27, 60, 41, 37, 16, 46, 35, 44, 21, 52, 32, 23, 11,
	54, 26, 40, 15, 34, 20, 31, 10, 25, 14, 19, 9, 13, 8, 7, 6,
}
