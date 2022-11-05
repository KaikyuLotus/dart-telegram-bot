## 1.0.0-b1

- Updated to bot API 6.3

## 1.0.0

- Stable release

## 0.7.0-b4

- Updated to bot API 6.2

## 0.7.0-b3

- Updated to bot API 6.1
- Added missing documentation
- Minor fixes

## 0.7.0-b2

- Added Error(s) catch clause
- Switched from EffectiveDart to Lints
- Minor fixes

## 0.7.0-b1

- Updated to bot API 5.6
- Added a few missing objects
- Minor fixes

## 0.6.1

- Support multiline commands

## 0.6.0

- Updated to bot API 5.3

## 0.5.4-b2

- Fix editMessageText caption parameters

## 0.5.4-b1

- Add missing InlineQueryResult objects, some are still not completed
- Add entities argument in methods like sendMessage
- Minor fix in sendVideoNote

## 0.5.3+2

- Updated README.md
- Minor fixes

## 0.5.3+1

- Add missing types in Telegram response entity map

## 0.5.3

- Fix uppercase enums

## 0.5.2

- New stable release!
- Now using effective_dart, fixed all issues
- Improved enums (breaks compatibility with previous enums names)
- Improved pending updates cleanup
- Add allowed updates shortcuts

## 0.5.1-beta.1

- Major changes to Bot structure
- Major improvements to Bot
- Added some docs
- Updated examples

## 0.5.0-beta.1+2

- Hotfix for User in newChatMembers in Message being nullable

## 0.5.0-beta.1+1

- Hotfix for variable name case

## 0.5.0-beta.1

- Breaking change update
- Add allowedUpdates to getUpdates
- Major changes to Bot class, it should not be extended not
- Improvements to bot class
- Minor other improvements

## 0.4.1

- Implemented Bot API 5.1 changes
- Add some more missing impls

## 0.4.0-beta.5

- Implemented more API methods
- Add serialization methods to all entities
- Add some more entities

## 0.4.0-beta.4

- Minor fixes with code formatting

## 0.4.0-beta.3

- Minor fixes with code formatting
- Fix changelog formatting
- Improved example
- Removed dependency on dart:io, now this lib is compatible with JavaScript platform

## 0.4.0-beta.2

- Minor fixes with code formatting
- Renamed an example to main.dart
- Fix changelog formatting

## 0.4.0-beta.1

- Migrate to Dart sound null safe
- Minor bug fixes and improvements

## 0.3.1

- Fix wrong import

## 0.3.0

- Improved package structure
- Changed part with export
- General refactoring
- Minor changes to enums
- Added logging

## 0.2.0

- Improved package structure
- Added part and part of in Telegram entities
- General refactoring

## 0.1.8-b2

- Minor code quality fixes 

## 0.1.8-b1

Fixed version string
This is a beta release
- Bot events and commands now are executed in real async
- Minor fixes to input media

## 0.1.7-b1

This is a beta release
- Bot events and commands now are executed in real async
- Minor fixes to input media

## 0.1.7

- Minor fixes to InputMedia classes

## 0.1.6

- Added setMyCommands
- Added getMyCommands

## 0.1.5+1

- Fixed minor issue

## 0.1.5

- Added bot command utilities
- Improved bot command handling

## 0.1.4+6

- Fixed wrong type in APIException

## 0.1.4+5

- Added some more logs on APIException

## 0.1.4+4

- Added some more logs on APIException

## 0.1.4+3

- Fixed issue in api client for chat member list mapping

## 0.1.4+2

- Fixed an issues with command and updates

## 0.1.4+1

- Fixed an issues with command and updates

## 0.1.4

- Fixed onUpdate getting executed when a command was executed first
- Improved command callback error checking

## 0.1.3

- Critical bug fixes on update

## 0.1.2

- added editMessageText

## 0.1.1

- Fixed tests
- Implemented some inline stuff

## 0.1.0

- Added functions to download files
- Fixed File size from String to int
- Added small test

## 0.0.9+3

- Bug fix for event loop

## 0.0.9+2

- Added the possibility to chose if the http client should be only closed or restarted

## 0.0.9+1

- Small improvement for previous version

## 0.0.9

- Improved bot loop, now it's not blocking and it's a correct Future

## 0.0.8

- Fixed event loop, now it's not using sleep anymore

## 0.0.7

- Minor fixes on start() function

## 0.0.6

- Improvements to Telegram API Client

## 0.0.5

- Improvements to ChatMember object

## 0.0.4

- Implemented ChatAction.fromString

## 0.0.3

- Minor improvements to stability

## 0.0.2

- Fixed http package version

## 0.0.1

- Initial version: setting up skeleton
