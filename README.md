# JellyTextCompanion
Last updated: Sat Jun 22 18:37:58 CDT 2024

This is a glorified note-to-self.

## Goal
 
Follow along 
[Meet Runestone](https://docs.runestone.app/tutorials/meet-runestone) series of tutorials to the "Syntax Highlighting the Text" section, and then use language "jelly" instead of "javaScript"

### code

Specifically want to replace 
<code>
import TreeSitterJavaScriptRunestone
  ...
        let languageMode = TreeSitterLanguageMode(language: .javaScript)
        textView.setLanguageMode(languageMode)
</code>
with
<code>
import TreeSitterJellyRunestone
  ...
        let languageMode = TreeSitterLanguageMode(language: jelly)
        textView.setLanguageMode(languageMode)
</code>

## Status

Seems to work on Hello.jelly text in iPhone 15 simulator, no further testing done.

## Backgroud

I am having trouble building the version current version of my fork of Open-Jellycuts due to what appear to be Package issues.  

In the past, it appears there were some issues with runestone direct use of tree-sitter/tree-sitter, causing a simonbs/tree-sitter to be created

<code>
// Tree-sitter supports SPM but as of writing this, the official Tree-sitter repository has no versions published that contains the Package.swift file. Therefore, we depend on a fork of Tree-sitter that has a version published.
// We will pin against the official version of Tree-sitter as soon as a new version is published.
        .package(url: "https://github.com/simonbs/tree-sitter", from: "0.20.9-beta-1")
</code>
  
\
I want to test if that is still the case since Runestone/Package.swift was updated Feb 28, 2024

<code>
    dependencies: [
        .package(url: "https://github.com/tree-sitter/tree-sitter", .upToNextMinor(from: "0.20.9"))
    ],
</code>

## Packages

### Runestone

simonbs/Runestone 0.5.1

### tree-sitter

tree-sitter/tree-sitter 0.20.9

### Open-Jellycore

Package.swift  

change simonbs/tree-sitter to tree-sitter/tree-sitter matching dependency change in Runestone
change tree-sitter-jelly on local branch of fork chrysaora-achlyos/tree-sitter-jelly

from:
<code>
        .package(url: "https://github.com/simonbs/tree-sitter", from: "0.20.9-beta-2"),
        .package(url: "https://github.com/Jellycuts/tree-sitter-jelly", from: "0.1.0"),
</code>

to:
<code>
        .package(url: "https://github.com/tree-sitter/tree-sitter", .upToNextMinor(from: "0.20.9")),
        .package( url: "https://github.com/chrysaora-achlyos/tree-sitter-jelly", branch: "lab000"),
</code>

### tree-sitter-jelly

no changes

### TreeSitterJellyRunestone

This was pulled out of Package directory of Open-Jellycuts and made a github.com addressable package

