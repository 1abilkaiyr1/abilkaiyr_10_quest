package models;

import com.avaje.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "students")
public class Student extends Model  {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long id;
    public String name;
    public String surname;
    public String birthday;
    public String faculty;
    public String profession;


    public Student(long id, String name, String surname, String birthday, String faculty, String profession) {

        this.id = id;
        this.name = name;
        this.surname = surname;
        this.birthday = birthday;
        this.faculty = faculty;
        this.profession = profession;

    }





}
