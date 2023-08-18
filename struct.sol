// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;

contract StructSample {
    struct StudentInfo {
        string name;
        uint age;
        string favouriteFood;
    }

    mapping(address => StudentInfo) public studentInfo;

    //1. The procedural way
    function Update(
        address _studAddress,
        string memory _name,
        uint _age,
        string memory _favouriteFood
    ) public {
        StudentInfo storage _student = studentInfo[_studAddress];
        _student.name = _name;
        _student.age = _age;
        _student.favouriteFood = _favouriteFood;
    }

    //2. Readable way
    function Update2(
        address _studAddress,
        string memory _name,
        uint _age,
        string memory _favouriteFood
    ) public {
        studentInfo[_studAddress] = StudentInfo(_name, _age, _favouriteFood);
    }

    //3. Shorter way
    function Update3(
        address _studAddress,
        string memory _name,
        uint _age,
        string memory _favouriteFood
    ) public {
        studentInfo[_studAddress] = StudentInfo({
            name: _name,
            age: _age,
            favouriteFood: _favouriteFood
        });
    }

    //4. A simpler way ===> my favourite!!!!
    function setDetails(
        address _studAddress,
        string memory _name,
        uint _age,
        string memory _favouriteFood
    ) public {
        studentInfo[_studAddress].name = _name;
        studentInfo[_studAddress].age = _age;
        studentInfo[_studAddress].favouriteFood = _favouriteFood;
    }
}
