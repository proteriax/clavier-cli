import Carbon
import Darwin
import Foundation

func error(_ message: String) {
  fputs("\(message)\n", stderr)
}

func main(args: [String]) {
  let candidates = TISCreateInputSourceList(nil, false).takeRetainedValue() as! [TISInputSource]
  let sources = candidates.filter({ $0.isValidCandidate })
  let names = sources.map({ $0.name })
    
  guard let lang = args.last else {
    error("No input method provided.")
    exit(1)
  }

  if let index = names.firstIndex(of: lang) {
    TISSelectInputSource(sources[index])
  } else {
    error("Cannot find an input valid method matching '\(lang)'.")
    error("Valid input methods:")
    for (index, name) in names.enumerated() {
      error("  \(index + 1): \(name)")
    }
    exit(1)
  }
}

main(args: CommandLine.arguments)
