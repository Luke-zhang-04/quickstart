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
	igreen  = quickstart.Colours["IGreen"]
	cyan    = quickstart.Colours["Cyan"]
	iblue   = quickstart.Colours["IBlue"]
	reset   = quickstart.Colours["Reset"]
	purple  = quickstart.Colours["purple"]
	yellow  = quickstart.Colours["yellow"]
	ired    = quickstart.Colours["IRed"]
	bigreen = quickstart.Colours["BIGreen"]
	bired   = quickstart.Colours["BIRed"]
)

var quickstartASCII = cyan + `
  ____        _      _        _             _
 / __ \      (_)    | |      | |           | |
| |  | |_   _ _  ___| | _____| |_ __ _ _ __| |_
| |  | | | | | |/ __| |/ / __| __/ _\ | __| __|
| |__| | |_| | | (__|   <\__ \ || (_| | |  | |_
 \___\__\__,_|_|\___|_|\_\___/\__\__,_|_|   \__|
`

var startupText = fmt.Sprintf("%sCheck us out on GitHub! https://github.com/Luke-zhang-04/quickstart\nWe promise that none of our dependencies, remote repositories/Gists, or shell scripts contain malicious code, but why trust us? Go see for yourself!\nhttps://gist.github.com/Luke-zhang-04/140bea238fa6dec12929c220645540e1\nhttps://gist.github.com/Luke-zhang-04/d4c19d39f0a462fc79e0b3361752cf95\n", cyan)

func help() {
	fmt.Printf("%sUsage: %sQuickstart %soptions%s\n", cyan, iblue, igreen, cyan)

	fmt.Printf("%sOptions:%s\n", iblue, cyan)
	fmt.Printf("  %sbootstrap bs%s    add bootstrap and configure SCSS file\n", igreen, cyan)
	fmt.Printf("  %scodeclimate cc%s  add codeclimate configuration\n", igreen, cyan)
	fmt.Printf("  %seslint esl%s      add eslint configuration and ignore file\n", igreen, cyan)
	fmt.Printf("  %smakefile make%s   add makefile with compile and lint commands\n", igreen, cyan)
	fmt.Printf("  %snoVer nv%s        skip verification and download immediately\n", igreen, cyan)
	fmt.Printf("  %sreact%s           initialize React application\n", igreen, cyan)
	fmt.Printf("  %sstylelint slint%s add stylelint configuration\n", igreen, cyan)
	fmt.Printf("  %stypescript ts%s   add Typescript and configure as needed\n", igreen, cyan)
	fmt.Printf("  %s-h --help%s       display help for command\n", igreen, cyan)
	fmt.Printf("\n\n%sPass in no options for selection menu\n", cyan)

	os.Exit(0)
}

func main() {
	// Ask for proceeding
	fmt.Println(quickstartASCII)
	fmt.Println(startupText)

	if array.Contains(os.Args, "-h", "--help") {
		help()
	}

	if len(os.Args) == 1 {
		fmt.Println("No Args")
	} else {
		fmt.Printf("%s Preparing to quickstart with:%s %v%s\n", cyan, purple, os.Args[1:], reset)
	}

	var proceed string

	if array.Contains(os.Args, "noVer", "nv") {
		proceed = "Y"
	} else {
		proceed = readline.Readline(
			fmt.Sprintf("%sProceed? [%sY%s/%sn%s]%s ", yellow, bigreen, yellow, ired, yellow, reset),
		)
	}

	if proceed == "Y\n" {
		fmt.Println("Procceding")
	} else if proceed == "n\n" {
		fmt.Printf("\n%sAborting quickstart . . .\n", bired)
		os.Exit(0)
	} else {
		fmt.Printf("\n%sUnknown input %saborting . . .\n", bired, proceed)
		os.Exit(1)
	}

}
