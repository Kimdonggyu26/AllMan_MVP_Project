package com.mvp.semi.movie.model.vo;

public class Movie {
	private int movie_no;
	private String movieTitle;
	private String movieContent;
	private String genre;
	private int playTime;
	private String country;
	private String ageLv;
	private String openDate;
	private String director;
	private int audienceCount;
	private String actor;
	private String preview;
	private String status;
	private int number;
	private String titlePath;
	private String contentPath;
	private int tasteNo;

	public Movie() {
	}

	public Movie(int movie_no, String movieTitle, String movieContent, String genre, int playTime, String country,
			String ageLv, String openDate, String director, int audienceCount, String actor, String preview,
			String status, int number, String titlePath, String contentPath, int tasteNo) {
		super();
		this.movie_no = movie_no;
		this.movieTitle = movieTitle;
		this.movieContent = movieContent;
		this.genre = genre;
		this.playTime = playTime;
		this.country = country;
		this.ageLv = ageLv;
		this.openDate = openDate;
		this.director = director;
		this.audienceCount = audienceCount;
		this.actor = actor;
		this.preview = preview;
		this.status = status;
		this.number = number;
		this.titlePath = titlePath;
		this.contentPath = contentPath;
		this.tasteNo = tasteNo;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieContent() {
		return movieContent;
	}

	public void setMovieContent(String movieContent) {
		this.movieContent = movieContent;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getPlayTime() {
		return playTime;
	}

	public void setPlayTime(int playTime) {
		this.playTime = playTime;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAgeLv() {
		return ageLv;
	}

	public void setAgeLv(String ageLv) {
		this.ageLv = ageLv;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public int getAudienceCount() {
		return audienceCount;
	}

	public void setAudienceCount(int audienceCount) {
		this.audienceCount = audienceCount;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getTitlePath() {
		return titlePath;
	}

	public void setTitlePath(String titlePath) {
		this.titlePath = titlePath;
	}
	
	public String getContentPath() {
		return contentPath;
	}

	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}

	public int getTasteNo() {
		return tasteNo;
	}

	public void setTasteNo(int tasteNo) {
		this.tasteNo = tasteNo;
	}

	@Override
	public String toString() {
		return "Movie [movie_no=" + movie_no + ", movieTitle=" + movieTitle + ", movieContent=" + movieContent
				+ ", genre=" + genre + ", playTime=" + playTime + ", country=" + country + ", ageLv=" + ageLv
				+ ", openDate=" + openDate + ", director=" + director + ", audienceCount=" + audienceCount + ", actor="
				+ actor + ", preview=" + preview + ", status=" + status + ", number=" + number + ", TitlePath="
				+ titlePath + ", ContentPath=" + contentPath + ", tasteNo=" + tasteNo + "]";
	}

}