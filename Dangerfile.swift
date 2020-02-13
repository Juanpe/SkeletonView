import Danger

extension Git {
    var linesOfCode: Int {
        createdFiles.count + modifiedFiles.count - deletedFiles.count
    }
}

let danger = Danger()
//let pullRequest = danger.github.pullRequest

SwiftLint.lint(.modifiedAndCreatedFiles(directory: "Sources"), inline: true)

// Warnings

// Warn when there is a big PR
if danger.git.linesOfCode > 1 {
    markdown(" * [##{pr_number}](#{pr_url}): #{github.pr_title} - [@#{github.pr_author}](https://github.com/#{github.pr_author})")
    warn("Big PR, try to keep changes smaller if you can")
}

// Pull out the edited files and find ones that come from a sub-folder
// where our app lives
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
let editedAppFiles = editedFiles.filter { $0.contains("/Sources") }

// Request for a CHANGELOG entry with each app change
if editedAppFiles.count > 0 {
    fail("Please add a CHANGELOG entry for these changes.")
    markdown("")
}
