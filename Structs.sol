// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract ToDoList{
    //declaring a struct which groups two data types
    struct ToDoItem{
        string text;
        bool completed;
    }
    //now after declaring a struct create an array of ToDoItem structs
    ToDoItem[] public  toDos;
    function createToDo(string memory _text) public {
        //there are multiple ways to to initialize structs
        //Method 1-Call it like a function
        toDos.push(ToDoItem(_text, false));
        // method 2- it is same as the above one but here we set its keys basically bada 
        toDos.push();(ToDoItem({text: _text,completed:false}));
        //method-3 Initialize an empty struct , then set individual properties
        ToDoItem memory toDo;
        toDo.text=_text;
        toDo.completed=true;
        toDos.push(toDo);
        //as you already seen the best method is to use the first one

    }
    //update a struct value
    function update(uint _index, string memory _text)public {
        toDos[_index].text=_text;
    }
    //update completed
    function toggleCompleted(uint _index) public {
        toDos[_index].completed=!toDos[_index].completed;
    }










}