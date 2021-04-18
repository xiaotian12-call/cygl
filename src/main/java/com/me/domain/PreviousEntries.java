package com.me.domain;

public class PreviousEntries {
private String year;
private int count;
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public PreviousEntries(String year, int count) {
	super();
	this.year = year;
	this.count = count;
}
public PreviousEntries() {
	super();
}

}
