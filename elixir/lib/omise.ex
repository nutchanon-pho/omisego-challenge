defmodule OMISE do
  def main do
    inputString = ~s({"0":   [{"id": 10,    "title": "House",    "level": 0,    "children": [],    "parent_id": null}], "1":   [{"id": 12,    "title": "Red Roof",    "level": 1,    "children": [],    "parent_id": 10},   {"id": 18,    "title": "Blue Roof",    "level": 1,    "children": [],    "parent_id": 10},   {"id": 13,    "title": "Wall",    "level": 1,    "children": [],    "parent_id": 10}], "2":   [{"id": 17,    "title": "Blue Window",    "level": 2,    "children": [],    "parent_id": 12},   {"id": 16,    "title": "Door",    "level": 2,    "children": [],    "parent_id": 13},   {"id": 15,    "title": "Red Window",    "level": 2,    "children": [],    "parent_id": 12}]})
    jsonObject = Poison.Parser.parse!(inputString)

    recordList = getRecordList(Map.values(jsonObject), [])
    getResultList(recordList, recordList, [])
    IO.inspect Poison.encode!(getResultList(recordList, recordList, []))
  end

  def getRecordList([head | tail], list) do
    getRecordList(tail, head ++ list)
  end

  def getRecordList([], list) do
    list
  end

  def getChildrenWithThisParentId([head | tail], recordList, parent_id, list) do
    if head["parent_id"] == parent_id do
      childrenOfThisNode = getChildrenWithThisParentId(recordList, recordList, head["id"], [])
      head = Map.put(head, "children", head["children"] ++ childrenOfThisNode)
      list = list ++ [head]
    end
    getChildrenWithThisParentId(tail, recordList, parent_id, list)
  end

  def getChildrenWithThisParentId([], recordList, parent_id, list) do
    list
  end

  def getResultList([head | tail], recordList, list) do
    if head["parent_id"] == nil do
      head = Map.put(head, "children", head["children"] ++ getChildrenWithThisParentId(recordList, recordList, head["id"], list))
      list = list ++ [head]
    end
    getResultList(tail, recordList, list)
  end

  def getResultList([], recordList, list) do
    list
  end
end
