import Danger

extension Git {
    var linesOfCode: Int {
        createdFiles.count + modifiedFiles.count - deletedFiles.count
    }
}

let danger = Danger()

SwiftLint.lint(.modifiedAndCreatedFiles(directory: "Sources"), inline: true)

// Warnings

// Warn when there is a big PR
if danger.git.linesOfCode > 1 {
    warn("Big PR, try to keep changes smaller if you can")
}
