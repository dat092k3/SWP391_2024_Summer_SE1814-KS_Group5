/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import org.junit.After;
import static org.junit.Assert.*;
import DAO.BlogDAO;
import java.sql.Statement;
import java.io.IOException;
import org.junit.Before;
import org.junit.Test;
import Interface.BlogInterface;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Blog;
import context.DBContext;

/**
 *
 * @author td532
 */
public class BlogDaoTest extends DBContext {

    private BlogInterface blogDao = new BlogDAO();

    @Before
    public void setUp() throws SQLException {
        // Thiết lập dữ liệu ban đầu cho các test cases
        try (Statement stmt = connection.createStatement()) {
            // Xóa dữ liệu cũ nếu có
            stmt.execute("DELETE FROM Blog");

            // Thiết lập dữ liệu mẫu nếu cần
            String insertSQL = "INSERT INTO Blog (blog_name, image, description, content, employee_id) VALUES "
                    + "('Sample Blog', 'sample.jpg', 'Sample description', 'Sample content', 5)";
            stmt.execute(insertSQL);
        }
    }

    @After
    public void tearDown() throws SQLException, IOException {
        // Đóng kết nối sau khi test xong
        connection.close();
    }

    @Test
    public void testSearchBlogByName() {
        List<Blog> result = blogDao.searchBlogByName("Sample");
        assertNotNull(result);
        assertEquals(1, result.size());
        Blog blog = result.get(0);
        assertEquals("Sample Blog", blog.getBlog_name());
        assertEquals("sample.jpg", blog.getImage());
        assertEquals("Sample description", blog.getDescription());
        assertEquals("Sample content", blog.getContent());
        assertEquals(5, blog.getEmployee_id());
    }

    @Test
    public void testGetAllBlog() {
        int blogId = blogDao.getAllBlog().get(0).getBlog_id();
        List<Blog> result = blogDao.getAllBlog();
        assertNotNull(result);
        assertEquals(1, result.size());
        Blog blog = result.get(0);
        assertEquals("Sample Blog", blog.getBlog_name());
        assertEquals("sample.jpg", blog.getImage());
        assertEquals("Sample description", blog.getDescription());
        assertEquals("Sample content", blog.getContent());
        assertEquals(5, blog.getEmployee_id());
    }

    @Test
    public void testTakeBlogById() {
        int blogId = blogDao.getAllBlog().get(0).getBlog_id();
        Blog blog = blogDao.takeBlogById(blogId);
        assertNotNull(blog);
        assertEquals("Sample Blog", blog.getBlog_name());
        assertEquals("sample.jpg", blog.getImage());
        assertEquals("Sample description", blog.getDescription());
        assertEquals("Sample content", blog.getContent());
        assertEquals(5, blog.getEmployee_id());
    }

    @Test
    public void testBlogSameAuthor() {
        List<Blog> result = blogDao.blogSameAuthor(5);
        assertNotNull(result);
        assertEquals(1, result.size());
        Blog blog = result.get(0);
        assertEquals("Sample Blog", blog.getBlog_name());
        assertEquals("sample.jpg", blog.getImage());
        assertEquals("Sample description", blog.getDescription());
        assertEquals("Sample content", blog.getContent());
        assertEquals(5, blog.getEmployee_id());
    }

    @Test
    public void testAddBlog() throws SQLException {
        Blog blog = new Blog(1, "Test Blog", "test.jpg", "Test description", "Test content", 5);
        blogDao.addBlog(blog);

        // Kiểm tra xem blog đã được thêm vào database hay chưa
        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM Blog WHERE blog_name = 'Test Blog'");
            assertTrue(rs.next());
            assertEquals("test.jpg", rs.getString("image"));
            assertEquals("Test description", rs.getString("description"));
            assertEquals("Test content", rs.getString("content"));
            assertEquals(5, rs.getInt("employee_id"));
        }
    }

    @Test
    public void testEditBlog() throws SQLException {
        int blogId = blogDao.getAllBlog().get(0).getBlog_id();
        Blog blog = new Blog(blogId, "Updated Blog", "updated.jpg", "Updated description", "Updated content", 5);
        blogDao.editBlog(blog);

        // Kiểm tra xem blog đã được cập nhật hay chưa
        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM Blog WHERE blog_id = " + blogId);
            assertTrue(rs.next());
            assertEquals("Updated Blog", rs.getString("blog_name"));
            assertEquals("updated.jpg", rs.getString("image"));
            assertEquals("Updated description", rs.getString("description"));
            assertEquals("Updated content", rs.getString("content"));
            assertEquals(5, rs.getInt("employee_id"));
        }
    }

    @Test
    public void testDeleteBlog() throws SQLException {
        int blogId = blogDao.getAllBlog().get(0).getBlog_id();
        blogDao.deleteBlog(blogId);
        // Kiểm tra xem blog đã được xóa hay chưa
        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM Blog WHERE blog_id = 1");
            assertFalse(rs.next());
        }
    }

    @Test
    public void testPosterId() {
        int empId = blogDao.posterId(3);
        assertEquals(5, empId);
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
