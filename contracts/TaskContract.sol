pragma solidity >=0.8.4;

contract TaskContract
{

    uint taskCounter = 0;

    constructor()
    {
        createTask("1er tarea","tengo que hacer algo");
    }

    struct Task{
        uint id;
        string title;
        string description;
        bool done;
        uint createdAt;
    }

    event TaskCreated(
        uint id,
        string title, 
        string description, 
        bool done,
        uint createdAt
    );

    event TaskCambiaDone(
        uint id,
        bool done
    );

    mapping (uint => Task) public tasks; 

    function createTask(string memory _title, string memory _description) public
    {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp);
        //emit se utiliza para almacenar logs utilizando eventos
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp);
        
    }

    function changeDone(uint _id) public 
    {
        //copio la tarea completa y luego cambio el valor de done
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskCambiaDone(_id, _task.done);

    }

}
