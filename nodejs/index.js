let inputString = '{"0":   [{"id": 10,    "title": "House",    "level": 0,    "children": [],    "parent_id": null}], "1":   [{"id": 12,    "title": "Red Roof",    "level": 1,    "children": [],    "parent_id": 10},   {"id": 18,    "title": "Blue Roof",    "level": 1,    "children": [],    "parent_id": 10},   {"id": 13,    "title": "Wall",    "level": 1,    "children": [],    "parent_id": 10}], "2":   [{"id": 17,    "title": "Blue Window",    "level": 2,    "children": [],    "parent_id": 12},   {"id": 16,    "title": "Door",    "level": 2,    "children": [],    "parent_id": 13},   {"id": 15,    "title": "Red Window",    "level": 2,    "children": [],    "parent_id": 12}]}';

if(process.argv[2]){
    inputString = process.argv[2];
}

let jsonObject = JSON.parse(inputString);

let objectMapById = {};

// Flatten it with map
for (let key in jsonObject) {
    let recordList = jsonObject[String(key)];
    for (let eachRecord of recordList) {
        objectMapById[String(eachRecord.id)] = eachRecord;
    }
}

// Create relationship
let outputList = [];
for (let key in objectMapById) {
    let record = objectMapById[String(key)];
    if (record.parent_id) {
        let parentRecord = objectMapById[String(record.parent_id)];

        if (parentRecord) {
            if (!parentRecord.children) {
                parentRecord.children = [];
            }

            parentRecord.children.push(record);
        }
    } else {
        outputList.push(record);
    }
}

console.log();
console.log();
console.log('Output Result:');
console.log(JSON.stringify(outputList));