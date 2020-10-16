package readline

import (
	"bufio"
	"fmt"
	"os"
)

// Readline reads from stdin
func Readline(text string) string {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print(text)
	val, _ := reader.ReadString('\n')

	return val
}
