This is a build of [SQLCipher][SQLCIPHER] -- a variant of SQLite with encryption support added -- for use with [Couchbase Lite][CBL]. Binaries are provided for Mac OS and iOS; the latter one is 'fat' so it supports both the simulator and real devices.

To enable database encryption in Couchbase Lite, do the following:

1. Add the appropriate libsqlcipher library from this folder to your Xcode project.
2. In your application target's Build Phases tab, open 'Link Binary With Libraries' and:
	1. Remove libsqlite.dylib (if present.)
	2. Press the "+" button and add the libsqlcipher library that you added to the project in step 1.
3. Encryption is _not_ automatic. Modify your source code to call `-[CBLManager registerEncryptionKey:forDatabaseNamed:]` before opening or creating any database that should be encrypted. See this method's API documentation in CBLManager.h for more details.  
   Alternatively, you can use the utility class CBLEncryptionController, which includes the UI support for prompting the user for passwords, and for using Touch ID authentication on compatible devices. You'll find it in the 'Extras' folder of the Couchbase Lite distribution. Just add the .m and .h files to your target.

[SQLCIPHER]: http://sqlcipher.net
[CBL]: https://github.com/couchbase/couchbase-lite-ios
