//SPDX-License-Identifier: MIT

pragma solidity ^0.8.8; //0.8.18 is current version

//pragma solidity >=0.8.7     mean:we want to use solidity version greater than or equal to 0.8.7 version solidity
//pragma solidity ^0.8.7     mean:we want to use solidity version greater than or equal to 0.8.7 version solidity

//pragma solidity <=0.8.7     mean:we want to use solidity version less than or equal to 0.8.7 version solidity
//pragma solidity >=0.8.7 <=0.8.12     mean:we want to use solidity version in the range of to 0.8.7 to 0.8.12 version solidity
 
 contract SimpleStorage{
    //boolean, uint, int, address, bytes
    //bool hasFavoriteNumber = true;
    //uint256 favoriteNumber = 5;
    // string favoriteNumberInText = "five";
    // int256 favoriteInt = -5;
    // bytes32 favoriteBytes = "cat";
    uint256 public favoriteNumber;//this section gets initialized to zero  //THIS IS A storage VARIABLE
    //People public person = People({favoriteNumber: 2, name: "patrick"});

    mapping (string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    //uint256 [3] public favoriteNumbersList;
    People[] public people;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //view, pure
    function retrieve() public  view returns(uint256){
        return favoriteNumber;
    }

    //calldata: we can use Calldata instead of memory but we can't change the name again
    // memory: only exist temporally,
    // storage: exist even outside the current function,
    // stack, Code, Logs
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //People memory newPerson = People(_favoriteNumber,_name);
        //people.push(newPerson);
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // function add() public pure  returns (uint256){
    //     return(1+1);
    // }
 }
 //0xa131AD247055FD2e2aA8b156A11bdEc81b9eAD95      it is the address of the above SimpleStorage contract