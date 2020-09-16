package main

import (
	"fmt"
	"os"

	quickstart "./src"
	array "./src/utils/array"
	readline "./src/utils/input"
)

// Quickstart
// Copyright (c) 2020 Luke Zhang | https://luke-zhang-04.github.io/ | MIT Licence

const version = "2.0.0"

var (
	IGreen  = quickstart.Colours["IGreen"]
	Cyan    = quickstart.Colours["Cyan"]
	IBlue   = quickstart.Colours["IBlue"]
	Reset   = quickstart.Colours["RESET"]
	Purple  = quickstart.Colours["Purple"]
	Yellow  = quickstart.Colours["Yellow"]
	IRed    = quickstart.Colours["IRed"]
	BIGreen = quickstart.Colours["BIGreen"]
	BIRed   = quickstart.Colours["BIRed"]
)

var quickstartAscii = Cyan + `
  ____        _      _        _             _
 / __ \      (_)    | |      | |           | |
| |  | |_   _ _  ___| | _____| |_ __ _ _ __| |_
| |  | | | | | |/ __| |/ / __| __/ _\ | __| __|
| |__| | |_| | | (__|   <\__ \ || (_| | |  | |_
 \___\__\__,_|_|\___|_|\_\___/\__\__,_|_|   \__|
`

var startupText = fmt.Sprintf("%sCheck us out on GitHub! https://github.com/Luke-zhang-04/quickstart\nWe promise that none of our dependencies, remote repositories/Gists, or shell scripts contain malicious code, but why trust us? Go see for yourself!\nhttps://gist.github.com/Luke-zhang-04/140bea238fa6dec12929c220645540e1\nhttps://gist.github.com/Luke-zhang-04/d4c19d39f0a462fc79e0b3361752cf95\n", Cyan)

func help() {
	fmt.Printf("%sUsage: %sQuickstart %soptions%s\n", Cyan, IBlue, IGreen, Cyan)

	fmt.Printf("%sOptions:%s\n", IBlue, Cyan)
	fmt.Printf("  %sbootstrap bs%s    add bootstrap and configure SCSS file\n", IGreen, Cyan)
	fmt.Printf("  %scodeclimate cc%s  add codeclimate configuration\n", IGreen, Cyan)
	fmt.Printf("  %seslint esl%s      add eslint configuration and ignore file\n", IGreen, Cyan)
	fmt.Printf("  %smakefile make%s   add makefile with compile and lint commands\n", IGreen, Cyan)
	fmt.Printf("  %snoVer nv%s        skip verification and download immediately\n", IGreen, Cyan)
	fmt.Printf("  %sreact%s           initialize React application\n", IGreen, Cyan)
	fmt.Printf("  %sstylelint slint%s add stylelint configuration\n", IGreen, Cyan)
	fmt.Printf("  %stypescript ts%s   add Typescript and configure as needed\n", IGreen, Cyan)
	fmt.Printf("  %s-h --help%s       display help for command\n", IGreen, Cyan)
	fmt.Printf("\n\n%sPass in no options for selection menu\n", Cyan)

	os.Exit(0)
}

func main() {
	// Ask for proceeding
	fmt.Println(quickstartAscii)
	fmt.Println(startupText)

	if array.Contains(os.Args, "-h", "--help") {
		help()
	}

	if len(os.Args) == 1 {
		fmt.Println("No Args")
	} else {
		fmt.Printf("%s Preparing to quickstart with:%s %v%s\n", Cyan, Purple, os.Args[1:], Reset)
	}

	var proceed string

	if array.Contains(os.Args, "noVer", "nv") {
		proceed = "Y"
	} else {
		proceed = readline.Readline(
			fmt.Sprintf("%sProceed? [%sY%s/%sn%s]%s ", Yellow, BIGreen, Yellow, IRed, Yellow, Reset),
		)
	}

	if proceed == "Y\n" {
		fmt.Println("Procceding")
	} else if proceed == "n\n" {
		fmt.Printf("\n%sAborting quickstart . . .\n", BIRed)
		os.Exit(0)
	} else {
		fmt.Printf("\n%sUnknown input %saborting . . .\n", BIRed, proceed)
		os.Exit(1)
	}

}
