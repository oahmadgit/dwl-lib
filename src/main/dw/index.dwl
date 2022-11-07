/**
*   Dataweave Useful util function
*   ------------------------------
*
*   Author: Osama Ahmad
*   E-mail: m.osamaahmad786@gmail.com
*
*/
%dw 2.0
import * from util

fun helloWorld() = { hello: "world" } // default test function


/**
* Get the exact Json Path value for the given key-value node
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `obj` | Any | payload
* | `node` | Any | node 'key'
* | `nodeValue` | Any | node 'value'
* |===
*
* === Example
*
* This example shows how the `getJsonPath` function behaves under different inputs.
* %dw 2.0
* output application/json
* ---
* getJsonPath(payload,"valueString","richtext")
*/
fun getJsonPath(obj,node,nodeValue) = flatten(jsonPathCalculator(obj,"payload",node,nodeValue)..valuePath)
