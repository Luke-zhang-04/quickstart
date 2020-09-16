package array

// Contains if array contains an item
func Contains(array []string, targets ...string) bool {
	for _, item := range array {
		for _, target := range targets {
			if item == target {
				return true
			}
		}
	}

	return false
}
