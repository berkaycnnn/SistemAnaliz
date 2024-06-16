package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.SpsDtls;

public class SpsDAOImpl implements SpsDAO {
    
    private Connection conn;

    public SpsDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean spsekle(SpsDtls s) {
        boolean f = false;
        try {
            String sql = "insert into sps_dtls(spsad, spsürün, fiyat, spstür, kontrol, resim, email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getSpsad());
            ps.setString(2, s.getSpsürün());
            ps.setString(3, s.getFiyat());
            ps.setString(4, s.getSpstür());
            ps.setString(5, s.getKontrol());
            ps.setString(6, s.getResimad());
            ps.setString(7, s.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<SpsDtls> getbütünsps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s = null;

        try {
            String sql = "select * from sps_dtls";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s = new SpsDtls();
                s.setSpsId(rs.getInt(1));
                s.setSpsad(rs.getString(2));
                s.setSpsürün(rs.getString(3));
                s.setFiyat(rs.getString(4));
                s.setSpstür(rs.getString(5));
                s.setKontrol(rs.getString(6));
                s.setResim(rs.getString(7));
                s.setEmail(rs.getString(8));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public SpsDtls getSpsById(int id) {
        SpsDtls s = null;
        try {
            String sql = "select * from sps_dtls where spsId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s = new SpsDtls();
                s.setSpsId(rs.getInt(1));
                s.setSpsad(rs.getString(2));
                s.setSpsürün(rs.getString(3));
                s.setFiyat(rs.getString(4));
                s.setSpstür(rs.getString(5));
                s.setKontrol(rs.getString(6));
                s.setResim(rs.getString(7));
                s.setEmail(rs.getString(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public boolean spsduzenlebtn(SpsDtls s) {
        boolean f = false;
        try {
            String sql = "update sps_dtls set spsad=?,spsürün=?,fiyat=?,kontrol=? where spsId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getSpsad());
            ps.setString(2, s.getSpsürün());
            ps.setString(3, s.getFiyat());
            ps.setString(4, s.getKontrol());
            ps.setInt(5, s.getSpsId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean spssilbtn(int id) {
        boolean f = false;
        try {
            String sql = "delete from sps_dtls where spsId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<SpsDtls> getsimdikisps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s = null;
        try {
            String sql = "select * from sps_dtls where kontrol=? order by spsId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Aktif");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                s = new SpsDtls();
                s.setSpsId(rs.getInt(1));
                s.setSpsad(rs.getString(2));
                s.setSpsürün(rs.getString(3));
                s.setFiyat(rs.getString(4));
                s.setSpstür(rs.getString(5));
                s.setKontrol(rs.getString(6));
                s.setResim(rs.getString(7));
                s.setEmail(rs.getString(8));
                list.add(s);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<SpsDtls> getyenisps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s2 = null;
        try {
            String sql = "select * from sps_dtls where spstür=? and kontrol=? order by spsId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Yeni");
            ps.setString(2, "Aktif");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                s2 = new SpsDtls();
                s2.setSpsId(rs.getInt(1));
                s2.setSpsad(rs.getString(2));
                s2.setSpsürün(rs.getString(3));
                s2.setFiyat(rs.getString(4));
                s2.setSpstür(rs.getString(5));
                s2.setKontrol(rs.getString(6));
                s2.setResim(rs.getString(7));
                s2.setEmail(rs.getString(8));
                list.add(s2);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<SpsDtls> geteskisps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s3 = null;
        try {
            String sql = "select * from sps_dtls where spstür=? and kontrol=? order by spsId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Eski");
            ps.setString(2, "Aktif");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                s3 = new SpsDtls();
                s3.setSpsId(rs.getInt(1));
                s3.setSpsad(rs.getString(2));
                s3.setSpsürün(rs.getString(3));
                s3.setFiyat(rs.getString(4));
                s3.setSpstür(rs.getString(5));
                s3.setKontrol(rs.getString(6));
                s3.setResim(rs.getString(7));
                s3.setEmail(rs.getString(8));
                list.add(s3);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<SpsDtls> getBtnSimdikisps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s4 = null;
        try {
            String sql = "select * from sps_dtls where kontrol=? order by spsId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Aktif");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s4 = new SpsDtls();
                s4.setSpsId(rs.getInt(1));
                s4.setSpsad(rs.getString(2));
                s4.setSpsürün(rs.getString(3));
                s4.setFiyat(rs.getString(4));
                s4.setSpstür(rs.getString(5));
                s4.setKontrol(rs.getString(6));
                s4.setResim(rs.getString(7));
                s4.setEmail(rs.getString(8));
                list.add(s4); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<SpsDtls> getBtnYenisps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s5 = null;
        try {
        	String sql = "select * from sps_dtls where kontrol=? order by spsId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Aktif");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s5 = new SpsDtls();
                s5.setSpsId(rs.getInt(1));
                s5.setSpsad(rs.getString(2));
                s5.setSpsürün(rs.getString(3));
                s5.setFiyat(rs.getString(4));
                s5.setSpstür(rs.getString(5));
                s5.setKontrol(rs.getString(6));
                s5.setResim(rs.getString(7));
                s5.setEmail(rs.getString(8));
                list.add(s5);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<SpsDtls> getBtnEskisps() {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s6 = null;
        try {
        	String sql = "select * from sps_dtls where kontrol=? order by spsId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Aktif");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s6 = new SpsDtls();
                s6.setSpsId(rs.getInt(1));
                s6.setSpsad(rs.getString(2));
                s6.setSpsürün(rs.getString(3));
                s6.setFiyat(rs.getString(4));
                s6.setSpstür(rs.getString(5));
                s6.setKontrol(rs.getString(6));
                s6.setResim(rs.getString(7));
                s6.setEmail(rs.getString(8));
                list.add(s6);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<SpsDtls> getSpsByAra(String ara) {
        List<SpsDtls> list = new ArrayList<>();
        SpsDtls s7 = null;
        try {
            String sql = "select * from sps_dtls where (spsad like ? or spsürün like ? or spstür like ?) and kontrol=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + ara + "%");
            ps.setString(2, "%" + ara + "%");
            ps.setString(3, "%" + ara + "%");
            ps.setString(4, "Aktif");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s7 = new SpsDtls();
                s7.setSpsId(rs.getInt(1));
                s7.setSpsad(rs.getString(2));
                s7.setSpsürün(rs.getString(3));
                s7.setFiyat(rs.getString(4));
                s7.setSpstür(rs.getString(5));
                s7.setKontrol(rs.getString(6));
                s7.setResim(rs.getString(7));
                s7.setEmail(rs.getString(8));
                list.add(s7);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
