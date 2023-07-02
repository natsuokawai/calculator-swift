import Foundation

enum Token {
    case num(Int)
    case op(String)
    case eof
}

struct Lexer {
    let string: String

    init(string input: String) {
        string = input
    }

    func tokenize() -> [Token] {
        var tokens: [Token] = []

        let s = Scanner(string: string)
        if let value = s.scanInt() {
            tokens.append(Token.num(value))
        } else {
            print("Error: Please enter a number.")
        }

        while (!s.isAtEnd) {
            if let op = s.scanCharacters(from: CharacterSet(charactersIn: "+-")) {
                tokens.append(Token.op(op))
            } else {
                print("Error: Expected an operator.")
                break
            }

            if let value = s.scanInt() {
                tokens.append(Token.num(value))
            } else {
                print("Error: Please enter a number.")
                break
            }
        }

        if s.isAtEnd { tokens.append(Token.eof) }

        return tokens
    }
}

func repl() {
    while true {
        print("> ", terminator: "")
        if let line = readLine() {
            let l = Lexer(string: line)
            print(l.tokenize())
        }
    }
}

repl()
