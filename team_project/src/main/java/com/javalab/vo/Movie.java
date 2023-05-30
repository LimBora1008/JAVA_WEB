package com.javalab.vo;

public class Movie {
	private int movie_id;
	private String movie_name;
	private int movie_age;
	private String movie_release;
	private String movie_end;
	private String movie_intro;
	private String movie_director;
	private String movie_genre;
	private String movie_rtime;
	private String movie_cast;
	private int movie_price;
	private String movie_image;
	
	public Movie(int movie_id, String movie_name) {
		super();
		this.movie_id = movie_id;
		this.movie_name = movie_name;
	}
	
	public Movie(String movie_name, String movie_image) {
        this.movie_name = movie_name;
        this.movie_image = movie_image;
    }

	public String getMovie_image() {
		return movie_image;
	}

	public void setMovie_image(String movie_image) {
		this.movie_image = movie_image;
	}

	public Movie() {
	}

	public Movie(int movie_id, String movie_name, int movie_age, String movie_release, String movie_end,
			String movie_intro, String movie_director, String movie_genre, String movie_rtime, String movie_cast,
			int movie_price) {
		this.movie_id = movie_id;
		this.movie_name = movie_name;
		this.movie_age = movie_age;
		this.movie_release = movie_release;
		this.movie_end = movie_end;
		this.movie_intro = movie_intro;
		this.movie_director = movie_director;
		this.movie_genre = movie_genre;
		this.movie_rtime = movie_rtime;
		this.movie_cast = movie_cast;
		this.movie_price = movie_price;
	}

	public int getMovie_id() {
		return this.movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_name() {
		return this.movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public int getMovie_age() {
		return this.movie_age;
	}

	public void setMovie_age(int movie_age) {
		this.movie_age = movie_age;
	}

	public String getMovie_release() {
		return this.movie_release;
	}

	public void setMovie_release(String movie_release) {
		this.movie_release = movie_release;
	}

	public String getMovie_end() {
		return this.movie_end;
	}

	public void setMovie_end(String movie_end) {
		this.movie_end = movie_end;
	}

	public String getMovie_intro() {
		return this.movie_intro;
	}

	public void setMovie_intro(String movie_intro) {
		this.movie_intro = movie_intro;
	}

	public String getMovie_director() {
		return this.movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_genre() {
		return this.movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public String getMovie_rtime() {
		return this.movie_rtime;
	}

	public void setMovie_rtime(String movie_rtime) {
		this.movie_rtime = movie_rtime;
	}

	public String getMovie_cast() {
		return this.movie_cast;
	}

	public void setMovie_cast(String movie_cast) {
		this.movie_cast = movie_cast;
	}

	public int getMovie_price() {
		return this.movie_price;
	}

	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
}