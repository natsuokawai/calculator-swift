import Foundation

func repl() {
    while true {
        print("> ", terminator: "")
        let line = readLine()!
        let s = Scanner(string: line)
        if let value = s.scanInt() {
            print(value)
        } else {
            print("Error: Please enter a number.")
        }
    }
}

repl()
