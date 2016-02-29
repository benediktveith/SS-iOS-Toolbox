**SS-iOS-Toolbox**
-
`SS-iOS-Toolbox` is an useful collection of tools for iOS projects.

___
**Installation:**
-
* Installation via Cocoapods:
	<pre>platform: ios
	pod 'SS-iOS-Toolbox'</pre>
* Copy all files needed in your project

___
**Tools:**
-
* **SSAlertController:**
	 Presents an AlertController at the current top view controller
	___

* **SSCurrentViewController:**
	Iterates through the presenting ViewController stack, returns the top view controller
	___

* **SSFileHelper:**
	* Get the documents directory
	* Check if files exists in directory
	* Save / Remove files at directory
	* Get file path
	___

* **SSNetworkingMain**
	* Uses AFNetworking
	* Setup Request / Response Serializer
	* Setup API-Token
	* Set and return BaseUrl for Networking
	* Init ReachabilityListener and check network connection
	___

* **SSCoreDataManager:**
	* Manages CoreData
	* Get shared CoreData Manager
	___

* **NSObject+SSExtension:**
	* Perfom blocks on main/background thread
	* Optional: After delay of time in seconds
	___

* **UIView+SSBackgroundThreadDebugger:**
	* Checks if UI changes are called outside the main thread
	* Post error log and stops on breakpoint if true

___
**Technical Requirements:**
-
**-iOS** 7.0 and above.
**-AFNetworking**
___
**License:**
-
`SS-iOS-Toolbox` is licensed under the **MIT** License, please check License file.
___
**Questions / Suggestions ?**
-
Feel free to message me at:

> benedikt.veith@scherer-software.de
