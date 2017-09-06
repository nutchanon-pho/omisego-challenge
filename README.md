The challenge is implemented using two programming languages which are Node.js and Elixir.

## Node.js
Node.js implementation is done using object reference and data structure to optimize the algorithm. The steps of actions done by this implementation are as follows:

 * Convert the key-value map given by the input in to another key-value map with record's id as the key of each value called `objectMapById`
 * Loop through each key-value pair of the newly created map
 * Each iteration will check if the current record has `parent_id`. It that is true, the parent record will be retrieved from `objectMapById` using `parent_id` as the key. If that is not true, then the current record is the leaf node or the outer most level parent it self, it will be immediately push in to the result list.

Time taken: 3 hours

### Run Instructions
#### Prerequisites
[Node.js](https://nodejs.org/en/)

#### Commands

```
node index.js '<INPUT-JSON-STRING>'
```
For example, the command to run the program using the input from the challenge is:
```
node index.js '{"0":[{"id":10,"title":"House","level":0,"children":[],"parent_id":null}],"1":[{"id":12,"title":"Red Roof","level":1,"children":[],"parent_id":10},{"id":18,"title":"Blue Roof","level":1,"children":[],"parent_id":10},{"id":13,"title":"Wall","level":1,"children":[],"parent_id":10}],"2":[{"id":17,"title":"Blue Window","level":2,"children":[],"parent_id":12},{"id":16,"title":"Door","level":2,"children":[],"parent_id":13},{"id":15,"title":"Red Window","level":2,"children":[],"parent_id":12}]}'
```
Note #1: However, by simply type `node index.js`, the program will also use the default input from the challenge without typing any input. 

Note #2: Additionally, please be careful with the use of quotes for the input string of the command, because your string might not have escaped the quotes inside the JSON string.


## Elixir
Elixir implementation is done following the functional programming style of the programming language itself. Unlike the Node.js implementation, object referencing cannot be used to achieve the desired input. Therefore, the algorithm needed to change into:

 * Convert the key-value map given by the input in to a list of every records called `recordList` using a recursive function
 * Call a recursive function `getResultList` which will produce the final output list
 * `getChildrenList` is a recursive function that is called in every iterations inside `getResultList`. Its job is to retrieve the records with the specified `parent_id` recursively. By recursively, this means all of the children and grand children will also be retrieved.

Time taken: 9 hours

### Run Instructions
#### Prerequisites
[Elixir](https://elixir-lang.org/)

Navigate into the `/elixir` directory and type the command
```
mix deps.get
```
to install the dependencies.

#### Commands

```
mix run -e OMISE.main
```
You will be prompted with `Input String:` where you need to type or paste the input JSON string and press enter. For example:
```
mix run -e OMISE.main
Input String:{"0":[{"id":10,"title":"House","level":0,"children":[],"parent_id":null}],"1":[{"id":12,"title":"Red Roof","level":1,"children":[],"parent_id":10},{"id":18,"title":"Blue Roof","level":1,"children":[],"parent_id":10},{"id":13,"title":"Wall","level":1,"children":[],"parent_id":10}],"2":[{"id":17,"title":"Blue Window","level":2,"children":[],"parent_id":12},{"id":16,"title":"Door","level":2,"children":[],"parent_id":13},{"id":15,"title":"Red Window","level":2,"children":[],"parent_id":12}]}
```
Note #1: However, by simply hit enter when prompted for input string, the program will use the default input from the challenge.

Note #2: Please leave out the leading and trailing quotes. See the example on how the input should be formatted.
