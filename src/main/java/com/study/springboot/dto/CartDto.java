package com.study.springboot.dto;
public class CartDto {
    private int cart_idx;
    private String users_id;
    private String cart_product_name;
    private int product_idx;
    private int cart_count;
    
    public CartDto() {
        super();
    }
    public CartDto(int cart_idx, String users_id, String cart_product_name, int product_idx, int cart_count) {
        super();
        this.cart_idx = cart_idx;
        this.users_id = users_id;
        this.cart_product_name = cart_product_name;
        this.product_idx = product_idx;
        this.cart_count = cart_count;
    }
    public int getCart_idx() {
        return cart_idx;
    }
    public void setCart_idx(int cart_idx) {
        this.cart_idx = cart_idx;
    }
    public String getUsers_id() {
        return users_id;
    }
    public void setUsers_id(String users_id) {
        this.users_id = users_id;
    }
    public String getCart_product_name() {
        return cart_product_name;
    }
    public void setCart_product_name(String cart_product_name) {
        this.cart_product_name = cart_product_name;
    }
    public int getProduct_idx() {
        return product_idx;
    }
    public void setProduct_idx(int product_idx) {
        this.product_idx = product_idx;
    }
    public int getCart_count() {
        return cart_count;
    }
    public void setCart_count(int cart_count) {
        this.cart_count = cart_count;
    }
    
    
}