package cloud;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ActivityDAO {
    private Connection conn;

    public ActivityDAO(Connection conn) {
        this.conn = conn;
    }

    // CREATE
    public void createActivity(Activity activity) throws SQLException {
        String sql = "INSERT INTO activity (title, content, user, imagePath, createdAt) VALUES (?, ?, ?, ?, NOW())";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, activity.getTitle());
            pstmt.setString(2, activity.getContent());
            pstmt.setString(3, activity.getUser());
            pstmt.setString(4, activity.getImagePath()); // 이미지 경로 저장
            pstmt.executeUpdate();
        }
    }

    // READ (모든 게시글 조회)
    public List<Activity> getAllActivitys() throws SQLException {
        String sql = "SELECT * FROM activity";
        List<Activity> activitys = new ArrayList<>();
        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Activity activity = new Activity();
                activity.setId(rs.getInt("id"));
                activity.setTitle(rs.getString("title"));
                activity.setContent(rs.getString("content"));
                activity.setUser(rs.getString("user"));
                activity.setImagePath(rs.getString("imagePath"));
                activity.setCreatedAt(rs.getString("createdAt"));
                activitys.add(activity);
            }
        }
        return activitys;
    }

    // READ (특정 게시글 조회)
    public Activity getActivityById(int id) throws SQLException {
        String sql = "SELECT * FROM activity WHERE id = ?";
        Activity activity = null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    activity = new Activity();
                    activity.setId(rs.getInt("id"));
                    activity.setTitle(rs.getString("title"));
                    activity.setContent(rs.getString("content"));
                    activity.setUser(rs.getString("user"));
                    activity.setImagePath(rs.getString("imagePath"));
                    activity.setCreatedAt(rs.getString("createdAt"));
                }
            }
        }
        return activity;
    }

    // 페이지네이션용
    public List<Activity> getActivity(int page, int pageSize) throws SQLException {
        String sql = "SELECT * FROM activity ORDER BY id DESC LIMIT ?, ? ";
        List<Activity> activities = new ArrayList<>();

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, (page - 1) * pageSize); // OFFSET
            pstmt.setInt(2, pageSize); // LIMIT

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Activity activity = new Activity();
                    activity.setId(rs.getInt("id"));
                    activity.setTitle(rs.getString("title"));
                    activity.setContent(rs.getString("content"));
                    activity.setUser(rs.getString("user"));
                    activity.setImagePath(rs.getString("imagePath"));
                    activity.setCreatedAt(rs.getString("createdAt")); // Timestamp로 변경
                    activities.add(activity);
                }
            }
        }
        return activities;
    }

    // 전체 게시글 수 가져오는 메서드 추가
    public int getTotalActivity() {
        int totalActivity = 0;
        try {
            String sql = "SELECT COUNT(*) FROM activity";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                totalActivity = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalActivity;
    }

    // UPDATE
    public void updateActivity(Activity activity) throws SQLException {
        String sql = "UPDATE activity SET title = ?, content = ?, user = ? imagePath = ? WHERE id = ? ";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, activity.getTitle());
            pstmt.setString(2, activity.getContent());
            pstmt.setString(3, activity.getUser());
            pstmt.setString(4, activity.getImagePath());
            pstmt.setInt(5, activity.getId());
            pstmt.executeUpdate();
        }
    }

    // DELETE
    public void deleteActivity(int id) throws SQLException {
        String sql = "DELETE FROM activity WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}
