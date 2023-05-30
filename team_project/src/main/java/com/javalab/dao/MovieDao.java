package com.javalab.dao;

import com.javalab.vo.Movie;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDao {
	private Connection con;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private static DataSource dataSource;

	private static MovieDao instance;

	public MovieDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static MovieDao getInstance() {
		if (instance == null)
			instance = new MovieDao();
		return instance;
	}

	private void close() {
		try {
			if (this.rs != null)
				this.rs.close();
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.con != null)
				this.con.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<Movie> getMovieList(int page, int pageSize) { // ��� ������
		ArrayList<Movie> movieList = new ArrayList<>();

		int startIndex = (page - 1) * pageSize;
		int endIndex = page * pageSize;

		String imageFolder = "images/movie/"; // �̹��� ���� ���

		String[] imageFiles = getImageFilesFromFolder(imageFolder, page, pageSize);

		for (int i = 0; i < imageFiles.length; i++) {
			int movieId = (page - 1) * pageSize + i + 1;
			String movieName = getMovieNameFromDatabase(movieId);

			Movie movie = new Movie(movieId, movieName);
			movie.setMovie_image(imageFolder + imageFiles[i]);
			
			//
			movie.setMovie_id(movieId);
			
			movieList.add(movie);
		}

		return movieList;
	}

	private String getMovieNameFromDatabase(int movieId) { // ��ȭ�̸�
		String movieName = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn
						.prepareStatement("SELECT movie_name FROM tbl_movie WHERE movie_id = ?")) {
			pstmt.setInt(1, movieId);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					movieName = rs.getString("movie_name");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return movieName;
	}
	

	
    private String[] getImageFilesFromFolder(String folderPath, int page, int pageSize) {
        // ��ü �̹��� ���ϵ��� ���
        String[] allImageFiles = {
            "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg",
            "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg",
            "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg", "21.jpg",
            "22.jpg", "23.jpg", "24.jpg", "25.jpg", "26.jpg", "27.jpg", "28.jpg",
            "29.jpg", "30.jpg", "31.jpg", "32.jpg", "33.jpg", "34.jpg", "35.jpg",
            "36.jpg", "37.jpg", "38.jpg", "39.jpg", "40.jpg", "41.jpg", "42.jpg",
            "43.jpg", "44.jpg", "45.jpg", "46.jpg", "47.jpg", "48.jpg", "49.jpg",
            "50.jpg", "51.jpg", "52.jpg", "53.jpg", "54.jpg", "55.jpg", "56.jpg",
            "57.jpg", "58.jpg", "59.jpg", "60.jpg", "61.jpg", "62.jpg", "63.jpg",
            "64.jpg", "65.jpg", "66.jpg",
        };
        // �������� �ش��ϴ� �̹��� ���ϵ��� ����
        int startIndex = (page - 1) * pageSize;
        int endIndex = startIndex + pageSize;
        endIndex = Math.min(endIndex, allImageFiles.length);

        // ����� �̹��� ���ϵ��� �迭�� ��ȯ�Ͽ� ��ȯ
        return Arrays.copyOfRange(allImageFiles, startIndex, endIndex);
    }

    public List<Movie> getUpcomingMovies() {
        List<Movie> movieList = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT movie_id, movie_name FROM tbl_movie")) {
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int movieId = rs.getInt("movie_id");
                    String movieName = rs.getString("movie_name");

                    Movie movie = new Movie();
                    movie.setMovie_id(movieId);
                    movie.setMovie_name(movieName);
                    movie.setMovie_image("images/movie/" + movieId + ".jpg");

                    movieList.add(movie);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movieList;
	}

	// ��� ��ȭ ���
	public List<Movie> showAllMovies() {
		String query = "select * from tbl_movie order by movie_id asc";
		List<Movie> movieList = null;
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.rs = this.pstmt.executeQuery();
			movieList = new ArrayList<>();
			Movie movieVo = null;
			while (this.rs.next()) {
				movieVo = new Movie();
				movieVo.setMovie_id(this.rs.getInt("MOVIE_ID"));
				movieVo.setMovie_name(this.rs.getString("MOVIE_NAME"));
				movieVo.setMovie_age(this.rs.getInt("MOVIE_AGE"));
				movieVo.setMovie_release(this.rs.getString("MOVIE_RELEASE"));
				movieVo.setMovie_end(this.rs.getString("MOVIE_END"));
				movieVo.setMovie_intro(this.rs.getString("MOVIE_INTRO"));
				movieVo.setMovie_director(this.rs.getString("MOVIE_DIRECTOR"));
				movieVo.setMovie_genre(this.rs.getString("MOVIE_GENRE"));
				movieVo.setMovie_rtime(this.rs.getString("MOVIE_RTIME"));
				movieVo.setMovie_cast(this.rs.getString("MOVIE_CAST"));
				movieVo.setMovie_price(this.rs.getInt("MOVIE_PRICE"));
				movieList.add(movieVo);
				movieVo = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return movieList;
	}

	//
	public Movie selectOneMovie(String id) {
		String query = "select * from tbl_movie where movie_id=?";
		Movie movieVo = null;
		int movieId = Integer.parseInt(id);
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setInt(1, movieId);
			this.rs = this.pstmt.executeQuery();
			movieVo = new Movie();
			while (this.rs.next()) {
				movieVo = new Movie();
				movieVo.setMovie_id(this.rs.getInt("MOVIE_ID"));
				movieVo.setMovie_name(this.rs.getString("MOVIE_NAME"));
				movieVo.setMovie_age(this.rs.getInt("MOVIE_AGE"));
				movieVo.setMovie_release(this.rs.getString("MOVIE_RELEASE"));
				movieVo.setMovie_end(this.rs.getString("MOVIE_END"));
				movieVo.setMovie_intro(this.rs.getString("MOVIE_INTRO"));
				movieVo.setMovie_director(this.rs.getString("MOVIE_DIRECTOR"));
				movieVo.setMovie_genre(this.rs.getString("MOVIE_GENRE"));
				movieVo.setMovie_rtime(this.rs.getString("MOVIE_RTIME"));
				movieVo.setMovie_cast(this.rs.getString("MOVIE_CAST"));
				movieVo.setMovie_price(this.rs.getInt("MOVIE_PRICE"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return movieVo;
	}
}