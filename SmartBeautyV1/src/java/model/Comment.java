/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author td532
 */
public class Comment {
        private int comment_id;
	private int blog_id;
	private int customer_id;
        private String customer_name;
        private String customer_image;
	private String content;
	private Date created_at;

    public Comment(int comment_id, int blog_id, int customer_id, String customer_name, String customer_image, String content, Date created_at) {
        this.comment_id = comment_id;
        this.blog_id = blog_id;
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.customer_image = customer_image;
        this.content = content;
        this.created_at = created_at;
    }

    public Comment(int blog_id, int customer_id, String content) {
        this.blog_id = blog_id;
        this.customer_id = customer_id;
        this.content = content;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_image() {
        return customer_image;
    }

    public void setCustomer_image(String customer_image) {
        this.customer_image = customer_image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
        
}
