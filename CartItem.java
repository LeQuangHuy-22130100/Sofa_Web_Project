package vn.edu.hcmuaf.fit.project.DAO.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CartItem {
    private int cartId;
    private Product productID;
    private User userID;
    private double quantity;
    private String name;
    private String image;
    private int quanlity;

    public CartItem(Product product, int i) {
    }

    public void addQuanlity(int quanlity){
        this.quanlity+=quanlity;
    }

    public double getTotalPrice(){
        return this.quanlity*this.productID.getPrice();
    }
    @Override
    public String toString() {
        return "cartShopping{" +
                "cartId=" + cartId +
                ", productID=" + productID +
                ", userID=" + userID +
                ", quantity=" + quantity +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
