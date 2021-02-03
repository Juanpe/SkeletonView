import Danger

let danger = Danger()
let github = danger.github

 // Make it more obvious that a PR is a work in progress and shouldn't be merged yet
if danger.github.pullRequest.title.contains("WIP") {
    warn("PR is classed as Work in Progress")
}

// Warn, asking to update all README files if only English README are updated
let enReameModified = danger.git.modifiedFiles.contains { $0.contains("README.md") }
let zhReameModified = danger.git.modifiedFiles.contains { $0.contains("README_zh.md") }
let koReameModified = danger.git.modifiedFiles.contains { $0.contains("README_ko.md") }
let ptBrReameModified = danger.git.modifiedFiles.contains { $0.contains("README_pt-br.md") }
let otherLanguagesReadmeHaveBeenModified = zhReameModified && koReameModified && ptBrReameModified

if (enReameModified && !otherLanguagesReadmeHaveBeenModified) {
    warn("Consider **also** updating the README for other languages.")
}

// Warn when there is a big PR
if (danger.github.pullRequest.additions ?? 0) > 500 {
    warn("Big PR, try to keep changes smaller if you can")
}

// Added (or removed) library files need to be added (or removed) from the
// Xcode project to avoid breaking things.
let addedSwiftLibraryFiles = danger.git.createdFiles.contains { $0.fileType == .swift && $0.hasPrefix("Sources") }
let deletedSwiftLibraryFiles = danger.git.deletedFiles.contains { $0.fileType == .swift && $0.hasPrefix("Sources") }
let modifiedXcodeProject = danger.git.modifiedFiles.contains { $0.contains(".xcodeproj") }
if (addedSwiftLibraryFiles || deletedSwiftLibraryFiles) && !modifiedXcodeProject {
    fail("Added or removed files require the Xcode project to be updated.")
}
