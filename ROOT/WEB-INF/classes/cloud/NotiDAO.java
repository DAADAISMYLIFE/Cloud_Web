package cloud;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotiDAO {
    private Connection conn;

    public NotiDAO(Connection conn) {
        this.conn = conn;
    }

    // CREATE
    public void createNoti(Noti noti) throws SQLException {
        String sql = "INSERT INTO noti (title, content, user, imagePath, createdAt) VALUES (?, ?, ?, ?, NOW())";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            pstmt.setString(3, noti.getUser());
            pstmt.setString(4, noti.getImagePath()); // 이미지 경로 저장
            pstmt.executeUpdate();
        }
    }

    // READ (모든 게시글 조회)
    public List<Noti> getAllNotis() throws SQLException {
        String sql = "SELECT * FROM noti";
        List<Noti> notis = new ArrayList<>();
        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Noti noti = new Noti();
                noti.setId(rs.getInt("id"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setUser(rs.getString("user"));
                noti.setImagePath(rs.getString("imagePath"));
                noti.setCreatedAt(rs.getString("createdAt"));
                notis.add(noti);
            }
        }
        return notis;
    }

    // READ (특정 게시글 조회)
    public Noti getNotiById(int id) throws SQLException {
        String sql = "SELECT * FROM noti WHERE id = ?";
        Noti noti = null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    noti = new Noti();
                    noti.setId(rs.getInt("id"));
                    noti.setTitle(rs.getString("title"));
                    noti.setContent(rs.getString("content"));
                    noti.setUser(rs.getString("user"));
                    noti.setImagePath(rs.getString("imagePath"));
                    noti.setCreatedAt(rs.getString("createdAt"));
                }
            }
        }
        return noti;
    }

        // 페이지네이션용
    public List<Noti> getNotis(int page, int pageSize) throws SQLException {
        String sql = "SELECT * FROM noti LIMIT ?, ?";
        List<Noti> notis = new ArrayList<>();

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, (page - 1) * pageSize); // OFFSET
            pstmt.setInt(2, pageSize); // LIMIT

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Noti noti = new Noti();
                    noti.setId(rs.getInt("id"));
                    noti.setTitle(rs.getString("title"));
                    noti.setContent(rs.getString("content"));
                    noti.setUser(rs.getString("user"));
                    noti.setCreatedAt(rs.getString("createdAt")); // Timestamp로 변경
                    notis.add(noti);
                }
            }
        }
        return notis;
    }

    // 전체 게시글 수 가져오는 메서드 추가
    public int getTotalNotis() {
        int totalNoti = 0;
        try {
            String sql = "SELECT COUNT(*) FROM noti";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                totalNoti = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalNoti;
    }

    // UPDATE
    public void updateNoti(Noti noti) throws SQLException {
        String sql = "UPDATE noti SET title = ?, content = ?, user = ? imagePath = ? WHERE id = ? ";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            pstmt.setString(3, noti.getUser());
            pstmt.setString(4, noti.getImagePath());
            pstmt.setInt(5, noti.getId());
            pstmt.executeUpdate();
        }
    }

    // DELETE
    public void deleteNoti(int id) throws SQLException {
        String sql = "DELETE FROM noti WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}
