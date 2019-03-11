package team.ustc.sse.blockly.mapper;


import team.ustc.sse.blockly.entity.Student;

public interface StudentMapper {

    Student getStudentByID(Integer studentID);

    Student getStudentByName(String studentName);

    void insertStudent(Student student);
}
