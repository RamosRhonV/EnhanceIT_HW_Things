import UIKit

// Week 4 Exam Question Responses

// (1) Explain what is a Protocol and why do we use them.
/* (A) A Protocol acts as a "blueprint" for certain tasks
 *     or requirements. It can be adopted by classes, structs,
 *     and enums.
 */

// (2) What is a REST-api?
/* (A) REST is an acronym that stands for REpresentational State Transfer.
 *     REST-api is an application programming interface that conforms to the
 *     design principles of REST. The API follows the principles of: uniform interface,
 *     user-server decoupling, statelessness, cacheability, layered system architecture,
 *     and (sometimes) code-on-demand.
 */

// (3) How can we retrieve data from a REST-api?
/* (A) We can retrieve REST-api data through HTTP requests. The retrieval action is
 *     performed by a GET request.
 */

// (4) What are the different ways to handle multithreading in iOS?
/* (A) Multithreading can be handled through two ways: Grand Central Dispatch and NSOperation.
 *
 */

// (5) What is Core Data?
/* (A) Core Data is cacheing data on a single device or synchronizing data on
 *     multipling devices with CloudKit. This allows data persistence even when
 *     an application is closed.
 */

// (6) What are other ways that we have used Data Persistency?
/* (A) We have used the Codable Protocol to store data from JSON.
 */

// (7) How do we make CoreData thread-safe?
/* (A) To make CoreData thread-safe, avoid processing the data in the main queue on
 *     anything user-related.
 */

// (8) How would you go about creating your own data structure if optionals
//     did not exist in Swift?
/* (A) We would use try-catch blocks to catch nil values.
 */

// (9) What is a retain cycle? How do we avoid them?
/* (A) A retain cycle is a memory leak caused by two strong variables that
 *     address each other. We can avoid these cycles by removing the "choice"
 *     between a struct or class, using Protocols, and using closers with
 *     [unowned self].
 */

// (10) How are dispatch groups implemented?
/* (A) Dispatch groups are implemented between enter() and leave() function calls.
 */

// (11) What is Autolayout?
/* (A) Autolayout is dynamic calculator that automatically calculates the size and position
 *     of all views in the view hierarchy based on user-defined constraints on those views.
 */

// (12) What is a closure? What are the difference between escaping and non-escaping closures?
/* (A) A closure is an anonymous function. It has no name but can be passed around anywhere
 *     in the code. An escaping closure is a closure that is passed into a function's
 *     arguments but is called after the function returns. Meanwhile, a non-escaping
 *     closure is called prior to the function return.
 */

// (13) What are lazy properties and how do they work?
/* (A) The lazy property makes a variable only initialize when it is requested,
 *     which ultimately saves processing power.
 */

// (14) What are property observers?
/* (A) Property observers are blocks of code that execute whenever they "observe"
 *     that a property has been changed. Two property observers are named didSet and
 *     willSet.
 */

// (15) What is the application and controller lifecycle?
/* (A)
 *
 */

// (16) How do we store sensitive user data?
/* (A) We can store sensitive user data using Keychain Services API. This API
 *     provides encryption and storage functions for said sensitive data.
 */

// (17) What is a Guard statement?
/* (A) The guard keyword is a keyword that enables early return statements and allows
 *     optionals to remain in scope if unwrapped by the keyword.
 */

// (18) What is "Serial Queue?"
/* (A) A serial Dispatch Queue is a queue that performs only one task at a time to
 *     prevent data races. Serial Queues are often used to access a specific value
 *     or resource.
 */

// (19) What is the difference between "strong," "weak," and "unowned?" When
//      do we use them?
/* (A) These keywords are usually used when talking about references. A "strong" reference
 *     increments the reference count by one. A "weak" reference does not increment the
 *     reference count and can reference nil. An "unowned" reference does not increment
 *     the reference count but does not reference nil when accessed. We use these
 *     keywords to circumvent the problem of retain cycles mentioned above.
 *
 */

// (20) How do we create singletons in Swift?
/* (A) Singletons can be created by defining global variables and giving the static property
 *     to a variable.
 */
