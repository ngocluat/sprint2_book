package com.sprint2.demo.dto.user.payload;

public class FacebookRequest {
    private String email;
    private String gender;
    private String accessToken;
    private String location;

    public FacebookRequest() {
        /**
         * @Author HuuNQ
         */
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
