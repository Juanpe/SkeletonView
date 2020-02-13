# ------------------------------------------------------------------------------
# Additional pull request data
# ------------------------------------------------------------------------------
pr_number = github.pr_json['number']
pr_url = github.pr_json['_links']['html']['href']

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? '#trivial'

has_changelog_changes = git.modified_files.include?('CHANGELOG.md')
has_library_changes = !git.modified_files.grep(%r{Sources/*/*.swift}).empty?
has_danger_changes = !git.modified_files.grep(%r{Dangerfile|script/oss-check}).empty?
modified_xcode_project = !git.modified_files.grep(/.*\.xcodeproj/).empty?
added_swift_library_files = !git.added_files.grep(/Sources.*\.swift/).empty?
deleted_swift_library_files = !git.deleted_files.grep(/Sources.*\.swift/).empty?

## Warnings

# Warn when there is a big PR
warn('Big PR') if git.lines_of_code > 500
 
# Warn when Danger changes
warn('Dangerfile changes') if has_danger_changes

# NOTE WHEN A PR CANNOT BE MANUALLY MERGED, WHICH GOES AWAY WHEN YOU CAN
can_merge = github.pr_json['mergeable']
warn('This PR cannot be merged yet.', sticky: false) unless can_merge

requires_proj_update = added_swift_library_files || deleted_swift_library_files
failure 'Added or removed library files require the Xcode project to be updated.' if requires_proj_update && !modified_xcode_project

# ------------------------------------------------------------------------------
# Have you updated CHANGELOG.md?
# ------------------------------------------------------------------------------
# if !has_changelog_changes && has_library_changes
#   markdown <<-MARKDOWN
#   Here's an example of a CHANGELOG.md entry (place it immediately under the `* Your contribution here!` line):
#   ```markdown
#   * [##{pr_number}](#{pr_url}): #{github.pr_title} - [@#{github.pr_author}](https://github.com/#{github.pr_author})
#   ```
#   MARKDOWN
#   warn('Please update CHANGELOG.md with a description of your changes. '\
#        'If this PR is not a user-facing change (e.g. just refactoring), '\
#        'you can disregard this.', sticky: false)
# end

## Messages

## Failures

# Mainly to encourage writing up some reasoning about the PR, rather than
# just leaving a title
failure 'Please provide a summary in the Pull Request description' if github.pr_body.length < 5

# ONLY ACCEPT PRS TO THE DEVELOP BRANCH
failure 'Please re-submit this PR to develop, we may have already fixed your issue.' if github.branch_for_base != 'develop'

# Ensure a clean commits history
failure 'Please rebase to get rid of the merge commits in this PR' if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }

## Adds labels

# Check if PR is mergeable
merge_conflict_label = 'merge conflicts'

if github.pr_json['mergeable']
  auto_label.remove(merge_conflict_label)
else
  auto_label.set(github.pr_json['number'], merge_conflict_label, 'f73878')
end


