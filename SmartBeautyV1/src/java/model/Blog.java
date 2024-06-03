/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class information of blog
 * @author LENOVO
 */
public class Blog {
    private String blog_name;
    private String description;
    private String content;
    private Employee employee_id;

    public Blog() {
    }
    
    /**
     * constructor of blog
     * 
     * @param blog_name of blog
     * @param description of blog
     * @param content of blog
     * @param employee_id of blog
     */
    public Blog(String blog_name, String description, String content, Employee employee_id) {
        this.blog_name = blog_name;
        this.description = description;
        this.content = content;
        this.employee_id = employee_id;
    }

    public String getBlog_name() {
        return blog_name;
    }

    public void setBlog_name(String blog_name) {
        this.blog_name = blog_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Employee getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(Employee employee_id) {
        this.employee_id = employee_id;
    }
    
    
}
